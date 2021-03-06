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
	'H_caf_ag_wrap',
	'H_caf_ag_wrap',
	'H_caf_ag_paktol_02',
	'H_caf_ag_paktol_01',
	'H_caf_ag_paktol_04',
	'H_caf_ag_paktol_03',
	'H_ShemagOpen_tan',
	'H_caf_ag_wrap'
	
];

_uniforms = [
	'U_CAF_AG_ME_ROBES_Mil_01',
	'U_CAF_AG_ME_ROBES_01',
	'U_CAF_AG_ME_ROBES_01a',
	'U_CAF_AG_ME_ROBES_01b',
	'U_CAF_AG_ME_ROBES_01c',
	'U_CAF_AG_ME_ROBES_01d',
	'U_CAF_AG_ME_ROBES_04',
	'U_CAF_AG_ME_ROBES_04a',
	'U_CAF_AG_ME_ROBES_04b',
	'U_CAF_AG_ME_ROBES_04c',
	'U_CAF_AG_ME_ROBES_04d'
	
];

_vests = [
	'V_TacVest_camo',
	'V_TacVest_camo',
	'V_BandollierB_rgr',
	'V_BandollierB_rgr'
];

_rifles = [
	'hlc_rifle_ak74',
	'hlc_rifle_ak74',
	'hlc_rifle_ak47',
	'hlc_rifle_lar',
	'hlc_rifle_rpk',
	'hlc_rifle_akmgl',
	'hlc_rifle_aks74u',
	'hlc_rifle_g3a3'
];

_mgs = [
	'hlc_lmg_m60e4'
];

// sniper 'srifle_mas_svd',
// 'srifle_mas_m91',

// pistol
_pistols = [
	'rh_cz75'
];

_glasses = [
	'G_Balaclava_blk',
	'G_balaclava_combat',
	'G_balaclava_oli',
	'G_balaclava_lowprofile',
	'G_bandanna_blk',
	'G_bandanna_khk',
	'G_bandanna_oli',
	'G_bandanna_tan'
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
		removeUniform _unit;
		{_unit removeMagazine _x} foreach (magazines _unit);
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
		if (random 100 > 20 && (_unit != _leader)) then {
			_unit addVest (_vests call BIS_fnc_selectRandom);
		};
		
		if (random 100 > 70 && !isPlayer _unit) then {
			_unit addGoggles (_glasses call BIS_fnc_selectRandom);
		};
		
		if (random 100 > 0 && !isPlayer _unit) then {
			_unit forceaddUniform (_uniforms call BIS_fnc_selectRandom);
		};

		_weapon = _rifles call BIS_fnc_selectRandom;
		if (_unit == _mg) then {
			_weapon = _mgs call BIS_fnc_selectRandom;
		};

		if (_weapon in ['hlc_rifle_akmgl']) then {
			_unit addMagazines ["1Rnd_HE_Grenade_shell",6];
		};
		if (_weapon in ['hlc_rifle_aks74u']) then {
			_unit addBackpack "B_assaultpack_dgtl";
			_unit addMagazine "R3F_AT4CS_mag";
			_unit addWeapon "R3F_AT4CS";
		};
		_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
		if (count _magazines > 1) then {
			{[_unit, (_magazines select 1)] call CBA_fnc_AddMagazine} count [0,1];
		};
		{[_unit,(_magazines select 1)] call CBA_fnc_AddMagazine;} count [0,1,2,3,4];
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