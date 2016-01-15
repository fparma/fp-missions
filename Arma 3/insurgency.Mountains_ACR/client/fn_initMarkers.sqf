/**
*	Function: CUL_fnc_initMarkers
*/

#include "script_component.hpp"

#define RED "ColorRed"
#define GREEN "ColorGreen"

private ["_MIDDLE", "_houses", "_pos", "_mkr", "_mPos"];
_MIDDLE = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_mPos = markerPos "CUL_middle";
if (_mPos select 0 != 0) then  {_MIDDLE = _mPos};

_houses = [_MIDDLE, 30000, 3] call CUL_fnc_getHouses;
TRACE_2("Init markers",_MIDDLE,count _houses);

{
	_pos = _x call CUL_fnc_getGridPos;
	_mkr = str _pos;
	if (markerPos _mkr select 0 == 0) then {
		_mkr = [_mkr, _pos, "RECTANGLE", [50, 50], "BRUSH:", "SOLID"] call CBA_fnc_createMarker;
		_mkr setMarkerAlphaLocal 0.2;
		if (missionNamespace getVariable [format ["cul%1clr", _mkr], false]) then {
			_mkr setMarkerColorLocal GREEN;
		} else {
			_mkr setMarkerColorLocal RED;
		}
	};
} forEach _houses;
