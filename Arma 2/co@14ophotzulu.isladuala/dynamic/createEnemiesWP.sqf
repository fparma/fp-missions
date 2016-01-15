//veh = ["spawnMarker","wp"] execVM "dynamic\createCarWP.sqf"

if (isServer) then 
{
_spawnPos = _this select 0;
_wp = _this select 1;

_group1 = createGroup EAST;
_unit1 = _group1 createUnit ["ibr_rebel11", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit2 = _group1 createUnit ["ibr_rebel22", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
if (random 2 > 1) then {
_unit3 = _group1 createUnit ["ibr_rebel83", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
}else{
_unit3 = _group1 createUnit ["ibr_rebel66", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
};
_unit4 = _group1 createUnit ["ibr_rebel125", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
_w1 = (group _unit1) addWaypoint [getMarkerPos _wp, 0];
_unit1 setCombatMode "RED";
_w1 setWaypointType "SAD";  
_w1 setWaypointBehaviour "AWARE";

};
