#include "script_component.hpp"

{
  _x params ["_markerName", "_markerColor"];

  private _update = [EGVAR(common,sectorMarkers), _markerName] call CBA_fnc_hashHasKey &&
    {IS_STRING(_markerName)} &&
    {IS_STRING(_markerColor)} &&
    {markerColor _markerName != _markerColor};

  if (_update) then {
      _markerName setMarkerColor _markerColor;
  };
} forEach GET_FROM_SAVE("markers");

LOG("Sector markers loaded from save");
