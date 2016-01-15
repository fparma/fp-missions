/*
	Adds custom Ares spawns for some CAF_AG groups.

	Usage in init.sqf:
	[] execVM "Ares_Add_CAF_AG_Units.sqf";

	Requires "Ares_CreateCustomMissionObject.sqf" script to be available.
*/

[
	[
		"BM21 artillery 10rounds - 100 spread",
		{
			_pos = _this select 0;
			[[[_pos], {
				_params = [[grad1, grad2], _this select 0, 5, 100, 1.2];
				_params execVM "grad.sqf";
			}], "BIS_fnc_spawn", false] call BIS_fnc_MP;
			objNull
		}
	],
	[
		"BM21 artillery 20rounds - 200 spread",
		{
			_pos = _this select 0;
			[[[_pos], {
				_params = [[grad1, grad2], _this select 0, 10, 200, 1.2];
				_params execVM "grad.sqf";
			}], "BIS_fnc_spawn", false] call BIS_fnc_MP;
			objNull
		}
	],
	[
		"Delete Units Within 10m",
		{
			_objects = nearestObjects [(_this select 0), ["AllVehicles"], 10];
			{
				deleteVehicle _x;
			} forEach _objects;
			[];
		}
	],
	[
		"Delete Units Within 100m",
		{
			_objects = nearestObjects [(_this select 0), ["AllVehicles"], 100];
			{
				deleteVehicle _x;
			} forEach _objects;
			[];
		}
	]
] execVM "Ares_CreateCustomMissionObject.sqf";
