// Available variables here is "_unit" and "_kit" and stuff in _defines.sqf
#include "_defines.sqf"

[_unit, [_CREW_UNIFORM, _CREW_VEST, _CREW_HEADGEAR]] call FP_fnc_addContainers;
[_unit, [[_COMMON_MAG_C, 4], [_COMMON_MAG_C_T, 2]]] call FP_fnc_addToContainers;
[_unit, [_COMMON_RIFLE_C, _COMMON_RIFLE_C_ATTACHMENTS]] call FP_fnc_addWeapon;
