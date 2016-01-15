_unit = _this select 0;
#include "_defineItems.sqf";

_unit forceAddUniform (_UNIFORMS  call BIS_fnc_selectRandom);
_unit addVest (_VESTS call BIS_fnc_selectRandom);
_unit addHeadGear (_HEADGEARS call BIS_fnc_selectRandom);

_unit addMagazines [_STANDARD_SMOKE,2];
_unit addMagazines [_GRENADE,2];
_unit addMagazines [_STANDARD_MAG, 6];
_unit addMagazines [_STANDARD_MAG_T, 2];

_unit addItem "ACE_Clacker";
_unit addItem "ACE_DefusalKit";

[_unit, _STANDARD_RIFLE_C] call BIS_fnc_addWeapon;

_unit addBackPack "rhs_sidor";
_bp = unitBackpack _unit;
clearMagazineCargoGlobal _bp;
_bp addMagazineCargoGlobal ["SatchelCharge_Remote_Mag",1];
_bp addMagazineCargoGlobal ["DemoCharge_Remote_Mag",2];
_bp addItemCargoGlobal ["ToolKit",1];

#include "_after.sqf";