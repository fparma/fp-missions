params ["_unit", "_type"];

_unit addBackpack "ACE_FakeBackpack";
_unit addMagazine "hlc_30Rnd_9x19_B_MP5";
_unit addWeapon "hlc_smg_mp5k_PDW";
_unit addMagazine "RH_15Rnd_9x19_M9";
_unit addWeapon "RH_m9";
_unit addHandgunItem "RH_M6X";
removeBackpack _unit;

_unit addHeadgear "usm_helmet_cvc";
_unit forceAddUniform "usm_bdu_w";
_unit addVest "usm_vest_pasgt";
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch", "itemGPS"];

{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6];
_unit addItemToUniform "ACE_epinephrine";
{_unit addItemToUniform "ACE_morphine"} count [1,2];
_unit addItemToUniform "ACE_Flashlight_XL50";
_unit addItemToVest "hlc_30Rnd_9x19_B_MP5";
_unit addItemToUniform "ItemRadio";
_unit additem "ACE_key_west";

if (str _unit == "q0" || str _unit == "q10") then {
  _unit addItemToVest "ACRE_PRC148";
} else {
  _unit addItemToVest "SmokeShellGreen";
};
