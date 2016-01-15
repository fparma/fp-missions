_capturee = _this select 0;
_capturer = _this select 1;
_callid = _this select 2;
_capturee removeAction _callid;
_r = _capturee getVariable ["beenRescued",false];
if (_r) exitWith {};
_capturee setVariable ["beenRescued",true,true];

_capturee enableAI "MOVE";
_capturee enableAI "ANIM";
[_capturee] joinSilent _capturee;
sleep 0.5;
_capturee globalChat "Thanks for the rescue! I will go somewhere safe.";
sleep 0.5;
[_capturee] joinSilent grpNull;
civsRescued = civsRescued +1;
publicVariable "civsRescued";

[0, {
	(group _this) addWaypoint [getmarkerpos "civMove", 0];
	[(group _this), 0] setWaypointType "MOVE";
	[(group _this), 0] setWaypointBehaviour "CARELESS";
}, _capturee] call CBA_fnc_globalExecute;
