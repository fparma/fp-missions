params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "20Rnd_556x45_UW_mag";
_unit addWeapon "arifle_SDAR_F";
// Binoc
_unit addWeapon "ACE_Vector";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "H_Beret_blk";
_unit forceAddUniform "U_B_Wetsuit";
_unit addVest "V_RebreatherB";
_unit addBackpack "B_Carryall_oli";
clearAllItemsFromBackpack _unit;
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","NVGoggles_OPFOR"];

// Uniform items
_unit addItemToUniform "ACE_Clacker";
_unit addItemToUniform "ACE_DefusalKit";
{_unit addItemToUniform "20Rnd_556x45_UW_mag"} count [1,2,3];
// Backpack items
_unit addItemToBackpack "ACE_MapTools";
_unit addItemToBackpack "ACE_microDAGR";
_unit addItemToBackpack "hlc_smg_mp5sd6";
_unit addItemToBackpack "ACE_epinephrine";
_unit addItemToBackpack "VSM_Mich2000_OGA_OD";
_unit addItemToBackpack "CUP_HandGrenade_M67";
_unit addItemToBackpack "ACE_Flashlight_MX991";
_unit addItemToBackpack "VSM_FAPC_Operator_OGA_OD";
_unit addItemToBackpack "VSM_MulticamGrey_Crye_Camo";
{_unit addItemToBackpack "ACE_morphine"} count [1,2];
{_unit addItemToBackpack "ACE_Chemlight_IR"} count [1,2];
{_unit addItemToBackpack "DemoCharge_Remote_Mag"} count [1,2];
{_unit addItemToBackpack "ACE_fieldDressing"} count [1,2,3,4,5,6];
{_unit addItemToBackpack "hlc_30Rnd_9x19_SD_MP5"} count [1,2,3,4,5,6,7];
// Radios
_unit addItemToBackpack "ACRE_PRC343";