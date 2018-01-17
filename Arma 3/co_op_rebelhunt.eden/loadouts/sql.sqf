params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "30Rnd_556x45_Stanag_Tracer_Red";
_unit addMagazine "1Rnd_HE_Grenade_shell";
_unit addWeapon "hlc_rifle_m203";
// Handgun
_unit addMagazine "RH_15Rnd_9x19_M9";
_unit addWeapon "RH_m9";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "CUP_H_USMC_Headset_HelmetWDL";
_unit forceAddUniform "CUP_U_B_USMC_MARPAT_WDL_RolledUp";
_unit addVest "CUP_V_B_MTV_TL";
_unit addBackpack "CUP_B_AssaultPack_Coyote";
clearAllItemsFromBackpack _unit;
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

// Uniform items
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACE_epinephrine";
{_unit addItemToUniform "ACE_morphine"} count [1,2];
_unit addItemToUniform "1Rnd_SmokeRed_Grenade_shell";
{_unit addItemToUniform "RH_15Rnd_9x19_M9"} count [1,2];
{_unit addItemToUniform "1Rnd_Smoke_Grenade_shell"} count [1,2];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6];
// Vest items
_unit addItemToVest "1Rnd_HE_Grenade_shell";
{_unit addItemToVest "HandGrenade"} count [1,2];
{_unit addItemToVest "SmokeShellGreen"} count [1,2];
{_unit addItemToVest "30Rnd_556x45_Stanag"} count [1,2];
{_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red"} count [1,2,3,4,5,6,7];
// Backpack items
{_unit addItemToBackpack "1Rnd_HE_Grenade_shell"} count [1,2,3,4,5,6,7];
// Radios
_unit addItemToVest "ACRE_PRC148";
_unit addItemToVest "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC117F";