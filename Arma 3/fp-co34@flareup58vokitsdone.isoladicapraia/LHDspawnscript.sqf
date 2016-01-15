// Credits - Tinter, for pretty much telling me what to do with arrays and modelToWorld, as well as everything else
// SFAriel - for giving me his parachute script to use and mess around with (also for fixing the entire mission)

// USAGE - place a marker called "LHD_spawn", and place nul = execVM "LHDspawnscript.sqf"; in your init.
// The elevation for the carrier deck is around 15m ASL, and for the hangar it's around 9m ASL.

if (isServer) then
{
	LHDComponent1 = "Land_LHD_1" createVehicle (getMarkerPos "LHD_Spawn");
        LHDComponent2 = "Land_LHD_2" createVehicle (getMarkerPos "LHD_Spawn");
        LHDComponent3 = "Land_LHD_3" createVehicle (getMarkerPos "LHD_Spawn");
        LHDComponent4 = "Land_LHD_4" createVehicle (getMarkerPos "LHD_Spawn");
        LHDComponent5 = "Land_LHD_5" createVehicle (getMarkerPos "LHD_Spawn");
        LHDComponent6 = "Land_LHD_6" createVehicle (getMarkerPos "LHD_Spawn");
        LHDComponentElevator = "Land_LHD_elev_r" createVehicle (getMarkerPos "LHD_Spawn");
        LHDComponentIsland1 = "Land_LHD_house_1" createVehicle (getMarkerPos "LHD_Spawn");
        LHDComponentIsland2 = "Land_LHD_house_2" createVehicle (getMarkerPos "LHD_Spawn");

        {_x setPos markerPos "LHD_Spawn"} foreach [LHDComponent1, LHDComponent2, LHDComponent3, LHDComponent4, LHDComponent5, LHDComponent6, LHDComponentElevator, LHDComponentIsland1, LHDComponentIsland2];
		
			LHDComponent1_1 = "Land_LHD_1" createVehicle (getMarkerPos "LHD_Spawn_1");
        LHDComponent2_1 = "Land_LHD_2" createVehicle (getMarkerPos "LHD_Spawn_1");
        LHDComponent3_1 = "Land_LHD_3" createVehicle (getMarkerPos "LHD_Spawn_1");
        LHDComponent4_1 = "Land_LHD_4" createVehicle (getMarkerPos "LHD_Spawn_1");
        LHDComponent5_1 = "Land_LHD_5" createVehicle (getMarkerPos "LHD_Spawn_1");
        LHDComponent6_1 = "Land_LHD_6" createVehicle (getMarkerPos "LHD_Spawn_1");
        LHDComponentElevator_1 = "Land_LHD_elev_r" createVehicle (getMarkerPos "LHD_Spawn_1");
        LHDComponentIsland1_1 = "Land_LHD_house_1" createVehicle (getMarkerPos "LHD_Spawn_1");
        LHDComponentIsland2_1 = "Land_LHD_house_2" createVehicle (getMarkerPos "LHD_Spawn_1");

        {_x setPos markerPos "LHD_Spawn_1"} foreach [LHDComponent1_1, LHDComponent2_1, LHDComponent3_1, LHDComponent4_1, LHDComponent5_1, LHDComponent6_1, LHDComponentElevator_1, LHDComponentIsland1_1, LHDComponentIsland2_1];
		
					LHDComponent1_2 = "Land_LHD_1" createVehicle (getMarkerPos "LHD_Spawn_2");
        LHDComponent2_2 = "Land_LHD_2" createVehicle (getMarkerPos "LHD_Spawn_2");
        LHDComponent3_2 = "Land_LHD_3" createVehicle (getMarkerPos "LHD_Spawn_2");
        LHDComponent4_2 = "Land_LHD_4" createVehicle (getMarkerPos "LHD_Spawn_2");
        LHDComponent5_2 = "Land_LHD_5" createVehicle (getMarkerPos "LHD_Spawn_2");
        LHDComponent6_2 = "Land_LHD_6" createVehicle (getMarkerPos "LHD_Spawn_2");
        LHDComponentElevator_2 = "Land_LHD_elev_r" createVehicle (getMarkerPos "LHD_Spawn_2");
        LHDComponentIsland1_2 = "Land_LHD_house_1" createVehicle (getMarkerPos "LHD_Spawn_2");
        LHDComponentIsland2_2 = "Land_LHD_house_2" createVehicle (getMarkerPos "LHD_Spawn_2");

        {_x setPos markerPos "LHD_Spawn_2"} foreach [LHDComponent1_2, LHDComponent2_2, LHDComponent3_2, LHDComponent4_2, LHDComponent5_2, LHDComponent6_2, LHDComponentElevator_2, LHDComponentIsland1_2, LHDComponentIsland2_2];
		
		
		
};
