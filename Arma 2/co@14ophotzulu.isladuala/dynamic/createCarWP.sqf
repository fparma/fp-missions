//veh = ["spawnMarker","wp"] execVM "dynamic\createCarWP.sqf"

if (isServer) then 
{
_spawnPos = _this select 0;
_wp = _this select 1;

_car = "Pickup_PK_GUE" createVehicle (getmarkerpos _spawnPos);
_groupCar = createGroup EAST;
_unit1 = _groupCar createUnit ["ibr_rebel11", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"];
_unit2 = _groupCar createUnit ["ibr_rebel22", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"];

_unit1 moveinDriver _car;
_unit2 moveInGunner _car;


_w1 = (group _unit1) addWaypoint [getMarkerPos _wp, 0];
_unit1 setCombatMode "RED";
_w1 setWaypointType "SAD";  
_w1 setWaypointBehaviour "AWARE";

};
