
removeHeadgear player;
player addHeadgear "H_MilCap_gry";

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

player addAction ["<t color='#ffff00'>[ End mission]</t>", {
	player removeAction (_this select 2);
	[[true], "FP_fnc_weaponsColdAndUnitLock", false] call BIS_fnc_MP;
	[["End1", true, true], "BIS_fnc_endMission", nil] call BIS_fnc_MP;
},0, -100];

{
	_x addEventHandler ["CuratorObjectPlaced", {
		_veh = _this select 1;

		_veh addEventHandler ["Killed", {
			[_this select 0] call FP_fnc_addTrash;
		}];

		if (!(_veh isKindOf "man")) then {
			{
				_x addEventHandler ["Killed", {
					[_this select 0] call FP_fnc_addTrash;
				}];
			}forEach crew _veh;
		};
	}];
}foreach allCurators;