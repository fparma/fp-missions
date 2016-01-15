server execVM "revive_init.sqf";
// not really needed i guess. but eh, want to be sure that it works.
stayVorkuta = false; 
planeActive = false;
cuel_human_groups = [grpAlpha, grpBeta, grpCharlie, grpDelta];
if (!isDedicated && isNull player) then { waitUntil {!isNull player}; };
"genmark" setmarkerAlphaLocal 0;
"radiomark1" setmarkerAlphaLocal 0;

[[
["task1", "Search for supplies and survivors","<br><br/>Namalsk is lost. These mutants are in full control and the only thing all remaining humans can do is try to get away from this island. You and your friends are low on ammo and supplies, not to mention people. Vorkuta would be a great place to look for all of those.<br><br/><br><br/>Even though it's very likely that Vorkuta is overrun, it's your best plan.",true,[["task1mark",(getPosATL vorkutaLoc),"mil_unknown","ColorWhite","Search for supplies and other survivors"]]]
],[
["Credits","Made by cuel for FP Arma 2.<br><br/><br><br/>thanks to shuko for shk_pos."],
["Mission", "Since whoever made the mutants decided to use setDamage when a mutant is attacking, the first aid system will not work. When you die (from a mutant), you will respawn after 30 seconds and teleport to the leader of your group, or someone else.<br></br><br></br>Ammoboxes will spawn at a minimum distance of 100m (+random50) in a 45 degree arc infront of the players heading. The player is randomly selected. Spread out if you want to find them.<br></br>"]
]]execVM "shk_taskmaster.sqf";

BIS_Effects_Burn = compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";
if(not isDedicated) then{
	player setVariable ["BIS_noCoreConversations", true];
	player enableGunLights true;
	[player,200,10,10,3,6,-0.3,0.1,0.3,1,1,1,30,10,15,true,0.4,0.5,0.025,0,0,0,0,24] execFSM "fsm\Fog.fsm";
};

[] execVM "initserver.sqf";
[] execvm "initplayer.sqf";


0 = [600] execVM "modules\CEP_Caching\main.sqf";
{_x setVariable ["crB_disableCache", true];}forEach cuel_human_groups;
//Finish world initialization before mission is launched. 
finishMissionInit;

markOnMap = false;
serverLoadHint = false;

_trg = createTrigger["EmptyDetector", [0,0,0]]; 
_trg setTriggerText "Map Markers On/Off";
_trg setTriggerArea[0,0,0,false]; 
_trg setTriggerActivation["GOLF","PRESENT",true]; 
_trg setTriggerStatements["this", "if !(markOnMap) then {_nil = player execVM 'markAll.sqf', markOnMap = true;} else {markOnMap = false;}; ", ""]; 

//'borrowed' from insurgency! credits to pitn :) 
//the sleep timer is probably not needed since this is only avaible for admins on the map.
_trg = createTrigger["EmptyDetector", [0,0,0]]; 
_trg setTriggerText "server fps and runtime";
_trg setTriggerArea[0,0,0,false]; 
_trg setTriggerActivation["INDIA","PRESENT",true]; 
_trg setTriggerStatements ["this", '
if (serverLoadHint) exitWith { player groupChat "You may only check the server load every 10 seconds to prevent network lag"; }; 
serverLoadHint = true; 
[nil,server,"loc",rSPAWN,player,{
	[nil,_this,"loc",rSPAWN,diag_fps,{
		hint format["Server FPS: %1\n Run Time: %2 mins",round _this, round (time/60)];
		sleep 10;
		serverLoadHint = false;	
	}] call RE;
}] call RE;	
', ""]; 
