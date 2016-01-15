_unit = _this select 0;
#include "_defineItems.sqf";

_unit forceAddUniform "U_B_CTRG_2";
_unit addVest "V_TacVestIR_blk";
_unit addHeadGear "rhsusf_ach_bare_des_headset_ess";
_unit addBackPack "tf_anprc155_coyote";
	
_unit addMagazines [_STANDARD_SMOKE,2];
_unit addMagazines [_GRENADE,2];

[_unit,"rhs_weap_M590_8RD",10] call BIS_fnc_addWeapon;
[_unit,"RH_tec9",5] call BIS_fnc_addWeapon;

_unit additem ItemRadio;

#include "_after.sqf";