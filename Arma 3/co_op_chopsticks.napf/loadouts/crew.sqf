params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "30Rnd_65x39_caseless_mag";
_unit addWeapon "arifle_MXC_F";
// Handgun
_unit addMagazine "16Rnd_9x21_Mag";
_unit addWeapon "hgun_P07_F";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "H_HelmetCrew_B";
_unit forceAddUniform "U_B_CombatUniform_mcam_vest";
_unit addVest "V_BandollierB_rgr";
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

// Uniform items
_unit addItemToUniform "NVGoggles";
_unit addItemToUniform "ACE_epinephrine";
{_unit addItemToUniform "ACE_morphine"} count [1,2];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4];
// Vest items
_unit addItemToVest "16Rnd_9x21_Mag";
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "Chemlight_green";
_unit addItemToVest "ACE_Flashlight_MX991";
{_unit addItemToVest "HandGrenade"} count [1,2];
{_unit addItemToVest "30Rnd_65x39_caseless_mag"} count [1,2,3,4];
// Radios
_unit addItemToUniform "ACRE_PRC343";

// leader radio
if (toLower (str _unit) in ["sc1", "sc2"]) then {
	_unit addBackpack "B_AssaultPack_rgr";
	clearAllItemsFromBackpack _unit;
	_unit addItemToBackpack "ACRE_PRC117F";
};