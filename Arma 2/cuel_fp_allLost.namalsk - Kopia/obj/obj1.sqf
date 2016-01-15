if (!isServer) exitWith{};

while {!stayVorkuta} do {sleep 5;};
["task1", "succeeded"] call SHK_Taskmaster_upd;
sleep 10;
["task2","Search the north army base","You and your friends are going to need weapons if you're going to make this. There's also a possibility that you might find other useful stuff at the army base. You should investigate it.<br><br/></br/>Two trucks are located inside Vorkuta.",true,["task2mark",(getPosATL armyLoc),"mil_unknown","ColorBlue","Search the base"]] call SHK_Taskmaster_add;

[nil,nil,"per",rSPAWN,player,{truck1 allowDamage true; truck1 setVehicleLock "UNLOCKED";truck2 allowDamage true; truck2 setVehicleLock "UNLOCKED";}] call RE;
// let's be sure server knows this
truck1 allowDamage true; truck1 setVehicleLock "UNLOCKED";
truck2 allowDamage true; truck2 setVehicleLock "UNLOCKED";

[] spawn {waitUntil{sleep 3; truck1 distance (getPos armyLoc) < 380};truck1 setHit ["palivo", 0.8]; truck1 setfuel 0;};
[] spawn {waitUntil{sleep 3; truck2 distance (getPos armyLoc) < 350};truck2 setHit ["palivo", 0.8]; truck2 setfuel 0;};

//wait for players to be closer than 500m from the army base
while{{isPlayer _x} count (nearestObjects [(getPos armyLoc),["Man","LandVehicle"],500]) == 0} do {sleep 5;};

_bomb = "Bo_GBU12_LGB" createVehicle (getmarkerPos "fuelMark1");

//cleanup
sleep 1;
[]spawn {{
	if((_x distance (position vorkutaLoc) < 600) && (side _x == resistance)) then {
		deleteVehicle _x;
	};
	}forEach allUnits;
	{
		deleteVehicle _x
	}forEach allDead;
};

//spawn army base
_z = call zombiesToSpawn;
sleep 1;
[position armyLoc, _z, 150] call spawnInf; 
sleep 0.5;
[position armyLoc, _z, 150] call spawnInf;

//waiuntil players closer to army base
while{{isPlayer _x} count (nearestObjects [(getPos armyLoc),["Man","LandVehicle"],20]) == 0} do {sleep 6;};
[nil, nil, rHINT, "Your team has picked up a military radio."] call RE;
["task2", "succeeded"] call SHK_Taskmaster_upd;
sleep 2;
//get a random pos within the ellipse marker placed in the editor
_genpos = ["genmark"] call SHK_pos;
//get a flat area near the position.
_genpos = [_genpos,(round(random(80)))] call getFlatArea;

tfor_sidechat = "THIS IS FOXTROT MIKE TO NOVEMBER BRAVO. DO YOU READ, OVER?";
publicVariable "tfor_sidechat";

generator = "PowGen_Big" createVehicle _genpos;
[_genpos, 10, 100] call spawnInf;
//players need to know what to add the action to.
publicVariable "generator";
_antenn =  "Land_Antenna" createVehicle [(_genpos select 0)+3,( _genpos select 1),(_genpos select 2)];

_markpos = [_genpos,(150-(round(random(150))))] call SHK_pos;

sleep 10;
tfor_sidechat = "I DON'T KNOW IF YOU CAN HEAR ME NOVEMBER BRAVO. IF YOU CAN, YOU NEED TO ACTIVATE THE ANTENNA AND SEND A BROADCAST MESSAGE FROM THE BACKUP COMMUNICATION TOWER.";
publicVariable "tfor_sidechat";
sleep 10;
tfor_sidechat = "SENDING GRID COORDINATES NOW. ACTIVATE THE GENERATOR AND FIND THE COMMUNICATION TOWER AND SEND THE BROADCAST. MESSAGE ALREADY PREPARED. WE'LL COME PICK YOU UP WHEN WE RECEIVE THE MESSAGE. FOXTROT MIKE, OUT.";
publicVariable "tfor_sidechat";

//persistant marker for jip + current players.
_marker = ["generatorMarker", [(_markpos select 0),(_markpos select 1)], "Ellipse", [150, 150], "COLOR:", "ColorWhite", "PERSIST"] call CBA_fnc_createMarker;
_marker setMarkerAlpha 0.3;
//remote execution, add action for players and jip.
[nil, generator, "per", rADDACTION, "Align antenna for emergency broadcast", "scripts\generator.sqf"] call RE;
["task3","Activate and align antenna","You were contacted by the Military at the Army Base. Since there's no military to be found at the base, it might be a good idea to solve whatever problems the military are having right now.<br><br/></br/>Locate the generator and antenna, and activate it."] call SHK_Taskmaster_add;	

while {!genVar && alive generator} do {sleep 8};

if (!alive generator) then {
	["task3", "failed"] call SHK_Taskmaster_upd;
	["task3failed","Investigate the dam","<br><br/>The generator was destroyed, so we could not help the military. We're moving on to the dam to check for more survivors.",true,[["task3failedmark",getPos evacLoc,"mil_warning","ColorBlue","Investigate"]]] call SHK_Taskmaster_add;	
} else {
	["task3", "succeeded"] call SHK_Taskmaster_upd;
	//look out mast for message
	_genpos = ["radiomark1"] call SHK_pos;
	_genpos = [_genpos,(round(random(80)))] call getFlatArea;
	tower = "Land_radar" createVehicle _genpos;
	publicVariable "tower";
	sleep 2;
	[nil, tower, "per", rADDACTION, "Send emergency broadcast", "scripts\tower.sqf"] call RE;
	[_genpos, 15, 150] call spawnInf;
	_markpos = [_genpos, (150-(round(random(150))))] call SHK_pos;
	_marker = ["towerMarker", [(_markpos select 0),(_markpos select 1)], "Ellipse", [150, 150], "COLOR:", "ColorWhite", "PERSIST"] call CBA_fnc_createMarker;
	_marker setMarkerAlpha 0.3;
	["task4","Send prepared message","With the antenna working all you need to do is send the prepared broadcast message from the backup communication tower.<br><br/></br/>Locate the tower and send the message."] call SHK_Taskmaster_add;	

	while {!towerVar && alive tower} do {sleep 6};
	if (!alive tower) then {
	["task4", "failed"] call SHK_Taskmaster_upd;
	["task4failed","Investigate the dam","<br><br/>The com tower was destroyed, so we could not help the military. We're moving on to the dam to check for more survivors.",true,[["task4failedmark",getPos evacLoc,"mil_warning","ColorBlue","Investigate"]]] call SHK_Taskmaster_add;	
	} else {
		["task4", "succeeded"] call SHK_Taskmaster_upd;
		sleep 1;
		[nil, nil, rHINT, "Emergency broadcast sent"] call RE;
		sleep 4;
["task5","Wait for evac","<br><br/>We've sent the broadcast message from the communication tower. There's a nearby helicopter pad at the Dam. We should wait for the military to pick us up there.",true,[["task5mark",getPos evacLoc,"mil_warning","ColorBlue","Wait for pickup"]]] call SHK_Taskmaster_add;	
	}
};


//cleanup
sleep 1;
[]spawn {{
	_pos = (position armyLoc);
	if((_x distance _pos < 700) && (side _x == resistance)) then {
		deleteVehicle _x;
	};
	}forEach allUnits;
	{
		deleteVehicle _x
	}forEach allDead;
};
[] execVM "scripts\planeCrash.sqf";
if (true) exitWith{};
