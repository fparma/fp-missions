
removeHeadgear player;
player addHeadgear "H_Bandanna_camo";
/*
player addAction ["<t color='#ffff00'>[ Play intro ]</t>", {
	player removeAction (_this select 2);
	["intro.sqf", "bis_fnc_execvm", nil] call BIS_fnc_MP;
},0, -98];

player addAction ["<t color='#ffff00'>[ Retreat from DFP ]</t>", {
	player removeAction (_this select 2);
	[[WEST,"HQ"],["actual", "a0", "b0", "c0", "mmg1", "crew1", "crew21", "engi1"], "Evacs almost complete. All units are ordered to retreat to FOB Gangplank and keep defending"] call FP_fnc_intelHQ;
},0 ,-99];

player addAction ["<t color='#ffff00'>[ Retreat from FOB ]</t>", {
	player removeAction (_this select 2);
	[[WEST,"HQ"],["actual", "a0", "b0", "c0", "mmg1", "crew1", "crew21", "engi1"], "Evacuations are done. All remaining units are ordered to retreat over the bridge. Soviet forces are too strong. Fall back. Crossroads out"] call FP_fnc_intelHQ;
},0, -100];
*/
player addAction ["<t color='#ffff00'>[ End mission WIN]</t>", {
	player removeAction (_this select 2);
	[[true], "FP_fnc_weaponsColdAndUnitLock", false] call BIS_fnc_MP;
	[["End1", true, true], "BIS_fnc_endMission", nil] call BIS_fnc_MP;
},0, -100, false];

player addAction ["<t color='#ffff00'>[ End mission FAIL]</t>", {
	player removeAction (_this select 2);
	[[true], "FP_fnc_weaponsColdAndUnitLock", false] call BIS_fnc_MP;
	[["End2", false, true], "BIS_fnc_endMission", nil] call BIS_fnc_MP;
},0, -100, false];

{
	_x setMarkerTypeLocal "mil_dot";
	_x setMarkerTextLocal " DFP";
} forEach ["mzeus", "mzeus_1", "mzeus_2"];
