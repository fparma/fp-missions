params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "30Rnd_580x42_Mag_F";
_unit addMagazine "1Rnd_HE_Grenade_shell";
_unit addWeapon "arifle_CTAR_GL_ghex_F";
_unit addPrimaryWeaponItem "optic_Arco_ghex_F";
_unit addWeapon "Laserdesignator_02_ghex_F";
_unit addMagazine "Laserbatteries";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "H_HelmetSpecO_ghex_F";
_unit forceAddUniform "U_O_T_Soldier_F";
_unit addVest "V_HarnessO_ghex_F";
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","O_NVGoggles_ghex_F"];

// Uniform items
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACE_epinephrine";
_unit addItemToUniform "ACE_HuntIR_monitor";
_unit addItemToUniform "ACE_Flashlight_MX991";
{_unit addItemToUniform "ACE_morphine"} count [1,2];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
// Vest items
_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";
{_unit addItemToVest "30Rnd_580x42_Mag_F"} count [1,2,3];
{_unit addItemToVest "1Rnd_Smoke_Grenade_shell"} count [1,2];
{_unit addItemToVest "30Rnd_580x42_Mag_Tracer_F"} count [1,2,3,4];
{_unit addItemToVest "1Rnd_HE_Grenade_shell"} count [1,2,3,4,5,6,7,8,9,10];