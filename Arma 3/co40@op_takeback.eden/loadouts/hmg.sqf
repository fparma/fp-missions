params ["_unit", "_type"];

_unit addBackpack "ACE_FakeBackpack";
_unit addMagazine "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";
_unit addWeapon "CUP_lmg_M240";
_unit addMagazine "RH_15Rnd_9x19_M9";
_unit addWeapon "RH_m9";
_unit addHandgunItem "RH_M6X";
removeBackpack _unit;

_unit addHeadgear "usm_helmet_pasgt_g_w";
_unit forceAddUniform "usm_bdu_w";
_unit addVest "usm_vest_pasgt_lbv_mg";
_unit addBackpack "usm_pack_762x51_ammobelts";
clearAllItemsFromBackpack _unit;
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6];
_unit addItemToUniform "ACE_epinephrine";
{_unit addItemToUniform "ACE_morphine"} count [1,2];
_unit addItemToUniform "ACE_Flashlight_XL50";

{_unit addItemToVest "CUP_HandGrenade_M67"} count [1,2];
{_unit addItemToVest "SmokeShellGreen"} count [1,2];
{_unit addItemToVest "RH_15Rnd_9x19_M9"} count [1,2];

_unit addItemToBackpack "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";

_unit addItemToUniform "ItemRadio";
