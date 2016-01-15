//[] execVM "craigs_scripts\getWeaponArray.sqf";

//randomWeapons = compile preprocessFileLineNumbers "craigs_scripts\randomWeapons.sqf";
//vehicleInfo = compile preProcessFileLineNumbers "craigs_scripts\dvs\vehicleinfo.sqf";

if (isNil "mapFound") then {mapFound = false};
if (isNil "collectItem") then {collectItem = false};
if (isNil "harddrive") then {harddrive = false};
if (isNil "repairGen") then {repairGen = false};

BIS_Effects_Burn = compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";  

CVG_Horde = 2;
CLY_friendlyfire= 2;
CLY_terraingrid= 0;
CVG_debug= 0;
CVG_bandages=4;
CVG_Viewdist = 300;
CVG_maxaggroradius=400;
CVG_Zdensity = 50;
CVG_minSpawnDist = 50;
CVG_weapontype= 1;
CVG_Zombietowns= 2;
taskType = 1;
taskoption = 0;
vehspawntype=0;
chanceNumber = 10;
CVG_Fuel = 1;
CVG_FastTime = 1;
CVG_Weaponcount  = 1;
CVG_VehicleStatus = 4;

[]execVM "initserver.sqf";
[]execVM "initplayer.sqf";


[[
["villageTask", "Get out of the prison!","<br><br/>A zombie outbreak! Prisoners and guards must now work together to survive, but the prison is being overrun by zombies! Find the nearby village, it might be safer there.",true,[["task1mark",(getMarkerPos "villageMark"),"mil_unknown","ColorWhite","Escape to village"]]]
],[
["Credits","Made by cuel for FP Arma 2.<br><br/><br><br/>thanks to shuko, celery and craig_vg."],
["Mission", "Win!<br></br>"]
]]execVM "shk_taskmaster.sqf";


[] execVM  "craigs_scripts\zombiesinit.sqf";
[] exec "craigs_scripts\zombiesinit.sqs";

serverLoadHint = false;

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

