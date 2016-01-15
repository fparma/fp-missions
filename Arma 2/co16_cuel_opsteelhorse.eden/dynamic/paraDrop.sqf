//Usage: _xhandle = [<GROUP>,<VEHICLE>] execvm "Eject.sqf";

if (!isServer) exitWith {};
dropEnemies = false;
[getPos helispawn, 195, "cwr2_Mi17", EAST] call bis_fnc_spawnvehicle;
_heli = nearestObject [helispawn, "Air"];
_heli engineOn true;
_heli flyInHeight 150;
_flyer = driver _heli;
_group2 = group  _flyer;


_w1 = _group2 addWaypoint [getMarkerPos "camp3", 0];
_flyer setCombatMode "BLUE";
_w1 setWaypointType "MOVE";  
_w1 setWaypointBehaviour "CARELESS";
sleep 0.2;


_group1 = createGroup EAST;
_unit1 = _group1 createUnit ["cwr2_OfficerE_Night_W", [(getpos helispawn) select 0,(getpos helispawn) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit2 = _group1 createUnit ["cwr2_SoldierE_Mortar_W", [(getpos helispawn) select 0,(getpos helispawn) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit3 = _group1 createUnit ["cwr2_SoldierE_HG_W", [(getpos helispawn) select 0,(getpos helispawn) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit4 = _group1 createUnit ["cwr2_SoldierE_MG_W", [(getpos helispawn) select 0,(getpos helispawn) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit5 = _group1 createUnit ["cwr2_SoldierE_AT_W", [(getpos helispawn) select 0,(getpos helispawn) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit6 = _group1 createUnit ["cwr2_SoldierE_GL_W", [(getpos helispawn) select 0,(getpos helispawn) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit7 = _group1 createUnit ["cwr2_SoldierE_Sniper_W", [(getpos helispawn) select 0,(getpos helispawn) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit8 = _group1 createUnit ["cwr2_SoldierE_W", [(getpos helispawn) select 0,(getpos helispawn) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit9 = _group1 createUnit ["cwr2_SoldierE_W", [(getpos helispawn) select 0,(getpos helispawn) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit10 = _group1 createUnit ["cwr2_SoldierE_W", [(getpos helispawn) select 0,(getpos helispawn) select 1,1], [], 1, "NONE"]; sleep 0.2;

{
removeAllItems _x;
_x addWeapon "ItemMap";
_x addWeapon "ItemCompass";
_x addWeapon "NVGoggles";
}forEach units _group1;

{
_x moveInCargo _heli;
}forEach units _group1;

waitUntil {dropEnemies || getDammage _heli > 0.8};
_w2 = _group2 addWaypoint [getpos heliremove,0];
_w2 setWaypointType "MOVE";  
{
	unassignvehicle _x;
	_x action ["EJECT", _heli];
	sleep 0.4;
	_x setDamage 0;
} foreach units  _group1;
sleep 5;
_w3 = _group1 addWaypoint [getMarkerPos "camp3", 0];
_unit1 setCombatMode "RED";
_w3 setWaypointType "SAD";  
_w3 setWaypointBehaviour "AWARE";

waitUntil {_heli distance (getPos heliremove) < 400 || getDammage _heli > 0.6};
if (getDammage _heli < 0.8) then {
deletevehicle _flyer;
deleteVehicle _heli;
}else{
sleep 100;
deletevehicle _flyer;
deleteVehicle _heli;
};