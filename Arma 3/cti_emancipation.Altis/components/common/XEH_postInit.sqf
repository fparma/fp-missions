#include "script_component.hpp"

private _markers = allMapMarkers select {(_x select [0, 10]) == "cul_sector"};
{
  private _pos = markerPos _x;
  if (surfaceIsWater _pos) then {
    deleteMarkerLocal _x;
  } else {
    if (isServer && {markerColor _x != GVAR(colorEnemy)}) then {
      _x setMarkerColor GVAR(colorEnemy);
    };

    if (markerText _x == "") then {
      private _text = text (nearestLocation [_pos, ""]);
      if (_text == "") then {_text = format ["Sector #%1", _forEachIndex]};
      _x setMarkerTextLocal format [" %1", _text];
    };

    private _type = (_x splitString "_") select 2;
    [GVAR(sectorMarkers), _x, [_pos, _type]] call CBA_fnc_hashSet;
  };
  nil
} count _markers;
TRACE_1("Sector markers", count GVAR(sectorMarkers));
