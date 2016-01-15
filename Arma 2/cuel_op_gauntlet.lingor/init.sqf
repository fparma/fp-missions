if (!isDedicated && isNull player) then { waitUntil {!isNull player}; };
server execVM "revive_init.sqf";

player setVariable ["BIS_noCoreConversations", true];
"calamar" setMarkerAlphaLocal 0.4;
"carmark1" setMarkerAlphaLocal 0.0;
enableSaving [false,false];

[[["tskDrugs","Locate and destroy 3 drug-filled trucks.","Intel suggests that the rebels recently bought a large amount of drugs from the druglords.<br/>They are 	preparing to ship the trucks to Europe, your mission is to locate three Ural's inside <marker name='calamar'>Calamar</marker>, and destroy 	them.<br/><br/> 	Our recon shows mostly infrantry, be aware that a BMP-2 might be on scene, or nearby. Expect heavy resistance. Good luck.",true,	["markerTask2",getmarkerpos 	"calamar"]]],[["Credits:","Made by cuel."]
	]] execvm "shk_taskmaster.sqf";

if (isServer) then
{
	execVM "checkTask.sqf";
};

if (alive drugtruck1 || alive drugtruck2 || alive drugtruck3) then
{
sleep 2;
taskhint ["Locate and destroy 3 drug-filled trucks in Calamar!", [1, 1, 1, 1], "taskNew"];
};

sleep 6;
waitUntil {BIS_fnc_init};
[str ("Operation Gauntlet") , str ("Near Calamar")] spawn BIS_fnc_infoText;

if (isServer) then {
waitUntil {sleep 4;(s distance (getMarkerPos "play") < 50)};
[nil,nil,rPlaysound,"opintro"] call RE;
};