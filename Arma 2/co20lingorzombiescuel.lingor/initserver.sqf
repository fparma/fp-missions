if (!isServer) exitWith {};
cleanUp = compile (preprocessFileLineNumbers "scripts\cleanup.sqf");
destoytruck = false;
["jipMove", true] call CBA_fnc_setMarkerPersistent;
waitUntil {!isnil "bis_fnc_init"};
_group = createGroup sideLogic;
zombiespawner = _group createUnit ["Logic", [100,100], [], 0, "NONE"];

//changed variables to fit lingor
_xaxis = 2000;
_yaxis = 4000;
_working = true;
_c = 0;
while {_working} do {
	_yaxis = _yaxis + 1000;
	if (_yaxis >= 10000) then {
	_xaxis = _xaxis + 1000;
	_yaxis = 5000;
};
_pos = [_xaxis,_yaxis];
_trig = createTrigger ["EmptyDetector", _pos];
_trig setTriggerArea [500,500,0,true];
_trig setTriggerActivation ["NONE", "PRESENT", FALSE];
// lets make it dynamic!
if ((random 2) < 1) then {
_trig setTriggerStatements ["true", "0=[thisTrigger,20] execVM 'zombie_scripts\cly_z_generator.sqf';", ""];
} else {
_trig setTriggerStatements ["true", "0=[thisTrigger,30] execVM 'zombie_scripts\cly_z_generatorhorde.sqf';", ""];
};
_allaxiss = _xaxis + _yaxis;
if (_allaxiss >= 16000) then {_working = false;};
};
sleep 10;
[] spawn {
	waitUntil {sleep 5; destroytruck};
	sleep 2+(random 5);
	"Sh_120_SABOT" createVehicle (getpos truck); 
	sleep 0.5;
	truck setHit ["palivo", 0.8]; 
	truck setfuel 0;
};

while{{isPlayer _x} count nearestObjects[villageAmmo,["Man"],20] == 0} do{sleep 5};
sleep 10;
[(getpos server), 300] call cleanUp;
["villageTask", "succeeded"] call SHK_Taskmaster_upd;
"jipMove" setMarkerPos (getmarkerpos "villageMark");
["fobTask","Seek help at the Army Base","<br><br/>At least you found some ammo. Not even villagers were saved from this zombie outbreak. There's a nearby FOB that's very likely to still have survivors! Or at least more ammo, which we need. Maybe we'll find other useful stuff ther aswell.",true,[["fobTaskMark",(getmarkerpos "fobMark"),"selector_selectedMission","ColorBlue","Seek help"]]] call SHK_Taskmaster_add;	
waitUntil {sleep 4; mapFound};
"jipMove" setMarkerPos (getmarkerpos "fobMark");
[(getmarkerpos "villageMark"), 700] call cleanUp;
deleteVehicle rem1;
deleteVehicle rem2;
["fobTask", "succeeded"] call SHK_Taskmaster_upd;
sleep 10;
["fobMap","Find the repair item","<br><br/>You've acquired a map. There is a radio tower marked on the map near map grid 054055. There's also some notes on how to send a distress message to other military bases, however the generator that powers the antenna is not working. The notes describe how to repair the generator, but first you need to find the item that you need in a checkpoint near Castillao San Fernando. Hopefully the military can get you off this island<br><br/>The notes also say that there should be a truck near Alculto that you can use for transport",true,[["itemtaskMark",(getmarkerpos "checkpoint"),"selector_selectedMission","ColorRed","Find item"]]] call SHK_Taskmaster_add;	
["taskOpt","Optional: Collect info","<br><br/>According to the military notes, a research lab NE of Alcuto was where the spread/disease started. Finding information about the outbreak will be vital for further research to create a cure.",true,[["fobTaskMark",(getmarkerpos "fobMark"),"selector_selectedMission","ColorRed","Seek help"]]] call SHK_Taskmaster_add;	
_dontmove = false;
[] spawn {
	waitUntil {sleep 5; harddrive};
	["taskOpt", "succeeded"] call SHK_Taskmaster_upd;
	"jipMove" setMarkerPos (getmarkerpos "moveMarker");
	_dontMove = true;
	sleep 60;
	[(getpos computar), 300] call cleanUp;
};

waitUntil {sleep 5;collectItem};
if (!_dontMove) then {
"jipMove" setMarkerPos (getmarkerpos "alcutoMark");
};
[(getmarkerpos "fobMark"), 300] call cleanUp;
[nil, nil, rHint, "Your team found the item needed to repair the generator."]call RE;
waitUntil {sleep 4; repairGen};
"jipMove" setMarkerPos (getmarkerpos "genMark");
	[(getpos boxes), 1200] call cleanUp;
["fobMap", "succeeded"] call SHK_Taskmaster_upd;
["findTruck","Find the fuel truck","<br><br/>The military responded to our transmission, there should still be a working C130 at the Maruko Airport, however it has no fuel. There should however be a fuel truck located near map grid 070056. You need to find the fuel truck.",true,[["fueldumpTaskMark",(getpos fuelDump),"selector_selectedMission","ColorRed","Find the truck"]]] call SHK_Taskmaster_add;	
while{{isPlayer _x} count nearestObjects[truckObj,["Man"],20] == 0} do{sleep 5};
[(getpos generator), 1200] call cleanUp;
"jipMove" setMarkerPos (getmarkerpos "townMark");
sleep 5;
["findTruck", "succeeded"] call SHK_Taskmaster_upd;
["escape","Escape!","<br><br/>Escort the fuel truck to the C130 to refuel it and escape!",true,[["planemark",(getpos c130),"selector_selectedMission","ColorRed","Find the truck"]]] call SHK_Taskmaster_add;	
hasEscaped = false;
fueltruck spawn {
	while {alive _this} do {sleep 4};
	if (fuel c130 > 0.1) exitWith{};
	[nil,nil,"loc",rTitleCut,"the fuel truck was destroyed.", "BLACK FADED", 6] call RE;sleep 8; [nil,nil,"per",rENDMISSION,"LOSER"] call RE;
};

waitUntil {sleep 2;hasEscaped || !alive c130};

if (alive c130) then {
	if ("taskopt" call SHK_Taskmaster_isCompleted) then {
		[nil,nil,"loc",rTitleCut,"You've escaped the horrors successfully.", "BLACK FADED", 6] call RE;sleep 8; [nil,nil,"per",rENDMISSION,"END1"] call RE; 
	}else {
		["taskOpt", "failed"] call SHK_Taskmaster_upd;
		sleep 5;
		[nil,nil,"loc",rTitleCut,"You've escaped.", "BLACK FADED", 6] call RE;sleep 8; [nil,nil,"per",rENDMISSION,"END2"] call RE; 
	};
}else{
	[nil,nil,"loc",rTitleCut,"The C130 was destoyed, you have failed to escape and you are stuck on this island forever.", "BLACK FADED", 6] call RE;sleep 8; [nil,nil,"per",rENDMISSION,"LOSER"] call RE;
};