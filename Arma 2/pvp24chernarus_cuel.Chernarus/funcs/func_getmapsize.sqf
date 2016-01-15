// by Bon_Inf*
//
// return the approximate size of the map
// calculation is based on locations, such as towns, villages, locals and heights,
// by determining the greatest distance between two locations
//
// it exploits the fact that nearestlocations returns an array of locations
// ordered by their distances to the starting position


private ["_farthest_location","_maplocations","_mapsize","_considered_locationtypes"];


if(not isNil "bon_approx_mapsize") then {_mapsize = bon_approx_mapsize};
if(typename _mapsize == "NUMBER") exitWith{_mapsize};


_considered_locationtypes = ["Name","NameVillage","NameCity","NameCityCapital","NameLocal","Mount"];
_maplocations = nearestlocations [[0,0,0], _considered_locationtypes, 50000];


for "_i" from 1 to 2 do {
	_farthest_location = _maplocations select (count _maplocations - 1);
	_maplocations = nearestlocations [position _farthest_location, _considered_locationtypes, 50000];
};

_mapsize = (position _farthest_location) distance position (_maplocations select (count _maplocations - 1));
_mapsize = _mapsize * 0.75;

bon_approx_mapsize = _mapsize;
_mapsize