/*
	GEAR applied to INDEP units
	called with
	[this,"SQL"] call FP_fnc_getGear;
	Custom gear can be added below by adding an entry in the switch-case and enter it in the unit
*/
private ["_me","_unit","_type","_UNIFORMS","_VESTS","_HEADGEAR","_WEP","_WEP_GL","_ATTACHMENTS","_MAG","_MAG_T","_GL_HE","_GL_SMOKES","_PISTOL_MAG","_PISTOL","_ITEMS"];
_me = __FILE__ call FP_fnc_getCurrentScript;
_unit = _this select 0;
_type = toUpper (_this select 1);


_UNIFORMS = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Poloshirt_stripped"];
_VESTS = [""];
_HEADGEAR = ["H_Bandanna_surfer","H_Bandanna_cbr","H_Hat_grey","H_StrawHat_dark","H_TurbanO_blk","H_Hat_checker"];

_WEP = "";
_WEP_GL = "";
_ATTACHMENTS = [""];
_MAG = "";
_MAG_T = "";
_GL_HE = "";
_PISTOL_MAG = "";
_PISTOL = "";
_ITEMS = ["ItemMap","ItemCompass","ItemWatch"];

_unit addUniform (_UNIFORMS call BIS_fnc_selectRandom);
_unit addVest (_VESTS call BIS_fnc_selectRandom);
_unit addHeadgear (_HEADGEAR call BIS_fnc_selectRandom);
	
switch (_type) do {
	
	case "MAN": {

	};

	default {
		["%1: did not find type to apply to unit! %2",_me,_this] call BIS_fnc_error;
	};
};

// add common items
//_unit addMagazine "HandGrenade";
//_unit addMagazines ["SmokeShellGreen", 2];

{_unit linkItem _x}forEach _ITEMS;

// Medical
if (isClass (configFile >> "CfgPatches" >> "AGM_Medical")) then {
	{_unit addItem _x} forEach ["AGM_bandage","AGM_bandage", "AGM_Morphine"];
}else{
	_unit addItem "FirstAidKit";
};
