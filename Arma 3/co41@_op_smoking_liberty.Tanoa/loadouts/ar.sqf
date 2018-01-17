params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "150Rnd_762x54_Box_Tracer";
_unit addWeapon "LMG_Zafir_pointer_F";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "H_HelmetO_ghex_F";
_unit forceAddUniform "U_O_T_Soldier_F";
_unit addVest "V_HarnessO_ghex_F";
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","O_NVGoggles_ghex_F"];

// Uniform items
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_epinephrine";
{_unit addItemToUniform "MiniGrenade"} count [1,2];
{_unit addItemToUniform "ACE_morphine"} count [1,2];
{_unit addItemToUniform "SmokeShellOrange"} count [1,2];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
// Vest items
_unit addItemToVest "150Rnd_762x54_Box";
{_unit addItemToVest "150Rnd_762x54_Box_Tracer"} count [1,2];
// Radios
_unit addItemToUniform "ACRE_PRC343";