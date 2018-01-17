params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "30Rnd_9x21_Mag_SMG_02_Tracer_Green";
_unit addWeapon "SMG_02_ACO_F";
_unit addPrimaryWeaponItem "optic_ACO_grn_smg";
// Handgun
_unit addMagazine "16Rnd_9x21_Mag";
_unit addWeapon "hgun_Rook40_F";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "H_Cap_headphones";
_unit forceAddUniform "U_O_PilotCoveralls";
_unit addVest "V_HarnessO_ghex_F";
_unit addBackpack "B_FieldPack_ghex_F";
clearAllItemsFromBackpack _unit;
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

// Uniform items
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "16Rnd_9x21_green_Mag";
{_unit addItemToUniform "ACE_epinephrine"} count [1,2];
{_unit addItemToUniform "ACE_morphine"} count [1,2,3,4];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6];
// Vest items
_unit addItemToVest "G_Aviator";
{_unit addItemToVest "SmokeShellOrange"} count [1,2];
{_unit addItemToVest "30Rnd_9x21_Mag_SMG_02"} count [1,2];
{_unit addItemToVest "30Rnd_9x21_Mag_SMG_02_Tracer_Green"} count [1,2];
// Backpack items
_unit addItemToBackpack "H_CrewHelmetHeli_O";
_unit addItemToBackpack "O_NVGoggles_ghex_F";
// Radios
_unit addItemToBackpack "ACRE_PRC117F";
_unit addItemToUniform "ACRE_PRC343";