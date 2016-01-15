// Available variables here is "_unit" and "_kit" and stuff in _defines.sqf
#include "_defines.sqf"

[_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, _COMMON_BP]] call FP_fnc_addContainers;
[_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
[_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

[_unit, _STANDARD_MANPADS_ROCKET] call FP_fnc_addToContainers;
[_unit, _STANDARD_MANPADS] call FP_fnc_addWeapon;
[_unit, [_STANDARD_MANPADS_ROCKET, 2], "backpack"] call FP_fnc_addToContainers;
