#include "macros.hpp"

private _h = [[], []] call CBA_fnc_hashCreate;
[_h, "markers", GETPVAR(sectorMarkers)] call CBA_fnc_hashSet;

GVAR(save) = _h;
TRACE_1("Save loaded", GVAR(save));
