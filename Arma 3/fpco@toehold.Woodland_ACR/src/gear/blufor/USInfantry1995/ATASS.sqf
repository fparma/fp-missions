_unit = _this select 0;
#include "_defineItems.sqf";

_unit forceAddUniform (_UNIFORMS  call BIS_fnc_selectRandom);
_unit addVest (_VESTS call BIS_fnc_selectRandom);
_unit addHeadGear (_HEADGEARS call BIS_fnc_selectRandom);

_unit addMagazines [_STANDARD_SMOKE,2];
_unit addMagazines [_GRENADE,2];

_unit addMagazines [_STANDARD_MAG,6];
_unit addMagazines [_STANDARD_MAG_T,4];	
[_unit, _STANDARD_RIFLE_ASS] call BIS_fnc_addWeapon;
 {if (_x != "") then {_unit addPrimaryWeaponItem _x}} foreach _STANDARD_ATTACHMENTS;

_unit addBackPack "CUP_B_AlicePack_Khaki";
clearMagazineCargoGlobal (unitBackpack _unit);
(unitBackpack _unit) addMagazineCargoGlobal [_STANDARD_ROCKET1,2];
(unitBackpack _unit) addMagazineCargoGlobal [_STANDARD_ROCKET2,1];

_unit addMagazines [_STANDARD_PISTOL_MAG,2];
_unit addWeapon _STANDARD_PISTOL;

#include "_after.sqf";