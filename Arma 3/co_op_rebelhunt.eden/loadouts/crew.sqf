params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "hlc_30rnd_556x45_b_HK33";
_unit addWeapon "hlc_rifle_hk53RAS";
_unit addPrimaryWeaponItem "RH_cmore";
// Handgun
_unit addMagazine "RH_7Rnd_45cal_m1911";
_unit addWeapon "RH_m1911";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "usm_helmet_cvc";
_unit forceAddUniform "CUP_U_B_USMC_MARPAT_WDL_RollUpKneepad";
_unit addVest "CUP_V_B_MTV";
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

// Uniform items
_unit addItemToUniform "ACE_epinephrine";
{_unit addItemToUniform "ACE_morphine"} count [1,2];
{_unit addItemToUniform "SmokeShellGreen"} count [1,2];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4];
// Vest items
{_unit addItemToVest "RH_7Rnd_45cal_m1911"} count [1,2];
{_unit addItemToVest "hlc_30rnd_556x45_t_HK33"} count [1,2,3];
{_unit addItemToVest "hlc_30rnd_556x45_b_HK33"} count [1,2,3];

// Radios
_unit addItemToUniform "ACRE_PRC343";
if ((toLower (str _unit)) in  ["com1", "com2", "com3", "com4"]) then {
	_unit addItemToUniform "ACRE_PRC148";	
};