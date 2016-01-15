//Zombie generator script by Celery. Edited by Cuel.
if (!isServer) exitWith {};
sleep (1+(random 1));
_trigger=_this select 0;
_posx=(getPosATL _trigger) select 0;
_posy=(getPosATL _trigger) select 1;
_triggerpos=[_posx,_posy,0];

//Continue if logic is inside area of operations (or there is no such area)
_exit = false;
if (!isNil "generatorminxy" and !isNil "generatormaxxy") then {
	if (_posx<getPosATL generatorminxy select 0 or _posx>getPosATL generatormaxxy select 0 or _posy<getPosATL generatorminxy select 1 or _posy>getPosATL generatormaxxy select 1) then {_exit = true};
};

//Dont continue if middle+all four corners are water
_sx = (triggerArea _trigger select 0);
_sy = (triggerArea _trigger select 1);
if (surfaceIsWater _triggerpos && surfaceIsWater [_posx-_sy,_posy-_sx] && surfaceIsWater [_posx-sy,_posy+_sx]  && surfaceIsWater  [_posx+_sy,_posy-_sx]&& surfaceIsWater [_posx+_sy,_posy+_sx]) then {_exit = true};
if (_exit) exitWith {if (CLY_debug) then {_m = (_trigger getVariable "marker"); deleteMarker _m;};deleteVehicle _trigger};

_amount=_this select 1;
_radius=(triggerArea _trigger select 0) max (triggerArea _trigger select 1);
_activatedist= round(sqrt(_radius^2*2));
_deactivatedist=_activatedist+100;

//Zombie amount if set to default
if (_amount<0) then {
	_amount=round (CLY_defaultdensity*abs _amount);
};

//Run script until there are no zombies left
if (CLY_debug) then {totTriggers=totTriggers+1;publicVariable "totTriggers";};
while {_amount>0} do {

	//Wait until players are in range
	_activate=false;
	while {!_activate} do {
		if ({_triggerpos distance [getPosATL vehicle _x select 0,getPosATL vehicle _x select 1,0]<_activatedist && (getPosATL _x select 2)<20} count CLY_players>0) then {_activate=true};
		if (!_activate) then {sleep (3+random 4)};
	};
	//Prepare positions
	_positions=[];
	_idarray=[];
	_markers=[];
		for "_x" from 1 to _amount do {
		_pos=[0,0,0];
		_relocate=true;
		_failed = false;
		_try = 0;
		//Relocate if surface is water or too close to other positions
		while {_relocate} do {
			_pos =[_trigger,_radius] call CBA_fnc_randPos;
			if (!(surfaceIsWater _pos) and {_pos distance _x<30} count _positions == 0) then {_relocate=false};
			_try = _try +1;
			if (_try > 20) then {_amount = _amount-1;_failed = true;_relocate = false;};
		};
		if (!_failed) then {
			//Add to array
			_positions set [count _positions,_pos];
			_idarray set [count _idarray,(count _positions)-1];
			//Debug marker
				if (CLY_debug) then {
				_marker=createMarker [format ["marker%1",random 100000],_pos];
				_marker setMarkerType "Dot";
				_marker setMarkerColor "ColorRed";
				_marker setMarkerSize [0.3,0.3];
				_markers set [count _markers,_marker];
				_marker setMarkerText format ["%1",count _positions+1];
			};
		};
	};
	if (count _positions == 0) exitWith {_amount = 0;};
	//Initialize arrays
	_removeidarray=[];
	_zombies=[];
	_zombiesInTrigger = [];
	for "_x" from 1 to count _positions do {_zombies set [count _zombies,objNull]};
	sleep random 2;
	//Loop until players are out of range
	while {_amount>0 and (({_triggerpos distance [(getPosATL (vehicle _x) select 0),(getPosATL (vehicle _x) select 1),0]>_deactivatedist} count CLY_players)<count CLY_players)} do {
		{
			//Despawn zombie if not in range or detach from generator if horde
			if (!isNull (_zombies select _x)) then {
				_zombie=_zombies select _x;
				_despawn=true;
				if ({_zombie distance [getPosATL vehicle _x select 0,getPosATL vehicle _x select 1,0]<CLY_despawndist or !isNull (_zombie getVariable "victim")} count CLY_players>0) then {_despawn=false};
				if (_despawn or !alive _zombie or (_zombie getVariable "horde")) then {
					if (_despawn) then {
						_zombie setDamage 1;
						_zombie setVariable ["victim",_zombie];
						_zombies set [_x,objNull];
					}else{
						_zombies set [_x,objNull];
						_removeidarray set [count _removeidarray,_x];
						if (CLY_debug) then {deleteMarker (_markers select _x)};
					};
					
				};
			} else {
				//Create zombie
				if ({side _x==east or side _x==west or side _x==resistance} count allGroups<432-CLY_hordereservedgroups) then {
					//Determine whether position is in spawning range
					_spawn=false;
					_pos=_positions select _x;
					if ({_pos distance vehicle _x<CLY_maxspawndist} count CLY_players>0 and {_pos distance vehicle _x<CLY_minspawndist} count CLY_players==0) then {_spawn=true};
					
					//Spawn new zombie
					if (_spawn) then {
						//Determine zombie type
						_zombietype="normal";
						_r=random 100;
						_total=0;
						{
							if (_r>_total and _r<=_total+(_x select 1)) then {_zombietype=_x select 0};
							_total=_total+(_x select 1);
						} forEach CLY_zombietypes;
						//Create unit
						_side=east;
						if ({side _x==east} count allGroups>=144) then {_side=west};
						if (_side==west and {side _x==west} count allGroups>=144) then {_side=resistance};
						_group=createGroup _side;
						_class=if !(_zombietype in ["armored","slow armored"]) then {
							call CLY_randomzombie;
						} else {
							call CLY_randomarmoredzombie;
						};
						_zombie=_group createUnit [_class,getPos zombiespawner,[],50,"NONE"];
						_zombie enableSimulation false;
						_horde=false;
						//Initialize zombification
						[_zombie,_zombietype,objNull,_horde,0,_positions select _x] execVM "zombie_scripts\cly_z_init.sqf";
						//Add to arrays
						_zombies set [_x,_zombie];
					};
				};
			};
			sleep 0.05;
		}forEach _idarray;
		//Remove expired IDs
		{_idarray=_idarray-[_x]} forEach _removeidarray;
		_amount=count _idarray;
		sleep 2;
	};
	if (CLY_debug) then {{deleteMarker _x} forEach _markers;};
	_amount=count _idarray;
};

if (CLY_debug) then {
	totTriggers = totTriggers-1; publicVariable "totTriggers";
	_m =_trigger getVariable "marker";
	_m setMarkerColor "ColorGreen";
};

deleteVehicle _trigger;