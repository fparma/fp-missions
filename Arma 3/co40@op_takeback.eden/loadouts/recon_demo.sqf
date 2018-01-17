params ["_unit", "_type"];

_unit addBackpack "ACE_FakeBackpack";
_unit addMagazine "30Rnd_556x45_Stanag";
_unit addWeapon "rhs_weap_m16a4_carryhandle";
_unit addPrimaryWeaponItem "hlc_muzzle_556NATO_KAC";
_unit addPrimaryWeaponItem "RH_peq15b";
_unit addPrimaryWeaponItem "RH_compm4s";

_unit addMagazine "RH_15Rnd_9x19_M9";
_unit addWeapon "RH_m9";
_unit addHandgunItem "RH_M6X";
removeBackpack _unit;

_unit addHeadgear "usm_helmet_pasgt_g_w";
_unit forceAddUniform "CUP_U_B_FR_Light";
_unit addVest "usm_vest_lbv_gr";
_unit addBackpack "CUP_B_CivPack_WDL";
clearAllItemsFromBackpack _unit;
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","CUP_NVG_PVS7"];

{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6];
_unit addItemToUniform "ACE_epinephrine";
{_unit addItemToUniform "ACE_morphine"} count [1,2];
_unit addItemToUniform "ACE_Flashlight_XL50";

{_unit addItemToVest "30Rnd_556x45_Stanag"} count [1,2,3,4,5,6,7,8];
{_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red"} count [1,2];

_unit addItemToBackpack "SatchelCharge_Remote_Mag";
{_unit addItemToBackpack "DemoCharge_Remote_Mag"} count [1,2,3,4];

_unit addItemToUniform "ItemRadio";
