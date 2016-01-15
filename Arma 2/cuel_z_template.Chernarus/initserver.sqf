#include "config.sqf";
#include "zombie_scripts\z_funcs.sqf";
#include "cuel_scripts\defines.sqf"
zombieRoutine = compile preProcessFileLineNumbers "zombie_scripts\z_routine.sqf";

createCenter west;
createCenter east;
createCenter resistance;
createCenter civilian;

// {_x setFriend [west,1]} forEach [west,east,resistance,civilian];
// {_x setFriend [east,1]} forEach [west,east,resistance,civilian];
// {_x setFriend [resistance,1]} forEach [west,east,resistance,civilian];
// {_x setFriend [civilian,1]} forEach [west,east,resistance,civilian];
//{_x setVariable ["BIS_noCoreConversations", true];}forEach allUnits;

if (param_date == 1) then {setDate [2012, Month, Day, Hour, Minute + (time/60)];};
if (param_date == 2) then {setDate [2012,([1,2,3,4,5,6,7,8,9,10,11,12] call BIS_fnc_selectRandom),([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]call BIS_fnc_selectRandom),([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]call BIS_fnc_selectRandom), ([00,15,30,45]call BIS_fnc_selectRandom)+(time / 60)];};
setViewDistance 500;
setTerrainGrid 25;


//create zombie spawn logic
_pos = [0,0];
_group = createGroup sideLogic;
zombiespawner = _group createUnit ["Logic", _pos, [], 0, "NONE"];

[] execVM "zombie_scripts\cly_z_unitupdate.sqf";
//create zombie triggers
_xa = 500;
_ya = 500;
for "_a" from 0 to 15 do {
//X AXIS
	_pos = [_xa,_ya];
	_trig = createTrigger ["EmptyDetector", _pos];
	_trig setTriggerArea [500,500,0,true];
	_trig setTriggerActivation ["NONE", "PRESENT", FALSE];
	if (CLY_debug) then {_m=createMarker [format ["trg%1",random 100000],getposATL _trig];_trig setVariable ["marker",_m]; _m setMarkerShape "RECTANGLE"; _m setMarkerSize [500,500]; _m setMarkerBrush "SolidBorder"; _m setMarkerAlpha 0.2; _m setMarkerColor "ColorRed";};
	_trig setTriggerStatements ["time > 1", "0=[thisTrigger,-1] execVM 'zombie_scripts\cly_z_generator.sqf';", ""];
	
	//Y-AXIS
	for "_b" from 0 to 15 do {
		sleep 0.01;
		_ya = _ya+1000;
		_pos = [_xa,_ya];
		_trig = createTrigger ["EmptyDetector", _pos];
		_trig setTriggerArea [500,500,0,true];
		_trig setTriggerActivation ["NONE", "PRESENT", FALSE];
		if (CLY_debug) then {_m=createMarker [format ["trg%1",random 100000],getposATL _trig];_trig setVariable ["marker",_m]; _m setMarkerShape "RECTANGLE"; _m setMarkerSize [500,500]; _m setMarkerBrush "SolidBorder"; _m setMarkerAlpha 0.2; _m setMarkerColor "ColorRed";};
		_trig setTriggerStatements ["time > 1", "0=[thisTrigger,-1] execVM 'zombie_scripts\cly_z_generator.sqf';", ""];
	};
	_ya = 500;
	_xa = _xa+1000;
	sleep 0.01;
};
if (CLY_debug) then {player sidechat "Trigger creation finished!"};

[] execVM "cuel_scripts\server\cuel_cleanup.sqf";