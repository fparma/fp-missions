if(not isDedicated) then{WaitUntil{not isNull player}};


[[
["wait", "Wait for objective.","choose your gear and wait for a new objective",true]
],[
["Credits","Made by cuel for FP Arma 2."],
["HOW MISSION WORKS", "Teams have 1.5 min to set up / choose gear. After 30 seconds a location will be chosen and teams given tasks. One minute after that both teams will teleport to the AO. Attacking team spawn within 300-700 metres from the defending position. Defending team cannot leave their position beyond 600m (unless another opfor is inside the town). When one team is dead, the other wins (huh??). Both teams have a 40% to receive two light vehicles w/ MG, 20% an apc. If you die, you'll have to wait for a new round."]
]]execVM "shk_taskmaster.sqf";

[] execVM "initplayer.sqf";
[] execVM "initserver.sqf";
enableSaving [false, false];
setViewDistance 1500;
setTerrainGrid 20;