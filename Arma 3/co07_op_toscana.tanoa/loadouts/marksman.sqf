params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "ACE_30Rnd_556x45_Stanag_Mk262_mag";
_unit addWeapon "rhs_weap_hk416d10_LMT";
_unit addPrimaryWeaponItem "hlc_muzzle_556NATO_KAC";
_unit addPrimaryWeaponItem "RH_peq15b";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "bipod_01_F_blk";
// Handgun
_unit addMagazine "RH_17Rnd_9x19_g17";
_unit addWeapon "RH_g19";
_unit addHandgunItem "RH_gemtech9";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "VSM_Mich2000_2_OGA_OD";
_unit forceAddUniform "VSM_OD_Crye_Camo";
_unit addVest "VSM_FAPC_Operator_MulticamTropic";
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","NVGoggles_OPFOR"];

// Uniform items
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACE_Flashlight_MX991";
{_unit addItemToUniform "ACE_epinephrine"} count [1,2];
{_unit addItemToUniform "ACE_morphine"} count [1,2,3,4];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
// Vest items
_unit addItemToVest "RH_cmore";
_unit addItemToVest "ACE_Chemlight_IR";
_unit addItemToVest "RH_17Rnd_9x19_g17";
_unit addItemToVest "ACE_Chemlight_HiRed";
{_unit addItemToVest "ACE_M84"} count [1,2];
{_unit addItemToVest "ACE_CableTie"} count [1,2];
{_unit addItemToVest "SmokeShellBlue"} count [1,2];
{_unit addItemToVest "CUP_HandGrenade_M67"} count [1,2,3,4];
{_unit addItemToVest "ACE_30Rnd_556x45_Stanag_Mk262_mag"} count [1,2,3,4,5];
{_unit addItemToVest "ACE_30Rnd_556x45_Stanag_Tracer_Dim"} count [1,2,3,4,5,6];
// Radios
_unit addItemToUniform "ACRE_PRC343";
