_unit = _this select 0;
#include "_defineItems.sqf";

_unit forceAddUniform "U_I_G_Story_Protagonist_F";
_unit addVest "Niko_USA_PlateCarrierH_UCP";
_unit addHeadGear "rhsusf_mich_bare_norotos_alt";
_unit addGoggles "rhs_scarf";

_unit addMagazines [_STANDARD_SMOKE,2];
_unit addMagazines [_GRENADE,2];

[_unit,"RH_M4A6",10] call BIS_fnc_addWeapon;
_unit addPrimaryWeaponItem "RH_m4covers_f";
_unit addPrimaryWeaponItem "RH_ta01nsn";
[_unit,"RH_fnp45",4] call BIS_fnc_addWeapon;
_unit addHandgunItem "RH_X2";

_unit addweapon "Binocular";
_unit additem ItemRadio;

#include "_after.sqf";