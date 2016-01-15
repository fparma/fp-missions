if (not isServer) exitWith{};

e_zombies = ["NS_zombie1", "NS_zombie2", "NS_zombie3"];
e_bs = "ns_bloodsucker";

call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
spawnInf = compile (preprocessFileLineNumbers "funcs\func_spawninf.sqf");
getRandomElement = compile (preprocessFileLineNumbers "funcs\func_getrandomarrayelement.sqf");
getFlatArea = compile (preprocessFileLineNumbers "funcs\func_getflatarea.sqf");
zombiesToSpawn = compile (preprocessFileLineNumbers "funcs\func_zombiesToSpawn.sqf");
getRandomGroup = compile (preprocessFileLineNumbers "funcs\func_getrandomgroup.sqf");
flyIn = call compile preprocessFile "scripts\flyIn.sqf";

genVar = false;
towerVar = false;

{
_x execVM "funcs\SHK_intercept.sqf";
} forEach cuel_human_groups;


[] execVM "obj\obj1.sqf";
sleep 3;
_z = call zombiesToSpawn;
for "_i" from 1 to 4 do {
	[position vorkutaLoc, _z, 180] call spawnInf;
	sleep 0.5;
}; 

[] execVM "scripts\ammoboxes.sqf";