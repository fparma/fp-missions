#include "macros.hpp"
#define VALID(v) v isEqualType "" && {count v > 0}

{
  _x params ["_markerName", "_markerColor"];

  private _update = [GVAR(sectorMarkers), _markerName] call CBA_fnc_hashHasKey
    && {VALID(_markerName)}
    && {VALID(_markerColor)}
    && {markerColor _markerName != _markerColor};

  if (_update) then {
      _markerName setMarkerColor _markerColor;
  };
} forEach GET_FROM_SAVE("markers");

LOG("Sector markers loaded from save");
