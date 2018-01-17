#include "script_component.hpp"
#include "XEH_PREP.sqf"

GVAR(config) = [call compile preprocessFileLineNumbers "config.sqf", nil] call CBA_fnc_hashCreate;
GVAR(colorEnemy) = [CONFIG("SIDE_ENEMY"), true] call BIS_fnc_sideColor;
GVAR(colorFriendly) = [CONFIG("SIDE_FRIENDLY"), true] call BIS_fnc_sideColor;
TRACE_1("Config", GVAR(config));

GVAR(sectorMarkers) = [[], []] call CBA_fnc_hashCreate;
