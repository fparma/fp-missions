params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "ACE_20Rnd_65x47_Scenar_mag";
_unit addWeapon "srifle_DMR_07_ghex_F";
_unit addPrimaryWeaponItem "ACE_muzzle_mzls_H";
_unit addPrimaryWeaponItem "optic_NVS";
// Handgun
_unit addMagazine "16Rnd_9x21_Mag";
_unit addWeapon "hgun_Rook40_F";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "H_HelmetO_ghex_F";
_unit forceAddUniform "U_O_T_Soldier_F";
_unit addVest "V_HarnessO_ghex_F";
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","O_NVGoggles_ghex_F"];

// Uniform items
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "16Rnd_9x21_Mag";
_unit addItemToUniform "ACE_epinephrine";
_unit addItemToUniform "ACE_Flashlight_MX991";
{_unit addItemToUniform "ACE_morphine"} count [1,2];
{_unit addItemToUniform "16Rnd_9x21_green_Mag"} count [1,2];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
// Vest items
_unit addItemToVest "16Rnd_9x21_Mag";
_unit addItemToVest "ACE_optic_MRCO_2D";
{_unit addItemToVest "MiniGrenade"} count [1,2];
{_unit addItemToVest "SmokeShellOrange"} count [1,2];
{_unit addItemToVest "ACE_20Rnd_65_Creedmor_mag"} count [1,2,3,4];
{_unit addItemToVest "ACE_20Rnd_65x47_Scenar_mag"} count [1,2,3,4,5,6,7,8];
// Radios
_unit addItemToUniform "ACRE_PRC343";