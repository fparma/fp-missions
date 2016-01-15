_unit = _this select 0;
#include "_defineItems.sqf";

_unit forceAddUniform (_UNIFORMS  call BIS_fnc_selectRandom);
_unit addVest (_VESTS call BIS_fnc_selectRandom);
_unit addHeadGear (_HEADGEARS call BIS_fnc_selectRandom);

_unit addMagazines [_STANDARD_SMOKE,2];
_unit addMagazines [_GRENADE, 2];
_unit addMagazines [_STANDARD_MAG,4];
_unit addMagazines [_STANDARD_MAG_T,4];

[_unit, _STANDARD_RIFLE_C] call BIS_fnc_addWeapon;
{if (_x != "") then {_unit addPrimaryWeaponItem _x};} forEach _STANDARD_ATTACHMENTS_ALT;

_unit addMagazines [_STANDARD_PISTOL_MAG,2];
_unit addWeapon _STANDARD_PISTOL;

// hack
_unit addBackPack "B_Carryall_mcamo";
clearMagazineCargoGlobal (unitBackpack _unit);
_unit addItemToBackpack "rhs_m136_mag";
_unit addWeapon "rhs_weap_M136";
_unit spawn {
	sleep 0.2;
	[[[_this], {removeBackpack (_this select 0)}],"BIS_fnc_spawn", _this] call BIS_fnc_MP;
};

#include "_after.sqf";