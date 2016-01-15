//zombie routines, originally written by Celery, edited by Cuel.
private ["_zombie","_zombietype","_radius","_wait","_victimchangecooldown","_victim","_noisewait","_armored","_attackdist","_maxradius"];

_zombie=_this select 0;
if (isNull _zombie or !alive _zombie) exitWith {};
_zombietype=_this select 1;
_radius=_this select 2;
_wait=time+random 35;
_victimchangecooldown=time;
_victim=objNull;
_noisewait=5+random 40;
_armored=_zombietype in ["armored","slow armored"] or typeOf _zombie in CLY_armoredzombieclasses;
_attackdist=3;

if (!(_zombie getVariable ["horde",false])) then {
	_zombie doMove [(getPosATL _zombie select 0)-50+random 100,(getPosATL _zombie select 1)-50+random 100,0];
	_zombie setSpeedMode "LIMITED";
};

//Aggro radius
_maxradius=CLY_maxaggroradius;
if (_radius==0) then {_radius=CLY_minaggroradius+random (_maxradius-CLY_minaggroradius)};
if (_zombietype in ["crawler","sneaker"]) then {_radius=_maxradius};
_victimradius=CLY_randomvictimradius;
if (_victimradius>0 and _victimradius<=1) then {_victimradius=_radius*_victimradius};

	//Add magazine
if (random 1<=CLY_zombiemagazinechance or _armored) then {
	_mag=CLY_zombiemagazines select floor random count CLY_zombiemagazines;
	while {typeName _mag=="ARRAY"} do {
		_mag=_mag select floor random count _mag;
	};
	_zombie addMagazine _mag;
};

//add med items if doctor or armored
if (_zombie isKindOf "Doctor" || _armored) then {
	private ["_b"];
	_b = floor random 3;
	if (_b > 0) then {for "_i" from 1 to _b do {_zombie addMagazine "ACE_BANDAGE";};};
	_b = floor random 2;
	if (_b > 0) then {for "_i" from 1 to _b do {_zombie addMagazine "ACE_MEDKIT";};};
	if (random 1 > 0.6) then {
		_zombie addMagazine "ACE_Epinephrine";
	};
	_zombie addMagazine "ACE_MORPHINE";	
}else{
	if ((_zombie isKindOf "SoldierWB" || _zombie isKindOf "SoldierEB" || _zombie isKindOf "SoldierGB") && (random 1 <= CUEL_mZombiesmedchance)) then {
			if (random 1 < 0.5) then {
				_zombie addMagazine "ACE_BANDAGE";
			}else{
				if ((random 1)< 0.2) then {
				_zombie addMagazine "ACE_MORPHINE";};
				if ((random 1) < 0.1) then {
				_zombie addMagazine "ACE_Epinephrine";};
		};
	};
};

//Killed EH
_zombie addEventHandler [
	"Killed",
	{
		if (random 1<0.4) then {
			_z=_this select 0;
			_s=CLY_noises_die select floor random count CLY_noises_die;
			CUEL_z_deathpv=[_z,_s];
			publicVariable "CUEL_z_deathpv";
			if (!isDedicated) then {
				_obj="HeliHEmpty" createVehicleLocal [0,0,0];
				_obj attachTo [_z,[0,0,1.5]];
				_obj say3D _s;
				_obj spawn {sleep 5;deleteVehicle _this};
			};
		};
	}
];

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
			[_zombie, _sound] call CBA_fnc_globalSay3d;
			_noisewait=time+5+random 40;
		};
		
		//Next waypoint
		if (!(_zombietype in ["passive","passive crawler","ambusher"]) and time>_wait) then {
			_movepos=[(getPosATL _zombie select 0)-30+random 60,(getPosATL _zombie select 1)-30+random 60,0];
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
			_distance=_zombie distance vehicle _x;
			if (_distance<_dist) then {
				if (
					(!(_zombietype in ["normal","surprise","armored","slow armored"]) or (_zombie getVariable "horde" and _x in CLY_players) or (currentWeapon vehicle _x!="" and (_zombie knowsAbout vehicle _x>0 or _distance<3)))
					or (_zombietype in ["normal","surprise","armored","slow armored"] and currentWeapon vehicle _x=="" and _distance<_dist*CLY_unarmedaggromultiplier and _zombie knowsAbout vehicle _x>0)
					or (_x!=vehicle _x and isEngineOn vehicle _x and getNumber (configFile/"CfgVehicles"/(typeOf vehicle _x)/"isbicycle")==0 and _distance<_dist*CLY_vehicleaggromultiplier)
				) then {
					_nearest=_x;
					_dist=_distance;
				};
			};
		} forEach CLY_zombievictims;
		
		//Determine victim
		if (!isNull _nearest) then {
			if (_victimradius>0) then {{if (vehicle _x distance vehicle _nearest<_victimradius and _zombie knowsAbout vehicle _x>0) then {_victims set [count _victims,_x]}} forEach CLY_zombievictims};
			if (count _victims>1) then {_victim=_victims select floor random count _victims} else {_victim=_nearest};
			_zombie setVariable ["victim",_victim];
			if (_zombietype=="ambusher") then {_zombie setUnitPos "UP"};
		};
		sleep (random 0.5);
		if (isNull (_zombie getVariable "victim") and alive _zombie) then {sleep 1} else {_noisewait=0};
	};
	///Combat///
	while {!isNull (_zombie getVariable "victim") and alive _zombie} do {
		if !(_zombie getVariable ["incombat",false]) then {_zombie setVariable ["incombat",true,true];};
		_victim=_zombie getVariable "victim";
		_randomradius=0;
		_zombie reveal [_victim,4];
		
		_newmovedist=_attackdist*(_zombie distance vehicle _victim)*0.2;
		if (_newmovedist<_attackdist) then {_newmovedist=_attackdist};
		
		_movepos=[(getPosATL (vehicle _victim) select 0)-_randomradius+random _randomradius*2,(getPosATL (vehicle _victim) select 1)-_randomradius+random _randomradius*2,getPosATL (vehicle _victim) select 2];
		_zombie doMove _movepos;
		_zombie lookAt _victim;
		
		//Give up the chase
		if (!(_zombie getVariable "horde") and _zombie distance vehicle _victim>CLY_chasegiveupdist) then {
			_zombie setVariable ["victim",objNull];
		};
		
		//Chase
		while {!isNull (_zombie getVariable "victim") and alive _zombie and ((vehicle _victim) distance _movepos)<_newmovedist and ((_zombie getVariable "horde") or ((_zombie distance (vehicle _victim))<CLY_chasegiveupdist))} do {
			if (_zombietype!="slow armored") then {_zombie setSpeedMode "FULL"} else {_zombie setSpeedMode "LIMITED"};
			if (_zombietype=="sneaker" and (_zombie distance _victim<25 or damage _zombie>0)) then {_zombie setUnitPos "UP"};
			//Noise
			if (time>_noisewait) then {
				if (_zombietype=="normal" or _zombie distance _victim<4) then {
					_sound=CLY_noises_chase select floor random count CLY_noises_chase;
					[_zombie, _sound] call CBA_fnc_globalSay3d;
					_noisewait=time+5+random 15;
				} else {
					if (_zombie distance _victim<12 and unitPos _zombie!="DOWN" and canStand _zombie) then {
						_sound=CLY_noises_chase select floor random count CLY_noises_chase;
						[_zombie, _sound] call CBA_fnc_globalSay3d;
						_noisewait=time+5+random 20;
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
							_zombie distance vehicle _x<_attackdist
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
			if (_zombie getVariable "victim"!=_victim) then {
				_victim=_zombie getVariable "victim";
				_victimchangecooldown=time+10;
			};
			
			if (!alive _victim or !(_victim in CLY_zombievictims)) then {_zombie setVariable ["victim",objNull]};
			
			//Attack
			if (alive _victim and _zombie distance vehicle _victim<6 and _victim in CLY_zombievictims) then {
				if (((_zombie modelToWorld (_zombie selectionPosition "launcher") distance vehicle _victim) min (_zombie distance vehicle _victim)<_attackdist and (getPosASL _victim select 2)-(getPosASL _zombie select 2)<1.5 and (getPosASL _victim select 2)-(getPosASL _zombie select 2)>-1) or vehicle _victim!=_victim) then {
					_anim=if (_zombie selectionPosition "launcher" select 2<0.5372) then {"awopppnemstpsgthwnondnon_end"} else {"awoppercmstpsgthwnondnon_end"};
					_sound=CLY_noises_attack select floor random count CLY_noises_attack;
					[_zombie, _sound] call CBA_fnc_globalSay3d;
					_zombie switchMove _anim;
					CLY_z_attackpv= [_zombie,_anim];
					publicVariable "CLY_z_attackpv";
					_zombie setVectorDir [(getPosATL (vehicle _victim) select 0)-(getPosATL _zombie select 0),(getPosATL (vehicle _victim) select 1)-(getPosATL _zombie select 1),0];
					if (vehicle _victim==_victim) then {
						_sound= CLY_noises_scream select floor random count CLY_noises_scream;
						[_victim, _sound] call CBA_fnc_globalSay3d;
						//apply damage
						if (isPlayer _victim) then {
							[_victim,0.215] call ace_sys_wounds_fnc_addDamage;
						}else {
							_victim setDamage ((getDammage _victim)+0.34);
						};
					} else {
						_damage=damage vehicle _victim+2/getNumber (configFile/"CfgVehicles"/(typeOf vehicle _victim)/"armor");
						if (_damage<=0.99) then {
							vehicle _victim setDamage _damage;
						} else {
							vehicle _victim setDamage 0.99;
							{_x action ["Eject",vehicle _victim]} forEach crew vehicle _victim;
						};
					};
					sleep 1.5;
				};
			};
			_newmovedist=_attackdist*(_zombie distance vehicle _victim)*0.2;
			if (_newmovedist<_attackdist) then {_newmovedist=_attackdist};
			sleep 1;
		};
		
	};
	if (alive _zombie && (_zombie getVariable ["incombat",true])) then {_zombie setVariable ["incombat",false,true];};
};
if (_zombie getVariable "victim"==_zombie) then {
	deleteVehicle _zombie;
};
