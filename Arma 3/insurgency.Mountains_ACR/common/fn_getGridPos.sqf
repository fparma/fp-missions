/**
*	Function: CUL_fnc_getGridPos
*
* Arguments:
*	0 - Pos
*
*	Returns:
* Grid position
*/

#include "script_component.hpp"
PARAMS_1(_pos)
_pos = _pos call CBA_fnc_getPos;

private ["_x","_y"];
_x = _pos select 0;
_y = _pos select 1;

_x = _x - (_x % 100);
_y = _y - (_y % 100);

[_x + 50, _y + 50, 0]
