/*
	Function: FP_fnc_getKit

	Description:
		This function will give units a predefined kit.

		The second _kit parameter must be a script file inside the _folder variable.

		As an example if a unit have [this, "PLT", "vanilla_nato"] call FP_fnc_getKit;
		It will run PLT.sqf inside gear\loadouts\vanilla_nato

		Note that _everyone.sqf MUST exist in the folders, and it will run for every unit after
		their loadout is applied

	Parameters:
		_obj - Unit to apply loadout to [Object].
		_kit - Name of an SQF file inside the _folder [String]
		_folder - (Optional) Override the default folder (see config.js). Useful for AI or players that are on different sides [String]

	Examples:
	(begin example)
		// unit init in editor
		[this, "ATASS"] call FP_fnc_getKit; // would apply the gear defined in ATASS.sqf inside the folder that is FP_GEAR_DEFAULT (see config.sqf)

		[this, "PLT", "taki"] call FP_fnc_getKit; // would apply the gear defined in PLT.sqf inside "gear\loadouts\taki"
	(end)

	Author:
	Cuel 2015-01-07
*/


if (isNil "FP_GEAR_DEFAULT") then {
	[] call compile preprocessFileLineNumbers "gear\config.sqf";
};

private ["_unit", "_kit"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_kit = toUpper ([_this,1,"",[""]] call BIS_fnc_param);
_folder = [_this, 2, FP_GEAR_DEFAULT] call BIS_fnc_param;

_unit setVariable ["BIS_enableRandomization", false];


if (local _unit) then {
	removeHeadgear _unit;
	removeAllContainers _unit;
	removeAllItems _unit;
	removeAllWeapons _unit;
	removeAllAssignedItems _unit;

	// Shows errors
	if (FP_GEAR_REPORT_ERRORS && {isNil "FP_gear_errs"}) then {
		FP_gear_errs = [];
		[] spawn {
			sleep 3;
			if (count FP_gear_errs > 0) then {
	            _structured = [];
	            {
	                _structured pushBack _x;
	                _structured pushBack lineBreak;
	            }forEach FP_gear_errs;
				"GEAR ERRORS" hintC composeText _structured;
				FP_gear_errs = nil; // reset for later calls
			};
		};
	};

	// assign gear
	_gearScript = preprocessFileLineNumbers ("gear\loadouts\" + _folder + "\" + _kit + ".sqf");
	_after = preprocessFileLineNumbers ("gear\loadouts\" + _folder + "\_everyone.sqf");
	[_unit, _kit] call {
		private ["_unit", "_kit"];
		_unit = _this select 0;
		_kit = _this select 1;
		call compile (_gearScript + _after);
	};

	if (!isDedicated) then {

		if (isNil "FP_kit_type") then {
			player addEventHandler ["Respawn", {
				[_this select 0, FP_kit_type select 0, FP_kit_type select 1] call FP_fnc_getKit;
			}];
		};
		FP_kit_type = [_kit, _folder];
	};

}else{
	// setVariable has some serious issues.. cant really be used
	// http://feedback.arma3.com/view.php?id=17240
	// temp solution until better is found
	if (!isDedicated && {isNil "FP_kit_type"}) then {
		[_unit, _kit, _folder] spawn {
			waitUntil {!(isNull player)};
			if (player == (_this select 0)) then {
				FP_kit_type = [_this select 1, _this select 2];
				player addEventHandler ["Respawn", {
					[_this select 0, FP_kit_type select 0, FP_kit_type select 1] call FP_fnc_getKit;
				}];
			};
		};
	};
};
