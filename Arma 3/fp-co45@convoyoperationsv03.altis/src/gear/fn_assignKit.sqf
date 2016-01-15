/*
	This file is called from fn_getKit.sqf
	You can manually add stuff to units here.
	note that an init line of [this,"PLT"] would results in the switch - case below "PLT"- case.
*/

// change this to change gear.
#include "aaf_vanilla.sqf";

_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;
if (isNull _unit || _kit == "") exitWith {["Incorrect unit or type (string) for unit kit : (%1)",_this] call BIS_fnc_log};


// clear unit
removeAllWeapons _unit;
{_unit removeMagazine _x} foreach (magazines _unit);
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadGear _unit;
{
	_unit unassignItem _x;
	_unit removeItem _x;
} foreach (assignedItems _unit);

//give random uniform
if (!(_type in ["CREWMAN","PILOT"])) then {
	_unit addUniform (_UNIFORMS call BIS_fnc_selectRandom);
};
// give designated loadouts
switch (toUpper _type) do {
	case "PLT": {
		_unit addVest (_VESTS select 0);
		_unit addHeadGear _PLT_CAP;
		if (isClass(configFile>>"CfgPatches">>"task_force_radio")) then {
			_unit addBackpack (["tf_anprc155","tf_anprc155","tf_anprc155","tf_anprc155"] select ([CIVILIAN, BLUFOR,OPFOR,independent] find side _unit));
		};
		_unit addMagazines [_STANDARD_SMOKE,2];
		_unit addMagazines [_GRENADE,2];
		_unit addMagazines [_STANDARD_MAG,8];
		_unit addMagazines [_STANDARD_MAG_T,4];
		_unit addMagazines [_GL_HE,4];
		_unit addMagazines [_CHEM,2];
		{_unit addMagazine _x} forEach _GL_SMOKES;
		_unit linkItem _GPS; 
		_unit addWeapon _PLT_RIFLE;
		{if (_x != "") then {_unit addPrimaryWeaponItem _x};} forEach  _PLT_ATTACHMENTS;
		_unit selectWeapon _PLT_RIFLE;
		_unit addMagazine "LaserBatteries";
		_unit addWeapon "Laserdesignator";
	};

	case "SQL": {
		_unit addVest (_VESTS select 0);
		_unit addHeadGear _SQL_CAP;
		if (isClass(configFile>>"CfgPatches">>"task_force_radio")) then {
			_unit addBackpack (["tf_anprc155","tf_anprc155","tf_anprc155","tf_anprc155"] select ([CIVILIAN, BLUFOR,OPFOR,independent] find side _unit));
		};
		_unit addMagazines [_STANDARD_SMOKE,2];
		_unit addMagazines [_GRENADE,2];
		_unit addMagazines [_STANDARD_MAG,8];
		_unit addMagazines [_STANDARD_MAG_T,4];
		_unit addMagazines [_GL_HE,4];
		_unit addMagazines [_CHEM,2];
		{_unit addMagazine _x} forEach _GL_SMOKES;
		_unit linkItem _GPS;
		_unit addWeapon _SQL_RIFLE;		
		{if (_x != "") then {_unit addPrimaryWeaponItem _x};} forEach  _SQL_ATTACHMENTS;
		_unit selectWeapon _SQL_RIFLE;

		_unit addMagazine "LaserBatteries";
		_unit addWeapon "Laserdesignator";
	};

	case "MEDIC":{
		_unit addVest (_VESTS call BIS_fnc_selectRandom);
		_unit addHeadGear _MED_CAP ;
		if (_MED_BP != "") then {
			_unit addBackPack _MED_BP;
			private "_bp";
			_bp = (unitBackpack _unit);
			clearItemCargoGlobal _bp;
			if (isClass (configFile >> "CfgPatches" >> "AGM_Medical")) then {
				_bp addItemCargoGlobal ["AGM_Bandage",16];
				_bp addItemCargoGlobal ["AGM_Morphine",12];
				_bp addItemCargoGlobal ["AGM_Epipen",12];
				_bp addItemCargoGlobal ["AGM_Bloodbag",4];
			}else{
				_bp addItemCargoGlobal ["FirstAidKit",12];
				_bp addItemCargoGlobal ["Medikit",1];
			};
		};
		_unit addMagazines [_STANDARD_SMOKE,2];
		_unit addMagazines [_STANDARD_MAG,6];
		_unit addMagazines [_STANDARD_MAG_T,2];		
		_unit addWeapon _MED_RIFLE;
		{if (_x != "") then {_unit addPrimaryWeaponItem _x};} forEach _MED_ATTACHMENTS;
		_unit selectWeapon _MED_RIFLE;
	};

	case "AR":{
		_unit addVest (_VESTS call BIS_fnc_selectRandom);
		_unit addHeadGear _MG_CAP;
		_unit addMagazines [_STANDARD_SMOKE,2];
		_unit addMagazines [_GRENADE,2]; 
		_unit addMagazines [_STANDARD_MG_MAG,4];
		_unit addWeapon _MG_RIFLE;
		removeAllPrimaryWeaponItems _unit;
		{if (_x != "") then {_unit addPrimaryWeaponItem _x};} forEach  _MG_ATTACHMENTS;
		_unit selectWeapon _MG_RIFLE;
	};

	case "ASSTAR":{
		_unit addVest (_VESTS call BIS_fnc_selectRandom);
		_unit addHeadGear _MG_ASS_CAP;
		if (_MG_ASS_BP != "") then {
			_unit addBackPack _MG_ASS_BP;		
			(unitBackPack _unit) addMagazineCargoGlobal [_STANDARD_MG_MAG,6];
		};
		_unit addMagazines [_STANDARD_SMOKE,2];
		_unit addMagazines [_GRENADE,2];
		_unit addMagazines ["RH_60Rnd_556x45_M855A1",10];
		_unit addWeapon "RH_M27IAR";
		{if (_x != "") then {_unit addPrimaryWeaponItem _x};} forEach _MG_ASS_ATTACHMENTS;
		_unit selectWeapon "RH_M27IAR";
	};

	case "AT":{
		_unit addVest (_VESTS call BIS_fnc_selectRandom);
		if (_AT_BP != "" ) then {
			_unit addBackPack _AT_BP;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addMagazineCargoGlobal [_AT_ROCKET2,1];
			(unitBackpack _unit) addMagazineCargoGlobal [_AT_ROCKET1,1];
		};
		_unit addHeadGear _AT_CAP;
		_unit addMagazines [_STANDARD_SMOKE,2];
		_unit addMagazines [_GRENADE,2];
		_unit addMagazines [_STANDARD_MAG,6];
		_unit addMagazines [_STANDARD_MAG_T,4];	
		_unit addWeapon _AT_RIFLE;
		{if (_x != "") then {_unit addPrimaryWeaponItem _x};} forEach _AT_ATTACMENTS;
		_unit addWeapon _AT_ROCKET_LAUNCHER;
		_unit addSecondaryWeaponItem _AT_SCOPE;
		_unit selectWeapon _AT_RIFLE;
	};

	case "ATASS":{
		_unit addVest (_VESTS call BIS_fnc_selectRandom);
		_unit addHeadGear _AT_ASS_CAP;
		if (_AT_ASS_BP != "") then {
			_unit addBackPack _AT_ASS_BP;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackPack _unit) addMagazineCargoGlobal [_AT_ASS_ROCKET1,1];
			(unitBackPack _unit) addMagazineCargoGlobal [_AT_ASS_ROCKET2,1];
		};
		_unit addMagazines [_STANDARD_SMOKE,2];
		_unit addMagazines [_GRENADE,2];
		_unit addMagazines [_STANDARD_MAG,6];
		_unit addMagazines [_STANDARD_MAG_T,4];	
		_unit addWeapon _AT_ASS_RIFLE;
		{if (_x != "") then {_unit addPrimaryWeaponItem _x};} forEach _AT_ASS_ATTACHMENTS;
		_unit selectWeapon _AT_ASS_RIFLE;
	};

	case "MARKSMAN":{
		_unit addVest (_VESTS call BIS_fnc_selectRandom);
		_unit addHeadGear _MARKSMAN_CAP;
		if (_ENGI_BP != "") then {
			_unit addBackPack _MARKSMAN_BP;
			{(unitBackPack _unit) addMagazineCargoGlobal _x} forEach [[_STANDARD_MAG,3],[_STANDARD_MAG_T,3]];
		};
		_unit addMagazines [_STANDARD_SMOKE,2];
		_unit addMagazines [_GRENADE,1];
		_unit addMagazines [_MARKSMAN_MAG,6];
		_unit addMagazines [_MARKSMAN_MAG_T,3];
		_unit addItem _MARKSMAN_NVG_ATTACHMENT;
		_unit addItem "AGM_PreloadedMissileDummy";
		_unit addWeapon _MARKSMAN_RIFLE;
		{if (_x != "") then {_unit addPrimaryWeaponItem _x};} forEach _STANDARD_ATTACHMENTS;
		_unit selectWeapon _MARKSMAN_RIFLE;
		if (!isNil "_MARKSMAN_SECONDARY" && {_MARKSMAN_SECONDARY != ""}) then {
			_unit addWeapon _MARKSMAN_SECONDARY;
		};
	};

	case "ENGINEER":{
		_unit addVest (_VESTS call BIS_fnc_selectRandom);
		_unit addHeadGear _ENGI_CAP;
		if (_ENGI_BP != "") then {
			_unit addBackPack _ENGI_BP;
			clearMagazineCargoGlobal (unitBackpack _unit);
			{(unitBackPack _unit) addMagazineCargoGlobal _x} forEach [[_ENGI_EXPL1,1],[_ENGI_EXPL2,2]];
			{(unitBackPack _unit) addItemCargoGlobal [_x,1];}foreach ["ToolKit","AGM_Clacker","AGM_DefusalKit"];
		};
		_unit addMagazines [_STANDARD_SMOKE,2];
		_unit addMagazines [_GRENADE,1];
		_unit addMagazines [_STANDARD_MAG,6];
		_unit addMagazines [_STANDARD_MAG_T,2];
		_unit addWeapon _ENGI_RIFLE;
		{if (_x != "") then {_unit addPrimaryWeaponItem _x};} forEach _ENGI_ATTACHMENTS;
		_unit selectWeapon _ENGI_RIFLE;
	};

	case "CREWMAN":{
		_unit addVest _CREW_AND_PILOT_VEST;
		_unit addUniform _CREW_UNIFORM;
		_unit addHeadGear _CREW_CAP;
		_unit addMagazines [_STANDARD_SMOKE,2];
		_unit addMagazines [_CREW_MAG,10];
		_unit addWeapon _CREW_SMG;
		_unit selectWeapon _CREW_SMG;
		{if (_x != "") then {_unit addPrimaryWeaponItem _x};} forEach _CREW_ATTACHMENTS;
	};

	case "PILOT":{
		_unit addUniform _HELI_PILOT_UNIFORM;
		_unit addVest _CREW_AND_PILOT_VEST;
		_unit addHeadGear _HELI_PILOT_CAP;
		_unit addMagazines [_STANDARD_SMOKE,2];
		_unit addMagazines [_CREW_MAG,5];
		_unit addWeapon _CREW_SMG;
		_unit selectWeapon _CREW_SMG;
		{if (_x != "") then {_unit addPrimaryWeaponItem _x};} forEach _CREW_ATTACHMENTS;
	};
	default {
		0 = 0 spawn {sleep .5; hint format ["Could not find type %1 in assignKit.sqf",_type];};
	};
};

// add common items
_unit addMagazines [_STANDARD_PISTOL_MAG,2];
_unit addWeapon _STANDARD_PISTOL;
_unit addHandgunItem _PIST_LAM;
{
		_unit linkItem _x;
}forEach _STANDARD_ITEMS;

// Medical
if (isClass (configFile >> "CfgPatches" >> "AGM_Medical")) then {
	{_unit addItem _x} forEach ["AGM_bandage","AGM_bandage", "AGM_Morphine"];
}else{
	_unit addItem "FirstAidKit";
};