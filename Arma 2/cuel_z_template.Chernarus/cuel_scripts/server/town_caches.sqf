_considered_locationtypes = ["Name","NameVillage","NameCity","NameCityCapital","NameLocal"];
_maplocations = nearestlocations [CUEL_CENTERPOS, _considered_locationtypes, 50000];

{
	player sidechat format ["%1",typeof _x];
				_marker=createMarker [format ["maraker%1",random 100000],getPos _x];
				_marker setMarkerType "Warning";
				_marker setMarkerColor "ColorGreen";

}forEach _maplocations;