_dest = _this select 3;

if (isNil "s1") then {s1 = objNull};
if (isNil "s1_1") then {s1_1 = objNull};
_found = false;

switch (player) do {
	case s1: {
			{if (alive _x) exitWith {_found = true;player setPos (getPos _x)};}foreach [s2,s1_1,s2_1];		
		};
	case s1_1: {
			{if (alive _x) exitWith {_found = true;player setPos (getPos _x)};}foreach [s2_1,s1,s2];
		};
};

if (!_found) then {
	if (_dest == 1) then {if (!isNull s1) then {player setPos (getpos s1)};};
	if (_dest == 2) then {if (!isNull s1_1) then {player setPos (getpos s1)};};
};

sleep 1;
_stuff = nearestObjects [player, ["All"],50];
{player reveal [_x,4]} forEach _stuff;