_unit = _this select 0;
#include "_defineItems.sqf";

_unit forceAddUniform (_UNIFORMS select 0);
_unit addVest (_VESTS select 0);
_unit addBackpack _LR_RADIO;
_unit addHeadGear "rhs_fieldcap_helm_ml";
_unit addItem "rhs_6b27m_ml";

_unit addMagazines [_STANDARD_SMOKE,2];
_unit addMagazines [_GRENADE,2];
_unit addMagazines [_STANDARD_MAG,8];
_unit addMagazines [_STANDARD_MAG_T,4];
_unit addMagazines [_GL_HE,4];

_unit addMagazines [_CHEMLIGHT, 2];
{_unit addMagazine _x} forEach _GL_SMOKES;

{_unit additem _x} foreach _LEADER_ITEMS;

[_unit, _STANDARD_RIFLE_GL] call BIS_fnc_addWeapon;

_unit addWeapon "Binocular";

// add common items
#include "_after.sqf";