if (!isDedicated && isNull player) then { waitUntil {!isNull player}; };

server execVM "revive_init.sqf";
player setVariable ["BIS_noCoreConversations", true];

if (isNil "paramsArray") then {
	paramsArray = [0, 10]
};

if ((paramsArray select 0) == 1) then {
	skipTime 6;
};

if (isNil "spawnVillon") then {spawnVillon = false;};
if (isNil "spawnDepot") then {spawnDepot = false;};
if (isNil "hasRun") then {hasRun = false;};
if (isNil "hasRunDepot") then {hasRunDepot = false;};
if (isNil "boomArt") then {boomArt = false;};
if (isNil "boomArt2") then {boomArt2 = false;};
if (isNil "spawnVidora") then {spawnVidora = false;};
if (isNil "hasRunVidora") then {hasRunVidora = false;};
if (isNil "reachedFOB") then {reachedFOB = false;};

[[
["task1","Main - Destroy caches in Pikawas","Intel reports shows that the rebels have a few ammo caches in <marker name='pikawas'>Pikawas</marker>.<br/><br/>Your objective is locate them and destroy them before moving on to Villon.",true,["task1mark",getmarkerpos "pikawas","selector_selectedMission","ColorRed","Main - Destroy ammo caches in Pikawas"]],
["task2","Main - Attack Villon","<marker name='Villon'>Villon</marker> is your second objective. You need to clear the entire village from any rebels.<br/><br/> Enemy forces are strong, numbers are unknown.",true,["task2mark",getmarkerpos "villon","Strongpoint","ColorRed","Main - Attack Villon"]],
["taskopt1","Optional - Destroy artillery","Our UAV has spotted an artillery unit at <marker name='artmark'>Chupinka</marker> and <marker name='artmark2'>Palida</marker>. <br/>Your objective is to destroy them. This is not a main objective but it will make your main objectives a lot easier.",true,[["taskOptmark",getmarkerPos "artmark","o_art","ColorRed","Optional - Destroy artillery"], ["taskOptmark2",getmarkerPos "artmark2","o_art","ColorRed","Optional - Destroy artillery"]]]
],[
["Credits","Made by Cuel for FP Arma 2 <br/> Creds to task master 2, UPSMON, norrins revive and vehicle respawn script and their respective creators"]
]] execvm "shk_taskmaster.sqf";

BIS_Effects_Burn = compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";

//Init UPSMON script (must be run on all clients)
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";	
//Process statements stored using setVehicleInit
processInitCommands;
//Finish world initialization before mission is launched. 
finishMissionInit;

//jip thingy
if (isMultiplayer) then {
	waitUntil {SHK_Taskmaster_initDone};
	"vidora1Mark" setmarkerAlphaLocal 0;
	"vidora2Mark" setmarkerAlphaLocal 0;
	"vidora3Mark" setmarkerAlphaLocal 0;
	"vidora4Mark" setmarkerAlphaLocal 0;
	sleep 0.5;
		if (reachedFOB) then {
			"Spawn" setMarkerpos (getMarkerpos "spawn3");
			"vidora1Mark" setmarkerAlphaLocal 1;
			"vidora2Mark" setmarkerAlphaLocal 1;
			"vidora3Mark" setmarkerAlphaLocal 1;
			"vidora4Mark" setmarkerAlphaLocal 1;
		} else if (("task1" call SHK_Taskmaster_isCompleted) && hasRun) then {
				"Spawn" setMarkerpos (getMarkerpos "spawn2");
				ammo1 setpos (getMarkerpos "boxmove");
		};
};



//non-JIP player, someone who's went through role selection and briefing
if (!(isNull player)) then 
	{
	// =============================================================
	// GeneralCarver Vehicle Flip Script v2 Init Scripting

	gc_veh_flip_script_script_action_manager = execVM "scripts\gc_veh_flip\action_manager.sqf";

	//
	// =============================================================
	};

//JIP player, role selection then right into mission.
if (!isServer && isNull player) then 
	{
	waitUntil {!isNull player};

	// =============================================================
	// GeneralCarver Vehicle Flip Script v2 Init Scripting

	gc_veh_flip_script_script_action_manager = execVM "scripts\gc_veh_flip\action_manager.sqf";

	//
	// =============================================================
	};

//server
if (isServer) then 
	{
	};