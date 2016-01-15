if (!isServer) exitWith {};

if (!("task3" call SHK_Taskmaster_hasTask)) then {
    ["task2", "succeeded"] call SHK_Taskmaster_upd; 
    waitUntil {sleep 4;("task1" call SHK_Taskmaster_isCompleted)};
    sleep 10;
    ["task3","Report in at FOB Krill","<marker name='fobKrill'>FOB Krill</marker> has reported that they're taking high casualties with their Attack on <marker name='vidoraMark'>Vidora</marker>, which was supposed to be a clean and simple mission. Appearently the Rebels have reinforced Vidora with more infrantry and armor.<br/><br/>Recon reports that in a nearby Depot close to Villon there should be vehicles, it's likely that a helicopter is also located there. The Depot is lightly guarded so there should be no problems clearing it.<br/><br/>RTB at <marker name='fobKrill'>FOB Krill</marker>, rearm and proceed to attack Vidora before the enemy can reinforce it further. Good luck."] call SHK_Taskmaster_add;
    waitUntil {sleep 3; reachedFOB};
    "vidora1Mark" setmarkerAlpha 1;
    "vidora2Mark" setmarkerAlpha 1;
    "vidora3Mark" setmarkerAlpha 1;
    "vidora4Mark" setmarkerAlpha 1;
    ["task3", "succeeded"] call SHK_Taskmaster_upd;
    sleep 5;
    ["task4","Main - Support the attack on Vidora","Take whatever supplies you can find at FOB Krill and proceed to attack <marker name='vidoraMark'>Vidora</marker>.",true,["task4mark",getmarkerpos "vidoraMark","Strongpoint","ColorRed","Main - Attack Vidora"]] call SHK_Taskmaster_add;
    sleep 10;
    "Spawn" setMarkerpos (getMarkerpos "spawn3");
    [nil,nil,rHINT,"Spawnpoint has been moved to FOB Krill."] call RE;
};