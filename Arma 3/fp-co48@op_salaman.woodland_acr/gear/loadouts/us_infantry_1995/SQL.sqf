// Available variables here is "_unit" and "_kit" and stuff in _defines.sqf
#include "_defines.sqf"

[_unit, [_SQL_UNIFORM, _SQL_VEST, _SQL_HEADGEAR, _SQL_BP]] call FP_fnc_addContainers;
[_unit, [[_COMMON_MAG_GL, 8], [_COMMON_MAG_GL_T, 4], _COMMON_GL_NADES]] call FP_fnc_addToContainers;
[_unit, [_COMMON_RIFLE_GL, _SQL_ATTACHMENTS]] call FP_fnc_addWeapon;

[_unit, _SQL_BINOC] call FP_fnc_addOptic;
[_unit, _SQL_ITEMS] call FP_fnc_addToContainers;
