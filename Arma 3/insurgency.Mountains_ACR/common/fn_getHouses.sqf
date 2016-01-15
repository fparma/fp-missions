/**
*	Function: CUL_fnc_getHouses
*
* Arguments:
*	0 - Center position
* 1 - [Radius (default 10)]
* 2 - [minimum positions (default 1)]
* 3 - [Only alive houses (default true)]
*
*	Returns:
* Array
*/

#include "script_component.hpp"
PARAMS_1(_center)
DEFAULT_PARAM(1,_radius,10)
DEFAULT_PARAM(2,_minPositions,1)
DEFAULT_PARAM(3,_alive,true)

private ["_buildings", "_enterables"];
_enterables = [];
_buildings = nearestObjects [_center call CBA_fnc_getPos, ["House"], _radius max 10];

if (count _buildings isEqualTo 0) exitWith {
	TRACE_1("Found no nearby houses", _this);
	(_enterables)
};

{
	if (alive _x || !_alive
		&& {str (_x buildingPos _minPositions) != "[0, 0, 0]"}) then
	{
		_enterables pushBack _x;
	};
} forEach _buildings;

(_enterables)
