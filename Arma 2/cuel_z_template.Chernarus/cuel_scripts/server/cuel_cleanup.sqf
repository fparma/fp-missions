//by Cuel.
//to have editor-placed bodies stay, use:
// this setVariable ["noclean",true];
if (!isServer) exitWith {};
waitUntil {sleep 10; time > 60};

if (CLY_debug) then {
	_marker=createMarker ["cuel_debug_center",CUEL_CENTERPOS];
	_marker setMarkerType "Dot";
	_marker setMarkerColor "ColorGreen";
	_marker setMarkerText " Center pos";
};

_delUnit = {
	_unit = _this select 0;
	if (!isPlayer _unit) then {
		hideBody _unit;
		sleep 5;
		deleteVehicle _unit;
	};
};

_cleanUp = {
	{
		if (isNull (_x getVariable "victim") && (!(_x getVariable ["noclean",false])))  then {
			if (!([_x,CLY_despawndist+100] call CBA_fnc_nearPlayer)) then {_tmp = (group _x); deleteVehicle _x; sleep 0.01; if (count (units _tmp )== 0) then {deleteGroup _tmp;};};
			sleep 0.01;
		};
	}forEach allUnits - [playableUnits];
	sleep 0.2;
	{
		if (!isPlayer _x) then {
			if (!([_x,200]call CBA_fnc_nearPlayer)) then {
				if (!(_x getVariable ["noclean",false])) then {[_x] spawn _delUnit;};
			};
		};
		sleep 0.01;
	}forEach allDead;
	
	sleep 0.2;
	{
		if ((count (units _x)) == 0) then {deleteGroup _x; _x = grpNull; _x = nil};
		sleep 0.005;
	}forEach allGroups;
	sleep 0.2;
	{
		if (!([_x,300]call CBA_fnc_nearPlayer)) then { deleteVehicle _x; };	
		sleep 0.005;		
	} forEach nearestObjects[CUEL_CENTERPOS,["CraterLong","WeaponHolder"],8000];
};

while {true} do {
	call _cleanUp;
	sleep 2;
};