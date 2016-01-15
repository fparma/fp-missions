//veh = ["spawnMarker","wp"] execVM "dynamic\createEnemiesWP.sqf"

if (isServer) then 
{

{
_x EnableAI "MOVE";
_x addWeapon "NVGoggles";
}forEach units grpBmp;
[bu1,bu2,bu3] orderGetIn true;
_w1 = grpBmp addWaypoint [getMarkerPos "attack", 0];
leader grpBmp setCombatMode "RED";
_w1 setWaypointType "SAD";  
_w1 setWaypointBehaviour "AWARE";
};
