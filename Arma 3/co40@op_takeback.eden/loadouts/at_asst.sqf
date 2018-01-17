params ["_unit", "_type"];

_unit addBackpack "ACE_FakeBackpack";
_unit addMagazine "30Rnd_556x45_Stanag";
_unit addWeapon "hlc_wp_m16a2";
_unit addMagazine "RH_15Rnd_9x19_M9";
_unit addWeapon "RH_m9";
_unit addHandgunItem "RH_M6X";
removeBackpack _unit;

_unit addWeapon "binocular";
_unit addHeadgear "usm_helmet_pasgt_w";
_unit forceAddUniform "usm_bdu_w";
_unit addVest "V_Chestrig_rgr";
_unit addBackpack "B_Kitbag_rgr";
clearAllItemsFromBackpack _unit;
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6];
_unit addItemToUniform "ACE_epinephrine";
{_unit addItemToUniform "ACE_morphine"} count [1,2];
_unit addItemToUniform "ACE_Flashlight_XL50";

{_unit addItemToVest "30Rnd_556x45_Stanag"} count [1,2,3,4,5,6,7,8];
{_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red"} count [1,2];
_unit addItemToVest "CUP_HandGrenade_M67";

{_unit addItemToBackpack "CUP_MAAWS_HEDP_M"} count [1,2];
{_unit addItemToBackpack "CUP_MAAWS_HEAT_M"} count [1,2];

_unit addItemToUniform "ItemRadio";
