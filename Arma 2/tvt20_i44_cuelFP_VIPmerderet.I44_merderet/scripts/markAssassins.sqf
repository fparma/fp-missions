// by cuel
if (isDedicated ||((side _this) != resistance)) exitWith {};

private ["_markArr", "_mark","_id", "_markercolor"];
if (!isMultiplayer) then {playableunits = switchableUnits};

while {true} do {
waitUntil {sleep 0.2; alive player};
_markArr = [];
{
if (side _x == resistance) then {
	_id=format["trk_%1",_x];
	_mark = createMarkerLocal [_id, [(getPosATL _x select 0),(getPosATL _x select 1)]];
	_mark setMarkerShapeLocal "ICON";
	_mark setMarkerTypeLocal "mil_dot";
	_mark setMarkerTextLocal format[" %1",  name _x];
	_mark setMarkerColorLocal "ColorGreen";
	_markArr = _markArr + [_mark];
}else{
	if (vehicle _x != _x && alive _x ) then {
		if (driver (vehicle _x) == _x) then {
		_id=format["trk_%1",_x];
		_mark = createMarkerLocal [_id, [(getPosATL _x select 0),(getPosATL _x select 1)]];
		_mark setMarkerShapeLocal "ICON";
		_mark setMarkerTypeLocal "mil_box";
		_markercolor = switch (side _x) do {
				case west: {"ColorGreen"};
				case east: {"ColorRed"};
				case resistance: {"ColorGreen"};
				default {"ColorWhite"};
			};
		_mark setMarkerColorLocal _markercolor;
		sleep 0.02;
		_markArr = _markArr + [_mark];
		};
	};
};
} forEach playableUnits;
	sleep 8;
	{
		deleteMarkerLocal _x
	}forEach _markArr;
};
