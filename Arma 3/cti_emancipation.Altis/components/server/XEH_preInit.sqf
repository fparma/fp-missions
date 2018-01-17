#include "script_component.hpp"
#include "XEH_PREP.sqf"

GVAR(save) = [[], []] call CBA_fnc_hashCreate;
[GVAR(save), "sectors", GET_PROFILE_VAR(sectors)] call CBA_fnc_hashSet;

#include "loadSave.sqf"
