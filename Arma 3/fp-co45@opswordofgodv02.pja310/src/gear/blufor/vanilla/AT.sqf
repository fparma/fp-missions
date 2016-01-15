_unit = _this select 0;
#include "_defineItems.sqf";

_unit forceAddUniform (_UNIFORMS  call BIS_fnc_selectRandom);
_unit addVest (_VESTS call BIS_fnc_selectRandom);
_unit addHeadGear (_HEADGEARS call BIS_fnc_selectRandom);

_unit addMagazines [_STANDARD_SMOKE,2];
_unit addMagazines [_GRENADE,2];
_unit addMagazines [_STANDARD_MAG, 6];
_unit addMagazines [_STANDARD_MAG_T, 2];

[_unit, _STANDARD_RIFLE] call BIS_fnc_addWeapon;

_unit addBackPack "CUP_B_RPGPack_Khaki";
clearMagazineCargoGlobal (unitBackpack _unit);
(unitBackpack _unit) addMagazineCargoGlobal [_STANDARD_ROCKET1,1];
(unitBackpack _unit) addMagazineCargoGlobal [_STANDARD_ROCKET2,1];
_unit addWeapon _STANDARD_ROCKET_LAUNCHER;

#include "_after.sqf";
