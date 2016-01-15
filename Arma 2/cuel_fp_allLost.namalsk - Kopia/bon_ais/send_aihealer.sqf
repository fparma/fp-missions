_playerdown = _this select 0;

(group _playerdown addWaypoint [position _playerdown,0]) setWaypointBehaviour "AWARE";


While{alive _playerdown && _playerdown getVariable "bon_ais_agony" && {_x distance _playerdown < 4 && lifestate _x == "ALIVE"} count (units group _playerdown - [_playerdown]) == 0} do {

	{
		if(currentCommand _x != "MOVE") then {_x doMove position _playerdown};
	} foreach (units group _playerdown) - [_playerdown];

	sleep 1;
};


if(alive _playerdown && _playerdown getVariable "bon_ais_agony") then {

	_closestsquadmate = _playerdown;
	_min_distance = 100000;
	{
		_distance = _playerdown distance _x;
		if(_distance < _min_distance && not (isPlayer _x)) then{
			_min_distance = _distance;
			_closestsquadmate = _x;
		};
	} foreach (units group _playerdown) - [_playerdown];

	if(_closestsquadmate != _playerdown) then {

		["",_closestsquadmate,"",_playerdown] execVM (BON_AIS_PATH+"firstaid.sqf");
	};
};