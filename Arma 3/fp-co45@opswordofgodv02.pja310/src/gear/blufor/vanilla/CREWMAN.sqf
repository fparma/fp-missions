_unit = _this select 0;
#include "_defineItems.sqf";

_unit forceAddUniform (_UNIFORMS  call BIS_fnc_selectRandom);
_unit addVest (_VESTS call BIS_fnc_selectRandom);
_unit addHeadGear "rhs_tsh4";

_unit addMagazines [_STANDARD_SMOKE,2];
_unit addMagazines [_GRENADE, 2];

[_unit,"hlc_rifle_aks74u",8] call BIS_fnc_addWeapon;

#include "_after.sqf";

