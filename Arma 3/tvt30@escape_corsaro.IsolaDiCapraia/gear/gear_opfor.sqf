/*
	GEAR applied to OPFOR units
	called with
	[this,"SQL"] call FP_fnc_getGear;
	Custom gear can be added below by adding an entry in the switch-case and enter it in the unit
*/
private ["_me","_unit","_type","_UNIFORMS","_VESTS","_HEADGEAR","_WEP","_WEP_GL","_ATTACHMENTS","_MAG","_MAG_T","_GL_HE","_GL_SMOKES","_PISTOL_MAG","_PISTOL","_ITEMS"];
_me = __FILE__ call FP_fnc_getCurrentScript;
_unit = _this select 0;
_type = toUpper (_this select 1);

_UNIFORMS = ["U_CAF_AG_ME_FATIGUES_01","U_CAF_AG_ME_FATIGUES_01a",
 	"U_CAF_AG_ME_FATIGUES_01b", "U_CAF_AG_ME_FATIGUES_01c","U_CAF_AG_ME_FATIGUES_01d",
 	"U_CAF_AG_ME_ROBES_01"];
_VESTS = [	'V_TacVest_camo',
	'V_TacVest_camo',
	'V_BandollierB_rgr',
	'V_BandollierB_rgr'];
_HEADGEAR = ["H_Shemag_olive", "H_Shemag_olive_hs", "H_ShemagOpen_tan", "H_ShemagOpen_khk", "H_caf_ag_turban","H_caf_ag_turban", "H_caf_ag_wrap", "H_caf_ag_wrap"];


_WEP = "arifle_Katiba_F";
_WEP_GL = "arifle_Katiba_GL_F";
_ATTACHMENTS = ["optic_Aco"];
_MAG = "30Rnd_65x39_caseless_green";
_MAG_T = "30Rnd_65x39_caseless_green_mag_Tracer";
_GL_HE = "1Rnd_HE_Grenade_shell";
_GL_SMOKES = ["1Rnd_SmokeOrange_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"];
_PISTOL_MAG = "RH_8Rnd_9x18_Mak";
_PISTOL = "RH_mak";
_ITEMS = ["ItemMap","ItemCompass","ItemWatch","ItemRadio"];

_unit addUniform (_UNIFORMS call BIS_fnc_selectRandom);
_unit addVest (_VESTS call BIS_fnc_selectRandom);
_unit addHeadgear (_HEADGEAR call BIS_fnc_selectRandom);

switch (_type) do {

	case "SQL": {
		removeHeadgear _unit;
		_unit addHeadgear "H_Beret_ocamo";
		if (isClass(configFile>>"CfgPatches">>"task_force_radio")) then {
			_unit addBackpack (["tf_rt1523g","tf_rt1523g","tf_mr3000","tf_anprc155"] select ([CIVILIAN, BLUFOR,OPFOR,independent] find side _unit));
		};
		_unit linkItem "ItemGPS";

		_unit addMagazines [_MAG_T,6];
		_unit addMagazines [_MAG,4];
		_unit addMagazines [_GL_HE,2];
		{_unit addMagazines [_x,1]}foreach _GL_SMOKES;

		[_unit,_WEP_GL] call BIS_fnc_addWeapon;
		{_unit addPrimaryWeaponItem _x} foreach _ATTACHMENTS;
	};

	case "MED": {
		_unit addBackpack "B_AssaultPack_khk";
		_bp = unitBackpack _unit;
		clearItemCargoGlobal _bp;
		{_bp addItemCargoGlobal _x} foreach [["AGM_bandage",16], ["AGM_Morphine",12], ["AGM_Epipen",12], ["AGM_Bloodbag",4]];
		_unit addMagazines [_MAG,6];
		_unit addMagazines [_MAG_T,4];
		[_unit,_WEP] call BIS_fnc_addWeapon;
		{_unit addPrimaryWeaponItem _x} foreach _ATTACHMENTS;
	};

	case "RIFLEMAN": {
		_unit addMagazines [_MAG,6];
		_unit addMagazines [_MAG_T,4];
		[_unit,_WEP] call BIS_fnc_addWeapon;
		{_unit addPrimaryWeaponItem _x} foreach _ATTACHMENTS;
	};

	default {
		["%1: did not find type to apply to unit! %2",_me,_this] call BIS_fnc_error;
	};
};

// add common items

_unit addMagazine "HandGrenade";
_unit addMagazines ["SmokeShellRed", 2];

_unit addMagazines [_PISTOL_MAG,2];
_unit addWeapon _PISTOL;
{_unit linkItem _x}forEach _ITEMS;

// Medical
if (isClass (configFile >> "CfgPatches" >> "AGM_Medical")) then {
	{_unit addItem _x} forEach ["AGM_bandage","AGM_bandage", "AGM_Morphine"];
}else{
	_unit addItem "FirstAidKit";
};
