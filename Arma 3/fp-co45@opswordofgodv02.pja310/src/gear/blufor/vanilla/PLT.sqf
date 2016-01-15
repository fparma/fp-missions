// gives PLT same items as SQL
#include "RIFLEMAN.sqf";
// but change the hat :)
_unit addHeadGear "H_Beret_02";
_unit addWeapon "Binocular";
_unit addBackpack _LR_RADIO;

{_unit additem _x} foreach _LEADER_ITEMS;