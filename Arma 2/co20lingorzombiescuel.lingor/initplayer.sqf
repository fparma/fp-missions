if (isDedicated) exitWith {};
waitUntil{not isNull player};

player setVariable ["BIS_noCoreConversations", true];
player enableGunLights true;
_smokeFX = [firepos, 7, time, false, false] spawn BIS_Effects_Burn;
_smokeFX2 = [firepos2, 4, time, false, false] spawn BIS_Effects_Burn;
_smokeFX3 = [firepos3, 4, time, false, false] spawn BIS_Effects_Burn;

[player,200,10,10,3,6,-0.3,0.1,0.3,1,1,1,30,10,15,true,0.4,0.5,0.025,0,0,0,0,24] execFSM "Fog.fsm";

[player] execVM "scripts\loadout.sqf";

if (time > 20) then {
player setPos (getmarkerpos "jipMove");
};

sleep 10;
[]spawn {
	while {true} do {
	playSound "rightbehindyou";
	sleep 250+(random(100));
	};
	sleep 20;
};

waitUntil {sleep 5;"villageTask" call SHK_Taskmaster_isCompleted};
hint format ["%1", mapFound];
while {!mapFound} do {
hint "check";
		waituntil {sleep 0.5;(((player distance milMap)<2.0) && !mapFound)};
			if (!mapFound) then {milMapaction= player addaction ["Collect useful map", "scripts\milMap.sqf"]};
		waituntil {sleep 0.5;(((player distance milMap)>2.5) || mapFound)};
		player removeaction milMapaction;
		hint "end";
};
	
[] spawn {
while {!harddrive} do {
		waituntil {sleep 0.5;(((player distance computar)<2.0) && !harddrive)};
			if (!harddrive) then {hdaction= player addaction ["Take harddrive", "scripts\hd.sqf"]};
		waituntil {sleep 0.5;(((player distance computar)>2.5) || harddrive)};
		player removeaction hdaction;
	};
};

while {!collectItem} do {
		waituntil {sleep 0.5;(((player distance boxes)<2.0) && !collectItem)};
			if (!collectItem) then {boxesaction= player addaction ["Search for item", "scripts\boxes.sqf"]};
		waituntil {sleep 0.5;(((player distance boxes)>2.5) || collectItem)};
		player removeaction boxesaction;
};

while {!repairGen} do {
		waituntil {sleep 0.5;(((player distance generator)<5.0) && !repairGen)};
			if (!repairGen) then {generatoraction= player addaction ["Repair generator", "scripts\generator.sqf"]};
		waituntil {sleep 0.5;(((player distance generator)>5.5) || repairGen)};
		player removeaction generatoraction;
};