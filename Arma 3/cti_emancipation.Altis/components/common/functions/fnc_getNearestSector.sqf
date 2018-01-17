#include "../script_component.hpp"

params ["_pos", ["_dist", 9999, [0]]];
_pos = _pos call CBA_fnc_getPos;
private _nearest = [];

[GVAR(sectorMarkers), {
  _value params ["_mrkPos"];
  if ((_pos distance2D _mrkPos) < _dist) then {
    _nearest = [_key, _value];
  }
}] call CBA_fnc_hashEachPair;

_nearest;
