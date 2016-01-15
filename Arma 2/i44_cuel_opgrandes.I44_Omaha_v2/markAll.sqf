// by cuel for CLAfghan co44


private ["_i","_id","_mark","_markercolor","_markArr"];
_i= 0;
_markArr = [];
while {markOnMap} do {
	hintSilent format["There are totally %1 units on this map and a total of %2 groups.", count allUnits, count allGroups];
	{
		_i= _i+ 1;
		_id=format["trk_%1",_i];
		_mark = createMarkerLocal [_id, [(getPosATL _x select 0),(getPosATL _x select 1)]];
		_mark setMarkerShapeLocal "ICON";
		_mark setMarkerTypeLocal "DOT";
		if (vehicle _x isKindOf "Air") then {_mark setMarkerTypeLocal "Arrow"; _mark setMarkerDirLocal (round (getDir vehicle _x))};
		if (vehicle _x isKindOf "Car" || vehicle _x isKindOf "Tank") then {_mark setMarkerTypeLocal "o_armor";};
		_markercolor = switch (side _x) do {
			case west: {"ColorBlue"};
			case east: {"ColorRed"};
			case resistance: {"ColorWhite"};
			default {"ColorBlack"};
		};
		_mark setMarkerColorLocal _markercolor;
		sleep 0.02;
		_markArr = _markArr + [_mark];
	} forEach allUnits;
	if (count allDead > 0 && showOnMap) then {
		{
			_i= _i+ 1;
			_id=format["trk_%1",_i];
			_mark = createMarkerLocal [_id, [(getPosATL _x select 0),(getPosATL _x select 1)]];
			_mark setMarkerShapeLocal "ICON";
			_mark setMarkerTypeLocal "DOT";
			_mark setMarkerColorLocal "ColorWhite";
			sleep 0.02;
			_markArr = _markArr + [_mark];
		}forEach allDead;	
	};
	//could use a while-do here and check showOnMap each second but only admins will be able to use this so it doesn't matter.
	if (markOnMap) then {
	sleep 10;
	} else {if (true) exitWith{
				{
					deleteMarkerLocal _x
				}forEach _markArr;
				hint 'Map markers removed.';};
			};
	{
		deleteMarkerLocal _x
	}forEach _markArr;
	_i = 0;
}; 
