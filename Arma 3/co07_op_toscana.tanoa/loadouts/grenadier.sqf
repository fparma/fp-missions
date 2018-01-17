params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "ACE_30Rnd_556x45_Stanag_Mk262_mag";
_unit addMagazine "1Rnd_HE_Grenade_shell";
_unit addWeapon "rhs_weap_hk416d10_m320";
_unit addPrimaryWeaponItem "hlc_muzzle_556NATO_KAC";
_unit addPrimaryWeaponItem "RH_peq15b";
_unit addPrimaryWeaponItem "RH_cmore";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "VSM_Mich2000_2_OGA_OD";
_unit forceAddUniform "VSM_OD_Crye_Camo";
_unit addVest "VSM_FAPC_Operator_MulticamTropic";
_unit addBackpack "B_Kitbag_rgr";
clearAllItemsFromBackpack _unit;
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","NVGoggles_OPFOR"];

// Uniform items
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACE_Flashlight_MX991";
{_unit addItemToUniform "ACE_epinephrine"} count [1,2];
{_unit addItemToUniform "ACE_morphine"} count [1,2,3,4];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
// Vest items
_unit addItemToVest "B_IR_Grenade";
_unit addItemToVest "ACE_Chemlight_IR";
_unit addItemToVest "ACE_HuntIR_monitor";
_unit addItemToVest "ACE_Chemlight_HiRed";
{_unit addItemToVest "ACE_M84"} count [1,2];
{_unit addItemToVest "ACE_CableTie"} count [1,2];
{_unit addItemToVest "SmokeShellBlue"} count [1,2];
{_unit addItemToVest "CUP_HandGrenade_M67"} count [1,2];
{_unit addItemToVest "ACE_30Rnd_556x45_Stanag_Mk262_mag"} count [1,2,3];
{_unit addItemToVest "ACE_30Rnd_556x45_Stanag_Tracer_Dim"} count [1,2,3,4,5];
// Backpack items
{_unit addItemToBackpack "UGL_FlareRed_F"} count [1,2];
{_unit addItemToBackpack "ACE_HuntIR_M203"} count [1,2,3,4,5,6];
{_unit addItemToBackpack "1Rnd_SmokeRed_Grenade_shell"} count [1,2];
{_unit addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell"} count [1,2];
{_unit addItemToBackpack "ACE_30Rnd_556x45_Stanag_Mk262_mag"} count [1,2];
{_unit addItemToBackpack "ACE_30Rnd_556x45_Stanag_Tracer_Dim"} count [1,2];
{_unit addItemToBackpack "1Rnd_HE_Grenade_shell"} count [1,2,3,4,5,6,7,8,9,10,11,12];
// Radios
_unit addItemToUniform "ACRE_PRC343";
