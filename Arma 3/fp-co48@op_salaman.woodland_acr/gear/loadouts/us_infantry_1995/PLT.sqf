// Available variables here is "_unit" and "_kit" and stuff in _defines.sqf

// Give same loadout as SQL
#include "SQL.sqf";

removeHeadgear _unit;
_unit addHeadgear _PLT_HEADGEAR;
