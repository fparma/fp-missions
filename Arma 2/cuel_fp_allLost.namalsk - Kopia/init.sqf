"genmark" setmarkerAlphaLocal 0;
"radiomark1" setmarkerAlphaLocal 0;
// not really needed i guess. but eh, want to be sure that it works.
stayVorkuta = false; 
tfor_injurysystem = 4;
planeActive = false;
cuel_human_groups = [grpAlpha, grpBeta, grpCharlie, grpDelta];

[[
["task1", "Search for supplies and survivors","<br><br/>Namalsk is lost. These mutants are in full control and the only thing all remaining humans can do is try to get away from this island. You and your friends are low on ammo and supplies, not to mention people. Vorkuta would be a great place to look for all of those.<br><br/><br><br/>Even though it's very likely that Vorkuta is overrun, it's your best plan.",true,[["task1mark",(getPosATL vorkutaLoc),"mil_unknown","ColorWhite","Search for supplies and other survivors"]]]
],[
["Credits","Made by cuel for FP Arma 2.<br><br/><br><br/>thanks to shuko for shk_pos."],
["Mission", "Since whoever made the mutants decided to use setDamage when a mutant is attacking, the first aid system will not work. When you die (from a mutant), you will respawn after 30 seconds and teleport to the leader of your group, or someone else.<br></br><br></br>Ammoboxes will spawn at a minimum distance of 100m (+random50) in a 45 degree arc infront of the players heading. The player is randomly selected. Spread out if you want to find them.<br></br>"]
]]execVM "shk_taskmaster.sqf";

BIS_Effects_Burn = compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";
if(not isDedicated) then{

	waitUntil{not isNull player};
	[player] execVM "bon_ais\init_ais.sqf";
	player setVariable ["BIS_noCoreConversations", true];
	player enableGunLights true;
	"tfor_sidechat" addPublicVariableEventHandler {[playerSide,"HQ"] sideChat (_this select 1)};
	[player,200,10,10,3,6,-0.3,0.1,0.3,1,1,1,30,10,15,true,0.4,0.5,0.025,0,0,0,0,24] execFSM "fsm\Fog.fsm";
};

[] execVM "initserver.sqf";
[] execvm "initplayer.sqf";

//Finish world initialization before mission is launched. 
finishMissionInit;

