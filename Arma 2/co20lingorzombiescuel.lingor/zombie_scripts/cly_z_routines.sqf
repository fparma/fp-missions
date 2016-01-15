//Zombie behavior routines written by Celery

_zombie=_this select 0;
_zombietype=_this select 1;
_radius=_this select 2;
_wait=time+random 35;
_victimchangecooldown=time;
_victim=objNull;
_noisewait=5+random 40;
_armored=_zombietype in ["armored","slow armored"] or typeOf _zombie in CLY_armoredzombieclasses;

//Aggro radius
_maxradius=if ({_zombie distance _x<=CLY_altmaxaggroradiusrange} count CLY_altmaxaggroradiusobjects==0) then {CLY_maxaggroradius} else {CLY_altmaxaggroradius};
if (_radius==0) then {_radius=CLY_minaggroradius+random (_maxradius-CLY_minaggroradius)};
if (_zombietype in ["crawler","sneaker"]) then {_radius=_maxradius};
_victimradius=CLY_randomvictimradius;
if (_victimradius>0 and _victimradius<=1) then {_victimradius=_radius*_victimradius};

//Killed EH
_zombie addEventHandler [
	"Killed",
	{
		if (random 1<0.4) then {
			_zombie=_this select 0;
			_sound=CLY_noises_die select floor random count CLY_noises_die;
			_object="HeliHEmpty" createVehicleLocal [0,0,0];
			_object attachTo [_zombie,[0,0,1.5]];
			_object say3D _sound;
			[_object] spawn {sleep 5;deleteVehicle (_this select 0)};
			CLY_z_attackpv=[_zombie,_sound];
			publicVariable "CLY_z_attackpv";
		};
	}
];

//Determine whether zombie carries a bandage
_bandage=false;
if (random 1<=CLY_zombiebandagechance or _armored) then {
	_bandage=true;
	_zombie setVariable ["CLY_removedead",false];
};

//Add magazine
if (random 1<=CLY_zombiemagazinechance or _armored) then {
	_mag=CLY_zombiemagazines select floor random count CLY_zombiemagazines;
	while {typeName _mag=="ARRAY"} do {
		_mag=_mag select floor random count _mag;
	};
	_zombie addMagazine _mag;
};

sleep random 1;

while {alive _zombie} do {
	///Idle///
	while {isNull (_zombie getVariable "victim") and alive _zombie} do {
		//Initiate idling
		if (_zombietype in ["normal","surprise","crawler","sneaker","armored","slow armored"]) then {_zombie lookAt objNull};
		if (_zombietype in ["crawler","passive crawler","sneaker","ambusher"]) then {_zombie setUnitPos "DOWN"};
		
		//Noise
		if (_zombietype=="normal" and time>_noisewait) then {
			_sound=CLY_noises_idle select floor random count CLY_noises_idle;
			_zombie say3D _sound;
			CLY_z_noisepv=[_zombie,_sound];
			publicVariable "CLY_z_noisepv";
			_noisewait=time+5+random 40;
		};
		
		//Next waypoint
		if (!(_zombietype in ["passive","passive crawler","ambusher"]) and time>_wait) then {
			_zombie doMove getPos _zombie;
			_movepos=[0,0,1000];
			while {surfaceIsWater _movepos or _movepos select 2==1000} do {
				_movepos=[(getPos _zombie select 0)-30+random 60,(getPos _zombie select 1)-30+random 60,0];
			};
			_zombie doMove _movepos;
			_zombie setSpeedMode "LIMITED";
			_wait=time+10+random 35;
		};
		
		//Search nearest victim
		_dist=_radius;
		if (_zombie getVariable "horde") then {_dist=10000};
		_nearest=objNull;
		_victims=[];
		_victim=objNull;
		{
			if (
				(_zombie distance vehicle _x<_dist and (!(_zombietype in ["normal","surprise","armored","slow armored"]) or (_zombie getVariable "horde" and _x in CLY_players) or (currentWeapon vehicle _x!="" and (_zombie knowsAbout vehicle _x>0 or _zombie distance vehicle _x<3))))
				or (_zombietype in ["normal","surprise","armored","slow armored"] and currentWeapon vehicle _x=="" and _zombie distance vehicle _x<_dist*CLY_unarmedaggromultiplier and _zombie knowsAbout vehicle _x>0)
				or (_x!=vehicle _x and isEngineOn vehicle _x and getNumber (configFile/"CfgVehicles"/(typeOf vehicle _x)/"isbicycle")==0 and _zombie distance vehicle _x<_dist*CLY_vehicleaggromultiplier)
			)
			then {
				_nearest=_x;
				_dist=_zombie distance vehicle _x;
			};
		} forEach CLY_zombievictims;
		
		//Determine victim
		if (!isNull _nearest) then {
			if (_victimradius>0) then {{if (vehicle _x distance vehicle _nearest<_victimradius and _zombie knowsAbout vehicle _x>0) then {_victims set [count _victims,_x]}} forEach CLY_zombievictims};
			if (count _victims>1) then {_victim=_victims select floor random count _victims} else {_victim=_nearest};
			_zombie setVariable ["victim",_victim];
			if (_zombietype=="ambusher") then {_zombie setUnitPos "UP"};
		};
		
		if (isNull (_zombie getVariable "victim") and alive _zombie) then {sleep 1} else {_noisewait=0};
	};
	
	///Combat///
	while {!isNull (_zombie getVariable "victim") and alive _zombie} do {
		_victim=_zombie getVariable "victim";
		_randomradius=0;
		_movepos=[(getPosATL vehicle _victim select 0)-_randomradius+random _randomradius*2,(getPosATL vehicle _victim select 1)-_randomradius+random _randomradius*2,getPosATL vehicle _victim select 2];
		_newmovepos=_movepos;
		_zombie doMove _movepos;
		_zombie lookAt _victim;
		
		_newmovedist=2.5*(_zombie distance vehicle _victim)*0.2;
		if (_newmovedist<2.5) then {_newmovedist=2.5};
		
		//Give up the chase
		if (!(_zombie getVariable "horde") and _zombie distance vehicle _victim>CLY_chasegiveupdist) then {_zombie setVariable ["victim",objNull]};
		
		//Chase
		while {!isNull (_zombie getVariable "victim") and alive _zombie and getPosATL vehicle _victim distance _movepos<_newmovedist and ((_zombie getVariable "horde") or _zombie distance vehicle _victim<CLY_chasegiveupdist)} do {
			if (_zombietype!="slow armored") then {_zombie setSpeedMode "FULL"} else {_zombie setSpeedMode "LIMITED"};
			if (_zombietype=="sneaker" and (_zombie distance _victim<25 or damage _zombie>0)) then {_zombie setUnitPos "UP"};
			
			//Noise
			if (time>_noisewait) then {
				if (_zombietype=="normal" or _zombie distance _victim<4) then {
					_sound=CLY_noises_chase select floor random count CLY_noises_chase;
					_zombie say3D _sound;
					CLY_z_noisepv=[_zombie,_sound];
					publicVariable "CLY_z_noisepv";
					_noisewait=time+5+random 10;
				} else {
					if (_zombie distance _victim<12 and unitPos _zombie!="DOWN" and canStand _zombie) then {
						_sound=CLY_noises_chase select floor random count CLY_noises_chase;
						_zombie say3D _sound;
						CLY_z_noisepv=[_zombie,_sound];
						publicVariable "CLY_z_noisepv";
						_noisewait=time+5+random 10;
					};
				};
			};
			
			//Change victim
			if (time>_victimchangecooldown) then {
				_dist=_zombie distance vehicle _victim;
				_nearest=objNull;
				{
					if (
						_zombie distance vehicle _x<_dist and (
							_zombie distance vehicle _x<2.75
						 	or (_zombie knowsAbout _x>0 and (_zombie distance vehicle _x)*(_zombie distance vehicle _victim)^-1<0.5)
						)
					) then {
						_nearest=_x;
						_dist=_zombie distance vehicle _x;
					};
				} forEach CLY_zombievictims;
				if (!isNull _nearest) then {
					_victim=_nearest;
					_zombie setVariable ["victim",_victim];
					_victimchangecooldown=time+5;
				};
			};
			
			if (_zombie getVariable "victim"!=_victim) then {_victim=(_zombie getVariable "victim");_victimchangecooldown=time+10};
			if (!alive _victim or !(_victim in CLY_zombievictims)) then {_zombie setVariable ["victim",objNull]};
			
			//Attack
			if (!CLY_cutscene and alive _victim and ((_zombie distance vehicle _victim<2.75 and (getPosASL _victim select 2)-(getPosASL _zombie select 2)<1.5 and (getPosASL _victim select 2)-(getPosASL _zombie select 2)>-1) or (vehicle _victim!=_victim and _zombie distance vehicle _victim<6))) then {
				_anim="awoppercmstpsgthwnondnon_end";
				if ((_zombie selectionPosition "launcher" select 2)<0.5372) then {_anim="awopppnemstpsgthwnondnon_end"};
				_sound=CLY_noises_attack select floor random count CLY_noises_attack;
				_object="HeliHEmpty" createVehicleLocal [0,0,0];
				_object attachTo [_zombie,[0,0,1.5]];
				_object say3D _sound;
				[_object] spawn {sleep 2;deleteVehicle (_this select 0)};
				_zombie switchMove _anim;
				CLY_z_attackpv=[_zombie,_sound,_anim];
				publicVariable "CLY_z_attackpv";
				_zombie setVectorDir [(getPos vehicle _victim select 0)-(getPos _zombie select 0),(getPos vehicle _victim select 1)-(getPos _zombie select 1),0];
				
				_claw=1;
				if (damage _victim>0.28) then {_claw=2};
				if (damage _victim>0.59) then {_claw=3};
				
				if (vehicle _victim==_victim) then {
					_sound=CLY_noises_scream select floor random count CLY_noises_scream;
					if (typeOf _victim in ["Fin","Pastor"]) then {_sound=CLY_noises_yelp select floor random count CLY_noises_yelp};
					_object="HeliHEmpty" createVehicleLocal [0,0,0];
					_object attachTo [_victim,[0,0,1.5]];
					_object say3D _sound;
					[_object] spawn {sleep 5;deleteVehicle (_this select 0)};
					[_victim,_claw] call CLY_z_claw;
					CLY_z_victimpv=[_victim,_sound,_claw];
					publicVariable "CLY_z_victimpv";
					_victim setDamage (damage _victim+0.31)
				} else {
					_damage=damage vehicle _victim+2/getNumber (configFile/"CfgVehicles"/(typeOf vehicle _victim)/"armor");
					if (_damage<=0.99) then {
						vehicle _victim setDamage _damage;
					} else {
						vehicle _victim setDamage 0.99;
						{_x action ["eject",vehicle _victim]} forEach crew vehicle _victim;
					};
				};
				sleep 1.5;
			};
			
			_newmovedist=2.5*(_zombie distance vehicle _victim)*0.2;
			if (_newmovedist<2.5) then {_newmovedist=2.5};
			
			sleep 1;
		};
	};
};

//Add bandage
if (_bandage and _zombie getVariable "victim"!=_zombie) then {
	_action=[
		format ["Take bandage",_leftstring],
		"zombie_scripts\cly_z_takebandage.sqs",
		1,
		1.4,
		true,
		true,
		"",
		"_this!=_target and !alive _target and _this distance _target<4 and _this getVariable 'CLY_healings'>=0 and !(_this isKindOf 'Animal')"
	];
	_zombie addAction _action;
	CLY_healbandagepv=[_zombie,_action];
	publicVariable "CLY_healbandagepv";
	_h="HeliHEmpty" createVehicle getPos _zombie;
	_h attachTo [_zombie,[0,0,0]];
};

if (_zombie getVariable "victim"==_zombie) then {
	deleteVehicle _zombie;
};