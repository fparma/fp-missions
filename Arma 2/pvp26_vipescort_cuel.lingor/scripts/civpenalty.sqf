if (!isServer) exitWith {};
_target = _this select 0;
_killer = _this select 1;
if (_killer == _target) then {
_vehArr = nearestObjects [_target, ["Car"], 30];
{
	if (side _x == WEST && isPlayer _x) exitWith {_killer = _x};
}foreach _vehArr;
};

if (isPlayer _killer && side _killer == WEST) then{
cur_civ_death = cur_civ_death + 1;
[nil, nil, rHINT, format ["%1 has killed a civilian! this is unacceptable. (max kills : %2/%3)",(name _killer), cur_civ_death,max_civ_death]]call RE;
};