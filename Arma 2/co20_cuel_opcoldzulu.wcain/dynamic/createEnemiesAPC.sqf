//veh = ["spawnMarker","wp"] execVM "dynamic\createEnemiesAPC.sqf"


if (isServer) then 
{
_spawnPos = _this select 0;
_wp = _this select 1;

_tank1 = "cwr2_bmp1" createVehicle (getmarkerpos _spawnPos);

_groupTank = createGroup EAST;
_unitTank1 = _groupTank createUnit ["cwr2_SoldierE_Crew_W", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"];
_unitTank2 = _groupTank createUnit ["cwr2_SoldierE_Crew_W", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"];
_unitTank3 = _groupTank createUnit ["cwr2_SoldierE_Crew_W", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"];

{
removeAllItems _x;
_x addWeapon "ItemMap";
_x addWeapon "ItemCompass";
_x addWeapon "NVGoggles";
}forEach units _group1;

_unitTank1 moveInCommander _tank1;
_unitTank2 moveinDriver _tank1;
_unitTank3 moveInGunner _tank1;

_unit1 setVehicleInit "this setVehicleLock 'LOCKED';";
processInitCommands;

_w1 = (group _unitTank1) addWaypoint [getMarkerPos _wp, 0];
_unitTank1 setCombatMode "RED";
_w1 setWaypointType "SAD";  
_w1 setWaypointBehaviour "AWARE";

};
