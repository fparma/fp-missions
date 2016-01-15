if(not isDedicated) then{WaitUntil{not isNull player}};
[[
["wait", "Wait for objective.","choose your gear and wait for a new objective",true]
],[
["Credits","Made by cuel for FP Arma 2."]
]]execVM "shk_taskmaster.sqf";

[] execVM "initplayer.sqf";
[] execVM "initserver.sqf";


//debug. remove me.

markOnMap = false;
_trg = createTrigger["EmptyDetector", [0,0,0]]; 
_trg setTriggerText "Map Markers On/Off";
_trg setTriggerArea[0,0,0,false]; 
_trg setTriggerActivation["GOLF","PRESENT",true]; 
_trg setTriggerStatements["this", "if !(markOnMap) then {_nil = player execVM 'markAll.sqf', markOnMap = true;} else {markOnMap = false;}; ", ""]; 