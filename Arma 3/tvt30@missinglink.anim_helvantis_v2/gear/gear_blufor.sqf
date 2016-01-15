/*
	GEAR applied to BLUFOR units
	called with
	[this,"SQL"] call FP_fnc_getGear;
	Custom gear can be added below by adding an entry in the switch-case and enter it in the unit in the editor
*/

comment "Exported from Arsenal by cuel";

comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

private ["_me","_unit","_type","_UNIFORMS","_VESTS","_HEADGEAR","_WEP","_WEP_GL","_ATTACHMENTS","_MAG","_MAG_T","_GL_HE","_GL_SMOKES","_PISTOL_MAG","_PISTOL","_ITEMS"];
_me = __FILE__ call FP_fnc_getCurrentScript;
_unit = _this select 0;
_type = toUpper (_this select 1);

_UNIFORMS = ["Niko_USA_SnowMARPAT"];
_VESTS = ["Niko_USA_PlateCarrierH_Winter"];
_HEADGEAR = ["H_Watchcap_camo"];

_WEP = "RH_M4sbr_b";
_WEP_GL = "RH_M4sbr_b";
_ATTACHMENTS = [""];
_MAG = "RH_30Rnd_556x45_Mk262";
_MAG_T = "30Rnd_556x45_Stanag_Tracer_Yellow";
_PISTOL_MAG = "RH_16Rnd_40cal_usp";
_PISTOL = "RH_uspm";
_ITEMS = ["ItemMap","ItemCompass","ItemWatch","ItemRadio"];

_unit forceAddUniform (_UNIFORMS call BIS_fnc_selectRandom);
_unit addVest (_VESTS call BIS_fnc_selectRandom);
if (random 1 > .6) then {
	_unit addHeadgear (_HEADGEAR call BIS_fnc_selectRandom);
}else{
	_unit addGoggles "G_Balaclava_combat";
};


switch (_type) do {

	case "SQL": {
		removeHeadgear _unit;
		_unit addHeadgear "H_MilCap_gry";
		if (isClass(configFile>>"CfgPatches">>"task_force_radio")) then {
			_unit addBackpack (["tf_rt1523g_black","tf_rt1523g_black","tf_mr3000_rhs","tf_anprc155"] select ([CIVILIAN, BLUFOR,OPFOR,independent] find side _unit));
		};
		_unit linkItem "ItemGPS";

		_unit addMagazines [_MAG_T,6];
		_unit addMagazines [_MAG,6];

		[_unit,_WEP] call BIS_fnc_addWeapon;
	};

	case "MED": {
		_unit addBackpack "rhsusf_assault_eagleaiii_ucp";
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
		_unit addMagazines ["rhsusf_100Rnd_556x45_soft_pouch",4];
		[_unit, "rhs_weap_m249_pip"] call BIS_fnc_addWeapon;
	};

	default {
		["%1: did not find type to apply to unit! %2",_me,_this] call BIS_fnc_error;
	};
};

// add common items
_unit addMagazine "HandGrenade";
_unit addMagazines ["SmokeShellBlue", 1];

_unit addMagazines [_PISTOL_MAG,2];
_unit addWeapon _PISTOL;
{_unit linkItem _x}forEach _ITEMS;
