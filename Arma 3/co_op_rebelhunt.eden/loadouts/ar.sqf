params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "CUP_100Rnd_TE4_Red_Tracer_556x45_M249";
_unit addWeapon "hlc_lmg_m249para";
// Handgun
_unit addMagazine "RH_15Rnd_9x19_M9";
_unit addWeapon "RH_m9";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "CUP_H_USMC_Goggles_HelmetWDL";
_unit forceAddUniform "CUP_U_B_USMC_MARPAT_WDL_RolledUp";
_unit addVest "CUP_V_B_MTV_MG";
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

// Uniform items
_unit addItemToUniform "ACE_epinephrine";
{_unit addItemToUniform "ACE_morphine"} count [1,2];
{_unit addItemToUniform "RH_15Rnd_9x19_M9"} count [1,2];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6];
// Vest items
{_unit addItemToVest "HandGrenade"} count [1,2];
{_unit addItemToVest "SmokeShellGreen"} count [1,2];
{_unit addItemToVest "CUP_100Rnd_TE4_Red_Tracer_556x45_M249"} count [1,2];
// Radios
_unit addItemToUniform "ACRE_PRC343";