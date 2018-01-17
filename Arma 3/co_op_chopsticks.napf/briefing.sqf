/* 
* Write your briefing here
* <br /> is line break.
* Note that briefings are added bottom-to-top (appears in reverse order)
*/
#include "config_mission.hpp"

// Add credits first
player createDiaryRecord ["Diary", ["Credits", format ["
<font size=16>%1</font><br/>
<font size=13>by %2</font><br/>
<font size=13>on %3</font><br/>
<br/>
FPARMA Mission Template v5.0.0
", CFG_ON_LOAD_TITLE, CFG_AUTHOR, getText (configFile >> "CfgWorlds" >> worldName >> "description")]]];

player createDiaryRecord ["Diary",["FOB / Respawn","
The mobile FOB can be deployed and packed by engineers.<br/>
It will transfer the ACE cargo into the new HEMTT, but not the inventory, which is inaccessible until packed again.<br/>
If the HEMTT is destroyed, so is the FOB.<br/>
Packing and unpacking requires that the HEMTT is empty and standing still. The unpacked FOB acts as a medical facility, rearm and repair site<br/><br/>

Respawn timer on death is 3 minutes. Respawn is not available while the FOB is packed.<br/>
JIPs can use the nato flag at base to teleport to the FOB.
"]];

// Intel
player createDiaryRecord ["Diary",["Assets","
Sierra 1, 2 - Badger IFV<br/>
Victor 1 - Deployable FOB<br/>
Victor 2 - M-ATV HMG<br/>
Victor 3 - HEMTT Transport<br/>
Victor 4, 5 - M-ATV<br/>
"]];

// Execution
player createDiaryRecord ["Diary",["Execution","
OBJECTIVES:<br/><br/>
* Secure <marker name='welt'>Neue Welt</marker><br/>
* Secure <marker name='docks1'>Seltishafen docks</marker><br/>
* Secure the <marker name='powerplant'>power plant</marker><br/>
* Secure <marker name='lenzburg'>Lenzburg and the reichtag building in Freidorf</marker><br/>
* Secure <marker name='docks2'>Hafen docks</marker><br/>
"]];

// Situation, background
player createDiaryRecord ["Diary",["Situation","
We're making our final push into CSAT territory.
Broadsword takes the eastern flank along with the airfield while your platoon enters the northwestern part, the main goal being Lenzburg harbor, while securing objectives along the way. CSAT forces are spread thin to cover both flanks but resistance might tough at certain key areas.
"]];
