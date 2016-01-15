if (!isDedicated && isNull player) then { waitUntil {!isNull player}; };

server execVM "revive_init.sqf";
player setVariable ["BIS_noCoreConversations", true];

[[
	["task1", "Take control of the North Army Base.","Your boat crashed on the way to Namalsk and you've lost all your equipment. There's a nearby Army Base, take control of it and take whatever equipment you might find.",true,[["task1mark",getmarkerpos "task1marker","mil_unknown","ColorRed","Take control of the Army Base"]]]
	],[
	["Credits","Made by: cuel"]
]]execvm "shk_taskmaster.sqf";

[player,200,10,10,3,6,-0.3,0.1,0.3,1,1,1,30,10,15,true,0.4,0.5,0.025,0,0,0,0,24] execFSM "Fog.fsm";

if (isServer) then
{
	//Init UPSMON scritp
	call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";	
};

BIS_Effects_Burn = compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";



//Process statements stored using setVehicleInit
processInitCommands;
//Finish world initialization before mission is launched. 
finishMissionInit;