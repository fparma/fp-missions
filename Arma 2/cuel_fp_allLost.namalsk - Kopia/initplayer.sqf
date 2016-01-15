if (isDedicated) exitWith {};

[] execVM "scripts\player_respawn.sqf";
cutText ["\n\n\n\n\n\n\n\n\n\n\n all lost", "BLACK FADED"];
sleep 3;
titleCut ["\n\n\n\n\n\n\n\n\n\n\n all lost", "BLACK IN", 5];

if (time > 120) then {
	_spawned = false;
    _pos =  [];
	_lead = leader(group player);
	if (alive _lead && player != _lead && isPlayer _lead) then {
			_pos = (getPos  _lead) findEmptyPosition [15, 50, typeOf (vehicle player)];
			if (count _pos != 0) exitWith {_spawned=true; if (vehicle _lead == _lead) then {player setPos (getPos _lead);} else {player moveInCargo vehicle _lead;};};
		};
	{
		if (isPlayer _x && player != _x && alive _x  && !_spawned ) then {
			_char = _x;
			_pos = (getPos _char) findEmptyPosition [15, 50, typeOf (vehicle player)];
			if ((count _pos) != 0) exitWith  {_spawned=true; if (vehicle _char ==  _char) then {player setPos (getPos _char);} else {player moveInCargo (vehicle _char);};};
			};
		} forEach units (group player);
	sleep 5;
};
smokeFX = [firepos, 5, time, false, false] spawn BIS_Effects_Burn;
if(true) exitWith {};