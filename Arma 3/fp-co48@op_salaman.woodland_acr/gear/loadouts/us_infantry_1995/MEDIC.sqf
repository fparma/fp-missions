// Available variables here is "_unit" and "_kit" and stuff in _defines.sqf
#include "_defines.sqf"

[_unit, [_COMMON_UNIFORMS, _MED_VEST, _MED_HEADGEAR, _MED_BP]] call FP_fnc_addContainers;
[_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
[_unit, [_COMMON_RIFLE_C, _COMMON_RIFLE_C_ATTACHMENTS]] call FP_fnc_addWeapon;

[_unit, _MED_BP_ITEMS, "backpack"] call FP_fnc_addToContainers;
