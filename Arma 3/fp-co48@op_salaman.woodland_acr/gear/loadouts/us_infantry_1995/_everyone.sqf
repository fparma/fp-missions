// This file will run for all units after their loadouts have been given.
// Available variables is _unit, _kit, and whatever is included in _defines.sqf in the loadout folders

[_unit, _COMMON_ITEMS] call FP_fnc_addToContainers;

if (_kit in ["AR"]) then {
    [_unit, _COMMON_PISTOL_MAG] call FP_fnc_addToContainers;
}else{
    [_unit, [_COMMON_PISTOL_MAG, 2]] call FP_fnc_addToContainers;
};

[_unit, _COMMON_PISTOL] call FP_fnc_addWeapon;

[_unit, _COMMON_NVG] call FP_fnc_addNVG;
