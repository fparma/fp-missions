if (!isServer) exitWith {};
private ["_exclude_location","_loc","_locationtypes"];
missionDone = false;
rounds = 1;
bluforwins = 0;
opforwins = 0;

call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
getMapsize = compile (preprocessFileLineNumbers "funcs\func_getmapsize.sqf");
getRandomElement = compile (preprocessFileLineNumbers "funcs\func_getrandomarrayelement.sqf");

bluforammo execVM "fillbluforammo.sqf";
opforammo execVM "fillopforammo.sqf";

//thanks to bon inf for this
_locationtypes = ["Name","NameVillage","NameCity","NameCityCapital"];

// find all locations, remove those positioned on water
cuel_locations = nearestLocations [getMarkerPos "center", _locationtypes, call getMapSize];
{if(surfaceiswater [position _x select 0, position _x select 1]) then {cuel_locations = cuel_locations - [_x]}} foreach cuel_locations;
_exclude_location = getMarkerPos "exclude_location";
for "_i" from 1 to count cuel_locations do {
	if(count (_exclude_location - [0]) == 0) exitWith{};

	cuel_locations = cuel_locations - nearestLocations [_exclude_location,_locationtypes,400];
	_exclude_location = getmarkerpos format["exclude_location_%1",_i];
};
//

sleep 10;
while {rounds <= 5} do {
	_loc = cuel_locations call getRandomElement;
	cuel_locations = cuel_locations - [_loc];
	missionDone = false;
	_loc execVM "obj\obj.sqf";
	sleep 1;
	if (rounds == 5) then { [nil, nil, rHINT, "Last round!"]call RE;};
	waitUntil {sleep 5;missionDone};
	[nil, nil, rHINT, format ["Rounds: %1/5\n BLUFORWINS: %2\n OPFOR WINS: %3 ", rounds, bluforwins, opforwins]]call RE;
	if ((rounds >= 3) && ((bluforwins >= (opforwins+2)) ||(opforwins >= (bluforwins+2)))) exitWith {};
	rounds = rounds+1;
	sleep 5;
};

if (bluforwins > opforwins) then {
[nil,nil,"per",rTitleCut,"Blufor wins! Good job.", "BLACK", 6] call RE;
sleep 5;
[nil,nil,"per",rENDMISSION,"END1"] call RE;
} else {
[nil,nil,"per",rTitleCut,"Opfor wins! Good job.", "BLACK", 6] call RE;
sleep 5;
[nil,nil,"per",rENDMISSION,"END1"] call RE;
};