_unit = _this select 0;
#include "_defineItems.sqf";

_unit forceAddUniform "U_I_G_resistanceLeader_F";
_unit addVest "AAF_D_PlateCarrier_IA2";
_unit addHeadGear "AAF_D_Helmet_IA";
_unit addBackPack "CUP_B_AlicePack_Khaki";
_bp = (unitBackpack _unit);
clearItemCargoGlobal _bp;
	_bp addItemCargoGlobal ["ACE_fieldDressing",16];
	_bp addItemCargoGlobal ["ACE_morphine",12];
	_bp addItemCargoGlobal ["ACE_epinephrine",12];
	_bp addItemCargoGlobal ["ACE_bloodIV_500",4];
	
_unit addMagazines [_STANDARD_SMOKE,2];
_unit addMagazines [_GRENADE,2];

[_unit,"CUP_arifle_G36C",10] call BIS_fnc_addWeapon;
_unit addPrimaryWeaponItem "RH_barska_rds";
[_unit,"RH_Deaglem",4] call BIS_fnc_addWeapon;
_unit addHandgunItem "RH_demz";
_unit addHandgunItem "RH_Deflash";

_unit addweapon "Binocular";
_unit additem ItemRadio;

#include "_after.sqf";