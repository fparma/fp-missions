params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "30Rnd_65x39_caseless_green";
_unit addMagazine "10Rnd_50BW_Mag_F";
_unit addWeapon "arifle_ARX_ghex_ARCO_Pointer_Snds_F";
_unit addPrimaryWeaponItem "muzzle_snds_65_TI_ghex_F";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Arco_ghex_F";
// Binoc
_unit addWeapon "Laserdesignator_02_ghex_F";
_unit addMagazine "Laserbatteries";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "H_Watchcap_camo";
_unit forceAddUniform "U_O_V_Soldier_Viper_F";
_unit addBackpack "B_ViperHarness_ghex_F";
clearAllItemsFromBackpack _unit;
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

// Uniform items
_unit addItemToUniform "ACE_epinephrine";
{_unit addItemToUniform "ACE_morphine"} count [1,2];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
// Backpack items
_unit addItemToBackpack "ACE_microDAGR";
_unit addItemToBackpack "ACE_Chemlight_HiRed";
_unit addItemToBackpack "H_HelmetO_ViperSP_ghex_F";
{_unit addItemToBackpack "MiniGrenade"} count [1,2,3,4];
{_unit addItemToBackpack "10Rnd_50BW_Mag_F"} count [1,2];
{_unit addItemToBackpack "SmokeShellOrange"} count [1,2];
{_unit addItemToBackpack "30Rnd_65x39_caseless_green"} count [1,2,3,4,5,6];
{_unit addItemToBackpack "30Rnd_65x39_caseless_green_mag_Tracer"} count [1,2,3,4];
// Radios
_unit addItemToUniform "ACRE_PRC343";