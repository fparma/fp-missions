// Available variables here is "_unit" and "_kit" and stuff in _defines.sqf
#include "_defines.sqf"

[_unit, [_PILOT_UNIFORM, _PILOT_VEST, _PILOT_HEADGEAR, "B_Parachute"]] call FP_fnc_addContainers;
[_unit, _PILOT_MAGS] call FP_fnc_addToContainers;
[_unit, _PILOT_WEAPON] call FP_fnc_addWeapon;
