// by cuel
//REMEMBER that when I spawn zombies I usually LOOP it (to avoid 30 zombies in one group!).


private ["_p"];
_p = 0;
{
	if (isPlayer _x && alive _x) then {
	_p = _p + 1;
	}
}forEach playableUnits;


if (_p <= 2) exitWith {2};
if (_p < 5) exitWith {4};
if (_p < 7) exitWith {5};
if (_p <= 10) exitWith {7};
//max to spawn;
if (_p >= 10) exitWith {10};