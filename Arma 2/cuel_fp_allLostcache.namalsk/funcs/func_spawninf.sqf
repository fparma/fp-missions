// by Bon_Inf*
// particulary stolen from EVO ;-)
//edited by cuel for namalsk mission. cred to shuko for set pos
//_grp = [position location, how many, radius to spawn] call spawnInf;

private ["_strength","_Grp","_unit","_pos","_radius","_shkpos","_max"]; // stolen from EVO (a bit)


_pos = _this select 0;
_strength = _this select 1;
_radius = _this select 2;
_Grp = createGroup resistance;


_max = (count e_zombies)-1;
for "_j" from 1 to _strength do {
  _shkpos = [_pos, (random _radius)] call SHK_pos;
	_unit = _Grp createUnit [e_zombies select (round random _max),_shkpos,[],0,"NONE"];
	_unit setSkill 1;
};

//60% to spawn a blooodsucker per group
if (random 5 < 3) then {
_shkpos = [_pos, (random _radius)] call SHK_pos;
_unit = _Grp createUnit [e_bs,_shkpos,[],0,"NONE"];
};

// Cleanup
_Grp spawn {
	_units = units _this;
	While{({alive _x} count _units) > 0} do{sleep 10};
	sleep 30;
	{
		hidebody _x;
		sleep 3;
		deleteVehicle _x;
	} foreach _units;

	sleep 10;
	deleteGroup _this;
};

_Grp