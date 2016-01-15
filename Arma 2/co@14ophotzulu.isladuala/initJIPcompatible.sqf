// ====================================================================================
// Sets the viewdistance for the pilots and then sets the view distance for all ground units to optimise to prevent lagg spikes
if ((player iskindof "US_Pilot_Light_EP1") OR (player iskindof "US_Pilot_EP1") OR (player iskindof "USMC_Soldier_Pilot") OR (player iskindof "ACE_USMC_Soldier_Crew_D") OR (player iskindof "USMC_Soldier_Crew")) then 
{
	setviewdistance 3000; 
	setterraingrid 35;
} else 
{
	setviewdistance 3000; 
	setterraingrid 35;
};
// ====================================================================================
// Markers Scripts - Comment these lines out if you dont want map markers down. 
[] execVM "source\Markers\ShackTac_setLocalMarkers.sqf";
ShackTac_requireRadio = 0;

