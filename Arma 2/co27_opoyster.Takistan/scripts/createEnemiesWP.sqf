//trigger activation: getposATL (thislist select 0) select 2 < 10
//SIDE can be 0 = Russians, 1 = Takistan militia, 2 = Takistani military, 3 = Africa Rebels
//on activation: veh = ["spawnMarker","MOVEwp","SADwp",SIDE] execVM "dynamic\createEnemiesWP.sqf"

if (isServer) then 
{
_spawnPos = _this select 0;
_wp1 = _this select 1;
_wp2 = _this select 2;
_type = _this select 3;

if (isNil "_type") then {_type = 0};

switch (_type) do
{
	// Russians
	case 0:
	{
		_group1 = createGroup EAST;
		_unit1 = _group1 createUnit ["RU_Soldier_SL", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit2 = _group1 createUnit ["RU_Soldier", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit3 = _group1 createUnit ["RU_Soldier_Medic", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit4 = _group1 createUnit ["RU_Soldier_AR", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;

		_group2 = createGroup EAST;
		_unit5 = _group2 createUnit ["RU_Soldier_TL", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit6 = _group2 createUnit ["RU_Soldier", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit7 = _group2 createUnit ["RU_Soldier_AT", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit8 = _group2 createUnit ["RU_Soldier_AR", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		
		_w1 = (group _unit1) addWaypoint [getMarkerPos _wp1, 0];
		_unit1 setCombatMode "RED";
		_w1 setWaypointType "MOVE";  
		_w1 setWaypointBehaviour "AWARE";

		_w2 = (group _unit5) addWaypoint [getMarkerPos _wp1, 0];
		_unit5 setCombatMode "RED";
		_w2 setWaypointType "MOVE";  
		_w2 setWaypointBehaviour "AWARE";

		_w3 = (group _unit1) addWaypoint [getMarkerPos _wp2, 0];
		_unit1 setCombatMode "RED";
		_w3 setWaypointType "SAD";  
		_w3 setWaypointBehaviour "AWARE";

		_w4 = (group _unit5) addWaypoint [getMarkerPos _wp2, 0];
		_unit5 setCombatMode "RED";
		_w4 setWaypointType "SAD";  
		_w4 setWaypointBehaviour "AWARE";		
	};
	// Takistani militia
	case 1:
	{
		_group1 = createGroup EAST;
		_unit1 = _group1 createUnit ["TK_INS_Soldier_TL_EP1", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit2 = _group1 createUnit ["TK_INS_Bonesetter_EP1", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit3 = _group1 createUnit ["TK_INS_Soldier_4_EP1", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit4 = _group1 createUnit ["TK_INS_Soldier_AR_EP1", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;


		_w1 = (group _unit1) addWaypoint [getMarkerPos _wp1, 0];
		_unit1 setCombatMode "RED";
		_w1 setWaypointType "MOVE";  
		_w1 setWaypointBehaviour "AWARE";

		_w3 = (group _unit1) addWaypoint [getMarkerPos _wp2, 0];
		_unit1 setCombatMode "RED";
		_w3 setWaypointType "SAD";  
		_w3 setWaypointBehaviour "AWARE";

		
	};
	// Takistani military
	case 2:
	{
		_group1 = createGroup EAST;
		_unit1 = _group1 createUnit ["TK_Soldier_SL_EP1", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit2 = _group1 createUnit ["TK_Soldier_Medic_EP1", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit3 = _group1 createUnit ["TK_Soldier_LAT_EP1", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit4 = _group1 createUnit ["TK_Soldier_AR_EP1", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;

		_group2 = createGroup EAST;
		_unit5 = _group2 createUnit ["TK_Soldier_SL_EP1", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit6 = _group2 createUnit ["TK_Soldier_EP1", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit7 = _group2 createUnit ["TK_Soldier_AT_EP1", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit8 = _group2 createUnit ["TK_Soldier_AR_EP1", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		
		_w1 = (group _unit1) addWaypoint [getMarkerPos _wp1, 0];
		_unit1 setCombatMode "RED";
		_w1 setWaypointType "MOVE";  
		_w1 setWaypointBehaviour "AWARE";

		_w2 = (group _unit5) addWaypoint [getMarkerPos _wp1, 0];
		_unit5 setCombatMode "RED";
		_w2 setWaypointType "MOVE";  
		_w2 setWaypointBehaviour "AWARE";

		_w3 = (group _unit1) addWaypoint [getMarkerPos _wp2, 0];
		_unit1 setCombatMode "RED";
		_w3 setWaypointType "SAD";  
		_w3 setWaypointBehaviour "AWARE";

		_w4 = (group _unit5) addWaypoint [getMarkerPos _wp2, 0];
		_unit5 setCombatMode "RED";
		_w4 setWaypointType "SAD";  
		_w4 setWaypointBehaviour "AWARE";	
	};
	//Africa Rebels
	case 3:
	{	
		_group1 = createGroup EAST;
		_unit1 = _group1 createUnit ["ibr_rebel11", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit2 = _group1 createUnit ["ibr_rebel11", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit3 = _group1 createUnit ["ibr_rebel83", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit4 = _group1 createUnit ["ibr_rebel125", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;

		_group2 = createGroup EAST;
		_unit5 = _group2 createUnit ["ibr_rebel11", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit6 = _group2 createUnit ["ibr_rebel125", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit7 = _group2 createUnit ["ibr_rebel125", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
		_unit8 = _group2 createUnit ["ibr_rebel11", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;

		_w1 = (group _unit1) addWaypoint [getMarkerPos _wp1, 0];
		_unit1 setCombatMode "RED";
		_w1 setWaypointType "MOVE";  
		_w1 setWaypointBehaviour "AWARE";

		_w2 = (group _unit5) addWaypoint [getMarkerPos _wp1, 0];
		_unit5 setCombatMode "RED";
		_w2 setWaypointType "MOVE";  
		_w2 setWaypointBehaviour "AWARE";

		_w3 = (group _unit1) addWaypoint [getMarkerPos _wp2, 0];
		_unit1 setCombatMode "RED";
		_w3 setWaypointType "SAD";  
		_w3 setWaypointBehaviour "AWARE";

		_w4 = (group _unit5) addWaypoint [getMarkerPos _wp2, 0];
		_unit5 setCombatMode "RED";
		_w4 setWaypointType "SAD";  
		_w4 setWaypointBehaviour "AWARE";		
	};
};




};