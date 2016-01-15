// trigger activation: getposATL (thislist select 0) select 2 < 10
// veh = ["spawnMarker",180,"GAZ_Vodnik_HMG",east,"MOVEwp","MOVEwp","ACTIONwp","ACTION for WP"] execVM "dynamic\createVehicle.sqf"

// Vehicle spawns on "spawnMarker" pointing at 180deg. It's a Vodnik with autocannon from the east (RU) side. 
// When it spawns it will drive to the marker "WP1" and then to the marker "ACTIONwp".
// You need to define what ACTIONwp will be.
// SAD = Search and destroy, HOLD = Stay and hold, MOVE = Just move there.
// List of vehicles here: http://forums.bistudio.com/showthread.php?t=73241


//If you are not the server we should not run this script.
if (!isServer) exitWith {};

_spawnmarker = _this select 0;
_dir = _this select 1;
_type = _this select 2;
_side = _this select 3;
_wp1 = _this select 4;
_wp2 = _this select 5;
_wp3 = _this select 6;
_action = _this select 7;

if (isNil "_action") then {_action = "HOLD"};

//Getting marker coordinates.
_spawnmarker2 = getmarkerPos _spawnmarker;

//Here we make the actual vehicle.
_vehicle = [_spawnmarker2, _dir, _type, _side] call BIS_fnc_spawnVehicle;

//Picking out the group
_vehgroup = _vehicle select 2;

//Making waypoint
_w0 = _vehgroup addWaypoint [getMarkerPos _wp1, 0];
_w0 setWaypointType "MOVE";  
_w0 setWaypointBehaviour "AWARE";

_w1 = _vehgroup addWaypoint [getMarkerPos _wp2, 0];
_w1 setWaypointType "MOVE";  
_w1 setWaypointBehaviour "AWARE";

_w2 = _vehgroup addWaypoint [getMarkerPos _wp3, 0];
_w2 setWaypointType _action;  
_w2 setWaypointBehaviour "COMBAT";