#include "../script_component.hpp"
params [["_sectorMarker", "", [""]];
if (_sectorMarker == "") exitWith {false};

_ret = markerColor _sectorMarker != GVAR(colorFriendly);
_ret
