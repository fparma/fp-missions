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
	'H_Watchcap_blk',
	'H_ShemagOpen_khk',
	'rhsusf_opscore_02',
	'rhsusf_opscore_02_tan',
	'rhsusf_opscore_01',
	'rhsusf_opscore_01_tan',
	'H_Shemag_tan',
	'H_Cap_blk',
	'rhsusf_ach_bare_headset'
];

_vests = [
	'V_PlateCarrierSpec_rgr',
	'V_PlateCarrier1_blk',
	'AAF_D_PlateCarrier_IAGL',
	'V_PlateCarrierL_CTRG'
];

_masks = [ 
	'G_Bandanna_beast',
	'G_Balaclava_blk',
	'G_Balaclava_oli',
	'G_Bandanna_khk',
	'rhs_scarf'
];

_uniforms = [
	 'U_Rangemaster',
	 'U_BG_Guerilla1_1',
	 'U_BG_Guerilla2_1',
	 'U_BG_Guerilla2_2',
	 'U_BG_Guerilla2_3',
	 'U_BG_leader',
	 'U_BG_Guerilla1_1',
	 'U_BG_Guerilla2_2',
	 'U_BG_Guerilla2_3',
	 'U_BG_leader'
 ];

_ldrUniforms = [
	'U_BG_Guerilla3_2',
	'U_OG_Guerilla3_1',
	'U_OG_Guerilla3_2',
	'U_C_HunterBody_grn'
];

_rifles = [
	'RH_M16A3',
	'RH_M16A3',
	'rhs_weap_m14ebrri',
	'RH_M4_moe',
	'hlc_rifle_auga2carb',
	'RH_m4a1_ris_wdl',
	'hlc_rifle_g3a3',
	'hlc_rifle_auga3_GL',
	'arifle_MX_GL_Black_F'
];

_mgs = [
	'hlc_lmg_m60e4',
	'rhs_weap_m249_pip',
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

_backpacks = [
	'B_Carryall_khk'
];

_leader = leader _group;
_mg = ((units _group) call BIS_fnc_selectRandom);

if (!isDedicated) then {
	waitUntil {!isNull player};
};

for "_i" from 0 to (count units _group)-1 do {
	_unit = (units _group) select _i;
	if (local _unit) then {
		removeAllWeapons _unit;
		{_unit removeMagazine _x} foreach (magazines _unit);
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadGear _unit;
				if (!isPlayer _unit) then {
			removeGoggles _unit;
		};
		_unit addgoggles (_masks call bis_fnc_selectrandom);

		{
			_unit unassignItem _x;
			_unit removeItem _x;
		} foreach (assignedItems _unit);

		if (random 100 > 0) then {
			_unit addHeadgear (_headgear call BIS_fnc_selectRandom);
		};
		if (random 100 > 0 && (_unit != _leader)) then {
			_unit addVest (_vests call BIS_fnc_selectRandom);
		};
		if (_unit == _leader) then {
			_unit forceaddUniform (_ldrUniforms call BIS_fnc_selectRandom);
			_unit addBackpack (_backpacks call BIS_fnc_selectRandom);
		}else{
			_unit forceaddUniform (_uniforms call BIS_fnc_selectRandom);
		};
		/*
		if (random 100 > 70 && !isPlayer _unit) then {
			_unit addGoggles (_glasses call BIS_fnc_selectRandom);
		};
*/
		_weapon = _rifles call BIS_fnc_selectRandom;
		if (_unit == _mg) then {
			_weapon = _mgs call BIS_fnc_selectRandom;
		};

		if (_weapon in ['hlc_rifle_auga3_GL', 'arifle_MX_GL_Black_F']) then {
			_unit addMagazines ["1Rnd_HE_Grenade_shell",8];
			_unit addprimaryweaponitem "RH_eotech553mag";
		};
		
		if (_weapon in ['RH_M4_moe', 'RH_m4a1_ris_wdl']) then {
			_unit additem "AGM_PreloadedMissileDummy";
			_unit addprimaryweaponitem "CUP_optic_CompM2_Black";
			_unit addWeapon "launch_NLAW_F";
		};
		
		if (_weapon in ['hlc_rifle_auga2carb','RH_M16A3']) then {
			_unit addbackpack "B_Kitbag_rgr";
			_unit addmagazines ["CUP_SMAW_HEDP_M",3];
			_unit addweapon "CUP_launch_Mk153Mod0";
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