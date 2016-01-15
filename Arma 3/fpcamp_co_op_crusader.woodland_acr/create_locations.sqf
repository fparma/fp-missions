/*
	Purpose:
	Searches all map markers for markers that contains "fploc" and creates a location with the following string after fploc
	"fplocChernogorsk" would create a location on the map named Chernogorsk, at the position of the marker.
	Type of the city can be defined with an underscore after the name
	"fplocChernogorsk_nameCityCapital"
	would create a NameCityCapital type of location.
	NameVillage is used if not found / defined.

	See
	https://community.bistudio.com/wiki/createLocation
*/

#define ALLOWED_NAMES ["name", "strategic", "strongpointarea", "flatarea", "flatareacity", "flatareacitysmall", "citycenter", "airport", "namemarine", "namecitycapital", "namecity", "namevillage", "namelocal", "hill", "viewpoint", "rockarea", "bordercrossing", "vegetationbroadleaf", "vegetationfir", "vegetationpalm", "vegetationvineyard"]

{
	if ([_x, "fploc"] call CBA_fnc_find == 0) then {

		_townName = ([_x, "fploc"] call CBA_fnc_split) select 1;
		_type = [_townName, "_"] call CBA_fnc_split;

		if (count _type > 1) then {
			_townName = _type select 0;
			_type = tolower (_type select 1);
			if !(_type in ALLOWED_NAMES) then {
				diag_log "-- create locations: not allowed type " + _type;
				_type = "NameCity";
			};
		}else {
			_type = "NameCity";
		};

		(createLocation [_type, markerPos _x, 120, 120]) setText _townName;
	};
}forEach allMapMarkers;
