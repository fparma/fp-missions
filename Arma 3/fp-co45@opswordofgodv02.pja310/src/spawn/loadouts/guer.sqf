/*
///////////////////////////
	ARMA 3 Group equipment script
	Version: 0.1
	Author: Cuel
	Created: 2014-01-18
	Purpose: Equips a group with specific loadout.
	@param {Group} - Group to equip with loadout
	Example:
	0 = [group player] execVM "src\spawn\loadouts\guer.sqf"
///////////////////////////
*/

_group = [_this,0,grpNull,[grpNull]] call BIS_fnc_param;

if (isNull _group) exitWith {
	["Incorrect group for guer loadout"] call BIS_fnc_error;
};

_headgear = [
	'H_Shemag_olive_hs',
	'H_Bandanna_khk_hs',
	'H_Watchcap_blk',
	'H_ShemagOpen_khk',
	'H_Shemag_tan',
	'H_ShemagOpen_khk',
	'H_Shemag_tan',
	'H_Bandanna_cbr',
	'H_Bandanna_surfer',
	'H_Cap_blk'
];

_vests = [
	'V_I_G_resistanceLeader_F',
	'V_TacVest_khk',
	'V_BandollierB_khk',
	'V_BandollierB_blk',
	'V_TacVest_blk',
	'rhs_6sh92',
	'rhs_6sh92_radio',
	'V_TacVest_camo'
];

_uniforms = [
	 'U_BG_Guerrilla_6_1',
	 'U_BG_Guerilla1_1',
	 'U_BG_Guerilla2_2',
	 'U_BG_Guerilla2_1',
	 'U_BG_Guerilla3_1',
	 'Niko_USA_R_NomadPCU',
	 'Niko_USA_R_ERDLLimeOD'
	 
 ];

_ldrUniforms = [
	'U_BG_Guerilla3_2',
	'U_OG_Guerilla3_1',
	'U_OG_Guerilla3_2',
	'U_C_HunterBody_grn'
];

_rifles = [
	'hlc_rifle_ak74',
	'hlc_rifle_rpk',
	'hlc_rifle_aks74u',
	'hlc_rifle_aks74u',
	'rhs_weap_ak103_2',
	'rhs_weap_akms',
	'CUP_srifle_LeeEnfield',
	'rhs_weap_M590_5RD',
	'rhs_weap_M590_5RD',
	'rhs_weap_M590_8RD',
	'srifle_DMR_06_camo_F'
];

_mgs = [
	'rhs_weap_pkm',
	'hlc_rifle_rpk'
];

// pistol
_pistols = [
	'rh_cz75'
];

_glasses = [
	'G_Sport_Red',
	'G_Sport_Checkered',
	'G_Sport_Blackyellow',
	'G_Squares',
	'G_Spectacles_Tinted'
];

_faces = [
	'AfricanHead_01',
	'AfricanHead_02',
	'AfricanHead_03'
];

_leader = leader _group;
_mg = ((units _group) call BIS_fnc_selectRandom);
_atUsed = false;

if (!isDedicated) then {
	waitUntil {!isNull player};
};

for "_i" from 0 to (count units _group)-1 do {
	_unit = (units _group) select _i;
	if (local _unit) then {
		_unit setVariable ["fp_face", (_faces call bis_fnc_selectRandom)];
		removeAllWeapons _unit;
		{_unit removeMagazine _x} foreach (magazines _unit);
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadGear _unit;
		if (!isPlayer _unit) then {
			removeGoggles _unit;
		};
		{
			_unit unassignItem _x;
			_unit removeItem _x;
		} foreach (assignedItems _unit);

		if (random 100 > 10) then {
			_unit addHeadgear (_headgear call BIS_fnc_selectRandom);
		};
		_unit addVest (_vests call BIS_fnc_selectRandom);

		if (_unit == _leader) then {
			_unit forceaddUniform (_ldrUniforms call BIS_fnc_selectRandom);
		}else{
			_unit forceaddUniform (_uniforms call BIS_fnc_selectRandom);
		};
		
		if (random 100 > 70 && !isPlayer _unit) then {
			_unit addGoggles (_glasses call BIS_fnc_selectRandom);
		};

		_weapon = _rifles call BIS_fnc_selectRandom;

		if (_unit == _mg && count units _group > 3) then {
			_weapon = _mgs call BIS_fnc_selectRandom;
		};

		if (!_atUsed && _weapon in ['hlc_rifle_aks74u', 'rhs_weap_M590_5RD']) then {
			_atUsed = true;
			_unit addBackPack "CUP_B_RPGPack_Khaki";
			[_unit,"rhs_weap_rpg7",2] call bis_fnc_addweapon;
		};
		
		if (_weapon in ['arifle_mas_akm_gl', 'arifle_mas_ak_74m_gl_c']) then {
			_unit addMagazines ["1Rnd_HE_Grenade_shell",2];
		};

		_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
		if (count _magazines > 1) then {
			{[_unit, (_magazines select 1)] call CBA_fnc_AddMagazine} count [0,1];
		};
		{[_unit,(_magazines select 0)] call CBA_fnc_AddMagazine;} count [0,1,2,3,4];
		[_unit, _weapon] call CBA_fnc_addWeapon;
			[_unit, "SmokeShell"] call CBA_fnc_AddMagazine;
		if (random 1 > 0.5) then {
			[_unit, "HandGrenade"] call CBA_fnc_AddMagazine;
		};
		 [_unit, (_pistols call BIS_fnc_selectRandom)] call CBA_fnc_addWeapon;
		_pistolammo = getArray (configFile / "CfgWeapons" / (handgunWeapon _unit) / "magazines");
		{[_unit, (_pistolammo call BIS_fnc_selectRandom)] call CBA_fnc_AddMagazine}count [0,1];
		{
				_unit linkItem _x;
		}forEach ["ItemMap","ItemCompass","ItemWatch"];
	};
};

true