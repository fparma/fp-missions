// Available variables here is "_unit" and "_kit" and stuff in _defines.sqf
#include "_defines.sqf"

[_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, _COMMON_BP]] call FP_fnc_addContainers;
[_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
[_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

[_unit, ["ACE_DefusalKit", "ACE_M26_Clacker"]] call FP_fnc_addToContainers;
[_unit, ["SatchelCharge_Remote_Mag", ["ATMine_Range_Mag", 2], ["DemoCharge_Remote_Mag", 3]], "backpack"] call FP_fnc_addToContainers;
