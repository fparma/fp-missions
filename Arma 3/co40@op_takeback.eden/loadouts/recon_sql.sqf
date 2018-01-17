params ["_unit", "_type"];

_unit addBackpack "ACE_FakeBackpack";
_unit addMagazine "30Rnd_556x45_Stanag_Tracer_Red";
_unit addMagazine "1Rnd_HE_Grenade_shell";
_unit addWeapon "rhs_weap_m16a4_carryhandle_M203";
_unit addPrimaryWeaponItem "hlc_muzzle_556NATO_KAC";
_unit addPrimaryWeaponItem "RH_peq15b";
_unit addPrimaryWeaponItem "RH_compm4s";

_unit addMagazine "RH_15Rnd_9x19_M9";
_unit addWeapon "RH_m9";
_unit addHandgunItem "RH_M6X";
_unit addWeapon "ACE_Vector";
removeBackpack _unit;

_unit addHeadgear "CUP_H_PMC_PRR_Headset";
_unit forceAddUniform "CUP_U_B_FR_Light";
_unit addVest "CUP_V_B_RRV_TL";
_unit addBackpack "usm_pack_st138_prc77";
clearAllItemsFromBackpack _unit;
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","CUP_NVG_PVS7"];

{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6];
_unit addItemToUniform "ACE_epinephrine";
{_unit addItemToUniform "ACE_morphine"} count [1,2];
_unit addItemToUniform "ACE_Flashlight_XL50";
{_unit addItemToUniform "1Rnd_HE_Grenade_shell"} count [1,2,3,4,5,6,7];
_unit addItemToUniform "1Rnd_SmokeGreen_Grenade_shell";

_unit addItemToVest "usm_helmet_pasgt_g_w";
{_unit addItemToVest "30Rnd_556x45_Stanag"} count [1,2,3,4,5,6];
{_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red"} count [1,2,3,4,5];
{_unit addItemToVest "UGL_FlareWhite_F"} count [1,2];
_unit addItemToVest "UGL_FlareCIR_F";


_unit addItemToUniform "ItemRadio";
_unit addItemToBackpack "ACRE_PRC117F";
