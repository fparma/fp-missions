//veh = ["spawnMarker","wp"] execVM "dynamic\createEnemiesAPC.sqf"


if (isServer) then 
{
_spawnPos = _this select 0;
_wp = _this select 1;

_tank1 = "I44_ACar_G_SdKfz222_WH" createVehicle (getmarkerpos _spawnPos);

_groupTank = createGroup EAST;
_unitTank1 = _groupTank createUnit ["I44_Man_G_WH_Crew_NCO_P38", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"];
_unitTank2 = _groupTank createUnit ["I44_Man_G_WH_Crew_MP40", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"];

_unitTank1 moveinGunner _tank1;
_unitTank2 moveinDriver _tank1;

_w1 = (group _unitTank1) addWaypoint [getMarkerPos _wp, 0];
_unitTank1 setCombatMode "RED";
_w1 setWaypointType "SAD";  
_w1 setWaypointBehaviour "AWARE";

};
