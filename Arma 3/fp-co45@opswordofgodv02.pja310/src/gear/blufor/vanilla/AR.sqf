_unit = _this select 0;
#include "_defineItems.sqf";

_unit forceAddUniform (_UNIFORMS  call BIS_fnc_selectRandom);
_unit addVest (_VESTS call BIS_fnc_selectRandom);
_unit addHeadGear (_HEADGEARS call BIS_fnc_selectRandom);
_unit addBackPack "CUP_B_CivPack_WDL";

_unit addMagazines [_STANDARD_SMOKE,2];
_unit addMagazines [_GRENADE,2];
_unit addMagazines [_STANDARD_AR_MAG, 4];
_unit addMagazines [_STANDARD_AR_MAG_T, 2];

[_unit, _STANDARD_AR] call BIS_fnc_addWeapon;

#include "_after.sqf";