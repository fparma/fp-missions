#define WAIT_FOR_RUCK [_man] spawn { _man = _this select 0;	waitUntil { !isNil "ACE_Sys_Ruck_fnc_AddMagToRuck" && !isNil "ACE_Sys_Ruck_fnc_AddWepToRuck" && !isNil "ACE_fnc_PutWeaponOnBack" };
#define END_WAIT_FOR_RUCK };

#define SQUAD_RADIO "ACRE_PRC343"
#define PLATOON_RADIO "ACRE_PRC148"
#define COMPANY_RADIO "ACRE_PRC117F"

_man = _this select 0;

removeAllWeapons _man;
removeAllItems _man;
removeBackpack _man;

[_man, 1, 2, 1] call ACE_fnc_PackIFAK;

_man addWeapon "itemWatch";
_man addWeapon "itemMap";
_man addWeapon "itemCompass";
_man addWeapon "ACE_KeyCuffs";
_man addWeapon "ACE_Earplugs";

_man setVariable ["ACE_Ruck_Lock_Scope", "Team"];

_man addWeapon "NVGoggles";
