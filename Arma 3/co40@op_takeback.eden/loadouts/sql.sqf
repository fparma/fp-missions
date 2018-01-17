params ["_unit", "_type"];

_unit addBackpack "ACE_FakeBackpack";
_unit addMagazine "30Rnd_556x45_Stanag";
_unit addMagazine "1Rnd_HE_Grenade_shell";
_unit addWeapon "hlc_rifle_m203";
_unit addMagazine "RH_15Rnd_9x19_M9";
_unit addWeapon "RH_m9";
_unit addHandgunItem "RH_M6X";
_unit addWeapon "ACE_Vector";
removeBackpack _unit;

_unit addHeadgear "usm_helmet_pasgt_g_w";
_unit forceAddUniform "usm_bdu_w";
_unit addVest "usm_vest_LBE_gr";
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6];
_unit addItemToUniform "ACE_epinephrine";
{_unit addItemToUniform "ACE_morphine"} count [1,2];
_unit addItemToUniform "ACE_CableTie";
_unit addItemToUniform "ACE_microDAGR";

_unit addItemToVest "ACE_Flashlight_XL50";
_unit addItemToVest "ACE_MapTools";
{_unit addItemToVest "CUP_HandGrenade_M67"} count [1,2];
{_unit addItemToVest "SmokeShellGreen"} count [1,2];
{_unit addItemToVest "RH_15Rnd_9x19_M9"} count [1,2];
{_unit addItemToVest "30Rnd_556x45_Stanag"} count [1,2,3,4,5];
{_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red"} count [1,2,3,4,5];
{_unit addItemToVest "1Rnd_SmokeGreen_Grenade_shell"} count [1,2,3];
{_unit addItemToVest "1Rnd_HE_Grenade_shell"} count [1,2,3,4,5,6];
{_unit addItemToVest "UGL_FlareWhite_F"} count [1,2];
{_unit addItemToVest "UGL_FlareRed_F"} count [1,2];
_unit addItemToVest "1Rnd_SmokePurple_Grenade_shell";
_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";
_unit addItemToVest "1Rnd_Smoke_Grenade_shell";

_unit addItemToUniform "ItemRadio";
_unit addItemToVest "ACRE_PRC148";
