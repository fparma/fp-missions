// by cuel

private ["_grp","_j","_check", "_plr"];
_check = false;
_j = 0;
while  {!_check} do {
	_j = (4 - 1) min (round random (4));
	_grp = cuel_human_groups select _j;
	{
		if (isPlayer _x && alive _x) exitWith {_check = true;  _plr = _x;};
	}forEach units _grp;
	sleep 0.2;
};

_plr