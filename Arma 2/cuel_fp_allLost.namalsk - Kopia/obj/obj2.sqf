if (!isServer) exitWith{};

// most likely, task5 is assigned.
sleep 5;
if ("task5" call SHK_Taskmaster_hasTask) then {
["task5","canceled"] call SHK_Taskmaster_upd;
} else {
if ("task3failed" call SHK_Taskmaster_hasTask) then {["task3failed","canceled"] call SHK_Taskmaster_upd; };
if ("task4failed" call SHK_Taskmaster_hasTask) then {["task4failed","canceled"] call SHK_Taskmaster_upd; };
};
sleep 10;
["task6","Investigate Sebjan mine","<br><br/>The plane failed to rescue us. The military radio is out of batteries. However, gunshots and screams draw our attention to a nearby location, Sebjan mine. We should investigate and look for more survivors.",true,[["task6mark",getPos sebjanMineLoc,"mil_warning","ColorRed","Investigate Sebjan mine"]]] call SHK_Taskmaster_add;	

_z = call zombiesToSpawn;
for "_i" from 1 to 3 do {
	[position sebjanMineLoc, _z, 100] call spawnInf;
	sleep 0.5;
}; 

[] spawn {waitUntil {sleep 6; !alive merlin}; sleep 2; [nil,nil,"per",rTitleCut,"the helicopter was destroyed.", "BLACK", 5] call RE;sleep 5; [nil,nil,"per",rENDMISSION,"LOSER"] call RE; };
[] spawn {waitUntil {sleep 10; (merlin distance (getPos escapeMark)) < 800;};[nil,nil,"per",rTitleCut,"you have escaped!", "BLACK" , 6] call RE; ["task8", "succeeded"] call SHK_Taskmaster_upd; sleep 5; [nil,nil,"per",rENDMISSION,"END1"] call RE;};
while{{isPlayer _x} count (nearestObjects [(getPos heliLoc),["Man","LandVehicle", "Air"],30]) == 0} do {sleep 6;};
["task6","succeeded"] call SHK_Taskmaster_upd;
sleep 3;

[]spawn {{
	_pos = (position evacLoc);
	if((_x distance _pos < 800) && (side _x == resistance)) then {
		deleteVehicle _x;
	};
	}forEach allUnits;
	{
		deleteVehicle _x
	}forEach allDead;
};

["task7","Find fuel","<br><br/>We have found a helicopter, however it has no fuel. Sebjan, Al or Norinsk is very likely to have some fuel for the helicopter.",true,
[["tsk7mark1",getPos sebjanLoc,"selector_selectedMission","ColorBrown","Search for fuel"],
["tsk7mark2",getPos norinskLoc,"selector_selectedMission","ColorBrown","Search for fuel"],
["tsk7mark3",getPos alLoc,"selector_selectedMission","ColorBrown","Search for fuel"]]] call SHK_Taskmaster_add;	

_randFuel= random 3;
_pos = 0;
_trpos = 0;

switch (true) do {
case (_randFuel <= 1): {_pos = getPos alLoc; _trpos = getPos alLoc_1;};
case (_randFuel <= 2 && _randFuel > 1): {_pos = getPos norinskLoc;_trpos = getPos norinskLoc_1;};
case (_randFuel > 2):  { _pos = getPos sebjanLoc;_trpos = getPos sebjanLoc_1;};
default {_pos = getPos norinskLoc;};
};
	

fuelTruck = "nac_KamazRefuel" createVehicle _pos;
transportTruck = "nac_Kamaz" createVehicle _trpos;

while{{isPlayer _x} count (nearestObjects [_pos,["Man","LandVehicle"],400]) == 0} do {sleep 6;};
_z = call zombiesToSpawn;
for "_i" from 1 to 3 do {
	[_pos, _z, 150] call spawnInf;
	sleep 0.5;
}; 

{
	_cleanpos = (position sebjanMineLoc);
	if((_x distance _pos < 500) && (side _x == resistance)) then {
		deleteVehicle _x;
	};
}forEach allUnits;
{
		deleteVehicle _x
}forEach allDead;

[position heliLoc, 12, 150] call spawnInf;
[] spawn {waitUntil {sleep 6; !alive fuelTruck}; sleep 2; if (!("task8" call SHK_Taskmaster_hasTask)) then {[nil,nil,"per",rTitleCut,"the fuel truck was destroyed.", "BLACK FADED", 6] call RE;sleep 5; [nil,nil,"per",rENDMISSION,"LOSER"] call RE; };};

waitUntil {((fuelTruck distance merlin) < 60);};
["task8","Escape!","<br><br/>Refuel the helicopter and leave this island!",true,[["escapeMarkert",getPos escapeMark,"End","ColorRed","Escape"]]] call SHK_Taskmaster_add;	
["task7", "succeeded"] call SHK_Taskmaster_upd;
