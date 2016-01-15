_unit = _this select 0;
#include "_defineItems.sqf";

_unit forceAddUniform (_UNIFORMS  call BIS_fnc_selectRandom);
_unit addVest (_VESTS call BIS_fnc_selectRandom);
_unit addHeadGear (_HEADGEARS call BIS_fnc_selectRandom);
_unit addBackPack "CUP_B_CivPack_WDL";

_unit addMagazines [_STANDARD_SMOKE,2];
_unit addMagazines [_GRENADE, 2];
_unit addMagazines [_STANDARD_MAG,4];
_unit addMagazines [_STANDARD_MAG_T,4];

[_unit, _STANDARD_RIFLE_C] call BIS_fnc_addWeapon;

// hack

clearMagazineCargoGlobal (unitBackpack _unit);
_unit addItemToBackpack "rhs_rpg26_mag";
_unit addWeapon "rhs_weap_rpg26";
_unit spawn {
	sleep 0.2;
	[[[_this], {removeBackpack (_this select 0)}],"BIS_fnc_spawn", _this] call BIS_fnc_MP;
};

#include "_after.sqf";