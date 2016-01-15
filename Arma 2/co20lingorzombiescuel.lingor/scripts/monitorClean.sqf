if (!isServer) exitWith {};

while {true} do {
	sleep 10;
	_units = allUnits;
	_todelete = [];
	
	{
		if ({{isPlayer _x} count nearestObjects[_x,["Man","LandVehicle"],500] == 0}) then {_todelete = _todelete + [_x]};
		sleep 2;
	}forEach _units;
	sleep 1;
	{
		_grp = group _x;
		_x join grpNull;
		deleteVehicle _x;
		sleep 3;
		deleteGroup _grp;
	}forEach _todelete
sleep 5;
};