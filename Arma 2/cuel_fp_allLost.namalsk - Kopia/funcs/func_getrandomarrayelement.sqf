// by Bon_Inf*

private ["_array","_j","_element"];

_array = _this;

_j = (count _array - 1) min (round random (count _array));
_element = _array select _j;


_element