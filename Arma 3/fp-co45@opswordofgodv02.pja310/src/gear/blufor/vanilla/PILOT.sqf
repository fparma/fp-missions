_unit = _this select 0;
#include "_defineItems.sqf";

_unit forceAddUniform "rhs_uniform_m88_patchless";
_unit addVest "rhs_6sh92_headset";
_unit addHeadGear "rhs_zsh7a_mike";

_unit addMagazines [_STANDARD_SMOKE,2];
_unit addMagazines [_GRENADE, 2];

[_unit,"RH_mak",8] call BIS_fnc_addWeapon;
//{if (_x != "") then {_unit addPrimaryWeaponItem _x};} forEach _STANDARD_ATTACHMENTS;

_unit addBackpack "B_Parachute";

#include "_after.sqf";