// Available variables here is "_unit" and "_kit" and stuff in _defines.sqf
#include "_defines.sqf"

[_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS]] call FP_fnc_addContainers;
[_unit, [_STANDARD_MMG_MAG, 4]] call FP_fnc_addToContainers;
[_unit, _STANDARD_MMG] call FP_fnc_addWeapon;
