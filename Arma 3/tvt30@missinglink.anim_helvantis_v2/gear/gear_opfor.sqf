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

_UNIFORMS = ["U_I_CombatUniform"];
_VESTS = ["rhs_6b23_rifleman"];
_HEADGEAR = ["H_ShemagOpen_khk","rhs_tsh4_ess","rhs_tsh4_bala","rhs_tsh4","rds_Woodlander_cap3","rds_Woodlander_cap1","rds_Woodlander_cap4"];

_WEP = "rhs_weap_ak74m";
_WEP_GL = "rhs_weap_ak74m_2mag";
_ATTACHMENTS = [""];
_MAG = "rhs_30Rnd_545x39_AK";
_MAG_T = "rhs_30Rnd_545x39_AK_green";
_PISTOL_MAG = "RH_8Rnd_9x18_Mak";
_PISTOL = "RH_mak";
_ITEMS = ["ItemMap","ItemCompass","ItemWatch","ItemRadio"];

_unit forceAddUniform (_UNIFORMS call BIS_fnc_selectRandom);
_unit addVest (_VESTS call BIS_fnc_selectRandom);
_head = (_HEADGEAR call BIS_fnc_selectRandom);
_unit addHeadgear _head;

if (["rds_", _head] call BIS_fnc_inString && {random 1 > .8}) then {
	_unit addGoggles "G_Balaclava_oli";
};

switch (_type) do {

	case "SQL": {
		removeHeadgear _unit;
		removeVest _unit;
		_unit addVest "rhs_6b23_6sh92_headset_mapcase";
		_unit addHeadgear "LOP_H_Bardak_beret";
		if (isClass(configFile>>"CfgPatches">>"task_force_radio")) then {
			_unit addBackpack (["tf_rt1523g_black","tf_rt1523g_black","tf_mr3000_rhs","tf_anprc155"] select ([CIVILIAN, BLUFOR,OPFOR,independent] find side _unit));
		};
		_unit linkItem "ItemGPS";

		_unit addMagazines [_MAG_T,6];
		_unit addMagazines [_MAG,6];

		[_unit,_WEP_GL] call BIS_fnc_addWeapon;
	};

	case "MED": {
		_unit addBackpack "rhs_sidor";
		_bp = unitBackpack _unit;
		clearItemCargoGlobal _bp;
		{_bp addItemCargoGlobal _x} foreach [["ACE_fieldDressing",14],
	    ["ACE_morphine",12],
	    ["ACE_epinephrine",12],
	    ["ACE_bloodIV",2]];
		_unit addMagazines [_MAG,6];
		_unit addMagazines [_MAG_T,4];
		[_unit,_WEP] call BIS_fnc_addWeapon;
	};

	case "RIFLEMAN": {
		_unit addMagazines [_MAG,6];
		_unit addMagazines [_MAG_T,4];
		[_unit,_WEP] call BIS_fnc_addWeapon;
	};

		case "MG": {
		_unit addMagazines ["hlc_75Rnd_762x39_m_rpk",8];
		[_unit, "hlc_rifle_rpk"] call BIS_fnc_addWeapon;
	};

	default {
		["%1: did not find type to apply to unit! %2",_me,_this] call BIS_fnc_error;
	};
};

// add common items

_unit addMagazine "HandGrenade";
_unit addMagazines ["SmokeShellRed", 1];

_unit addMagazines [_PISTOL_MAG,2];
_unit addWeapon _PISTOL;
{_unit linkItem _x}forEach _ITEMS;
