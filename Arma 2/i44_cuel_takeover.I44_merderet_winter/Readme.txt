cB AI Unit Caching Demo - v2.3

This mission is to demonstrate the use of AI unit caching when not within player or enemy range. The caching script works by reducing squads when they are outside a specified distance from the players, so that entire squads will reduce to a single unit to save on CPU when they are not near the player. The option to disable caching for particular groups is also available.

For the purpose of this demo, we are triggering at 100m but the suggested minimum would be 1000m. Use the radio commands to teleport and camera functions.

- Will cache all groups at the start of the mission
- Will cache dynamically created groups during the mission
- Handles multiple sides
- Will trigger squads of different sides when within range
- Will ignore group if object variable set

Created by: (AEF)Wolffy.au [CTB]

Put the following in your INIT.SQF file:

0 = [1000] execVM "modules\CEP_Caching\main.sqf";
Where the parameter is the trigger radius where the units will reassemble.

Testing:
Without AI Unit Caching
Start: 592 AI Units, FPS 26, 192MB
2 mins: 592 AI Units, FPS 17, 193MB

With AI Unit Caching
Start: 592 AI Units, FPS 30, 191MB
2 mins: 51 AI Units, FPS 33, 135MB

Change Log:
v2.3
- Changed from SQF to FSM
- Removed 30 sec delay
- Added statistics to report log
- Wait 30s or 10% AI increase to refresh cache
- 
v2.2
- Added: Ensure playable groups are not included in caching
- Changed: Increased default caching delay from 30s to 120s
- Changed: Updated Teleport script
- Changed: cachingDisabled test group disabled by default
v2.1
- Added: group setVariable ["crB_disableCache", true]; to disable caching on groups
v2.0
- Added: Completely restructed the init component to automatically add all groups and new ones as they are dynamically created
- Changed: Trigger distance is now a centralised parameter
- Changed: trigger activation code as inspired by RMM_Reducer
- Changed: groups from all sides can be cached
- Changed: groups will trigger when approached by groups from different sides or playable units
v1.3
- Added: CEP Unit Caching and radio functions to demonstrate their use.

Thanks to:
    CEP Unit Caching by Myke
    RMM_Reducer by Rommel

Visit us a http://creoBellum.org

Developer notes:
Here is a list of nifty components to be found in this mission.

CEP Unit Caching by Myke
- This code is originally from Myke's ARMA I Coop Essentials Pack. I have heavily modified it and it now supports vehicle units and dynamic group creation.