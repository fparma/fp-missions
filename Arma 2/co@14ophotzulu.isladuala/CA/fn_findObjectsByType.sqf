
private ["_types","_locations","_radius","_debug","_color","_icon","_objects","_objpos","_objcenter"];


_types = _this select 0;
_locations = _this select 1;
_radius = _this select 2;
_debug = _this select 3;
_color = _this select 4;
_icon = _this select 5;

if (count _locations == 0)  then 
{	
	_objpos = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
	_objcenter = createLocation ["Name", _objpos, 1, 1];
	_locations = [_objcenter];
};

_objects = [];
{
		_objects = _objects + nearestObjects [position _x, _types, _radius];

} forEach _locations;

if (_debug) then
{
	{
		private["_t"];
		_t = format["%1", floor(random 10000)];
		[_t, position _x, "Icon", [0.5,0.5], "TYPE:", _icon, "COLOR:", _color, "GLOBAL", "PERSIST"] call CBA_fnc_createMarker;
	} forEach _objects;
};


_objects;
