if (isServer) then 
{
	//OPFOR UNITS
	_group1 = createGroup EAST;
	_unit1 = _group1 createUnit ["RU_Soldier_SL", [(getMarkerPos "supportspawn") select 0,(getMarkerPos "supportspawn") select 1,1], [], 1, "NONE"]; sleep 0.2;
	_unit2 = _group1 createUnit ["RU_Soldier", [(getMarkerPos "supportspawn") select 0,(getMarkerPos "supportspawn") select 1,1], [], 1, "NONE"]; sleep 0.2;
	_unit3 = _group1 createUnit ["RU_Soldier_Medic", [(getMarkerPos "supportspawn") select 0,(getMarkerPos "supportspawn") select 1,1], [], 1, "NONE"]; sleep 0.2;
	_unit4 = _group1 createUnit ["RU_Soldier_AR", [(getMarkerPos "supportspawn") select 0,(getMarkerPos "supportspawn") select 1,1], [], 1, "NONE"]; sleep 0.2;

	_group2 = createGroup EAST;
	_unit5 = _group2 createUnit ["RU_Soldier_TL", [(getMarkerPos "supportspawn") select 0,(getMarkerPos "supportspawn") select 1,1], [], 1, "NONE"]; sleep 0.2;
	_unit6 = _group2 createUnit ["RU_Soldier", [(getMarkerPos "supportspawn") select 0,(getMarkerPos "supportspawn") select 1,1], [], 1, "NONE"]; sleep 0.2;
	_unit7 = _group2 createUnit ["RU_Soldier_AT", [(getMarkerPos "supportspawn") select 0,(getMarkerPos "supportspawn") select 1,1], [], 1, "NONE"]; sleep 0.2;
	_unit8 = _group2 createUnit ["RU_Soldier_AR", [(getMarkerPos "supportspawn") select 0,(getMarkerPos "supportspawn") select 1,1], [], 1, "NONE"]; sleep 0.2;
	sleep 1;
	_w3 = (group _unit1) addWaypoint [getMarkerPos "supportattack", 0];
	_unit1 setCombatMode "RED";
	_w3 setWaypointType "SAD";  
	_w3 setWaypointBehaviour "AWARE";

	_w4 = (group _unit5) addWaypoint [getMarkerPos "supportattack", 0];
	_unit5 setCombatMode "RED";
	_w4 setWaypointType "SAD";  
	_w4 setWaypointBehaviour "AWARE";
	
	sleep 1;
	//ARMORED
	_vehicle = [(getMarkerpos "supportspawn2"), 0, "BTR90", EAST] call BIS_fnc_spawnVehicle;
	_vehgroup = _vehicle select 2;
	_w0 = _vehgroup addWaypoint [getMarkerPos "supportattack", 0];
	_w0 setWaypointType "MOVE";  
	_w0 setWaypointBehaviour "AWARE";
	sleep 1;
	_vehicle = [(getMarkerpos "supportspawn3"), 0, "BTR90", EAST] call BIS_fnc_spawnVehicle;
	_vehgroup = _vehicle select 2;
	_w0 = _vehgroup addWaypoint [getMarkerPos "supportattack", 0];
	_w0 setWaypointType "MOVE";  
	_w0 setWaypointBehaviour "AWARE";
	sleep 10;
	//BLUFOR UNITS
	_group3 = createGroup WEST;
	_unit9 = _group3 createUnit ["US_Soldier_TL_EP1", [(getMarkerPos "blusupport1") select 0,(getMarkerPos "blusupport1") select 1,1], [], 1, "NONE"]; sleep 0.2;
	_unit10 = _group3 createUnit ["US_Soldier_Marksman_EP1", [(getMarkerPos "blusupport1") select 0,(getMarkerPos "blusupport1") select 1,1], [], 1, "NONE"]; sleep 0.2;
	_unit11= _group3 createUnit ["US_Soldier_B_EP1", [(getMarkerPos "blusupport1") select 0,(getMarkerPos "blusupport1") select 1,1], [], 1, "NONE"]; sleep 0.2;
	_unit12 = _group3 createUnit ["US_Soldier_GL_EP1", [(getMarkerPos "blusupport1") select 0,(getMarkerPos "blusupport1") select 1,1], [], 1, "NONE"]; sleep 0.2;

	_w5 = (group _unit9) addWaypoint [getMarkerPos "supportattack", 0];
	_unit9 setCombatMode "RED";
	_w5 setWaypointType "SAD";  
	_w5 setWaypointBehaviour "AWARE";
	
		sleep 1;
	//ARMORED
	_vehicle = [(getMarkerpos "blusupport2"), 180, "M1A2_TUSK_MG", WEST] call BIS_fnc_spawnVehicle;
	_vehgroup = _vehicle select 2;
	_w0 = _vehgroup addWaypoint [getMarkerPos "supportattack", 0];
	_w0 setWaypointType "MOVE";  
	_w0 setWaypointBehaviour "AWARE";
	sleep 1;
	_vehicle = [(getMarkerpos "blusupport3"), 180, "LAV25", WEST] call BIS_fnc_spawnVehicle;
	_vehgroup = _vehicle select 2;
	_w0 = _vehgroup addWaypoint [getMarkerPos "supportattack", 0];
	_w0 setWaypointType "MOVE";  
	_w0 setWaypointBehaviour "AWARE";
	
	
	sleep 10;
	//support heli
	_hspawn = getmarkerpos "supportheli";
	_hspawn set [2,200];
	_air = [_hspawn, 0, "Ka52", EAST] call BIS_fnc_spawnVehicle;
	_vehgroup = _air select 2;
	_w1 = _vehgroup addWaypoint [getMarkerPos "supportattack", 0];
	_w1 setWaypointType "SAD";  
	_w1 setWaypointBehaviour "COMBAT";	
};