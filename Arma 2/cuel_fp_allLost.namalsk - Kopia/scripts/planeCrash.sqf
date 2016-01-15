if (!isServer) exitWith {};
if (planeActive) exitWith{};
planeActive = true; publicVariable "planeActive";

_z = call zombiesToSpawn;
for "_i" from 1 to 2 do {
	[position evacLoc, _z, 50] call spawnInf;
	sleep 0.5;
}; 
while{{isPlayer _x} count (nearestObjects [(getPos evacLoc),["Man","LandVehicle"],80]) == 0} do {sleep 4;};

_startPos = [	(getMarkerPos "planeSpawn") select 0,(getMarkerPos "planeSpawn") select 1,40];

_plane = [_startPos, 0, "C130J", WEST] call BIS_fnc_spawnVehicle;

_grp = _plane select 2;
cuel_plane = _plane select 0;
_crew = _plane select 1;			
{
    _x disableAI "MOVE";
 	_x disableAI "FSM";
    _x disableAI "TARGET";
    _x disableAI "AUTOTARGET";
    _x disableAI "ANIM";
    doStop _x;
} forEach _crew;

cuel_plane flyInHeight 0;
sleep 1;
[cuel_plane, flyIn] spawn BIS_fnc_UnitPlay;
waituntil {sleep 0.5; !alive cuel_plane};
{
deleteVehicle _x;
}forEach _crew;
sleep (1+(random(2)));
_bomb = "Bo_GBU12_LGB" createVehicle (getPosATL cuel_plane);
deleteGroup _grp;
//clean up after 250sec
[] spawn {sleep 250; deleteVehicle cuel_plane;};
[] execVM "obj\obj2.sqf";

if (true) exitWith{};