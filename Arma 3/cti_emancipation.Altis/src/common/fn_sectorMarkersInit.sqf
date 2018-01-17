#include "macros.hpp";

GVAR(sectorMarkersHash) = [[], nil] call CBA_fnc_hashCreate;

{
  if (surfaceIsWater (markerPos _x)) then {
    deleteMarkerLocal _x;
  } else {
    [GVAR(sectorMarkersHash), _x, [markerPos _x, (_x splitString "_") select 2]] call CBA_fnc_hashSet;
  };
  nil
} count (allMapMarkers select {(_x select [0, 10]) == "cul_sector"});

LOG("Markers initialized");
