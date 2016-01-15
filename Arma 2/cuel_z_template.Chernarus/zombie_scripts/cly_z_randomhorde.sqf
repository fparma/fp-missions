//random horde script by Celery, edited by Cuel.

if (!isServer) exitWith {};
_interval=CLY_randomhordemininterval+random (CLY_randomhordemaxinterval-CLY_randomhordemininterval);
sleep _interval;

while {true} do {
	sleep 1;
	_averagex=0;
	_averagey=0;
	_divide=count CLY_players;
	_amount=CLY_randomhordeminamount+floor random (CLY_randomhordemaxamount-CLY_randomhordeminamount+1);
	_fail = false;
	if  (_divide==0 or ({side _x==east or side _x==west or side _x==resistance} count allGroups>(432-(CLY_hordereservedgroups - _amount)))) then {_fail = true;};
	if (!_fail) then {
		{_averagex=_averagex+(getPosATL vehicle _x select 0);_averagey=_averagey+(getPosATL vehicle _x select 1)} forEach CLY_players;
		_averagepos=[_averagex/_divide,_averagey/_divide,0];
		_found = false;
		_try = 0;
		_pos  = [0,0,0];
		while {_try < 100 and !_found} do {
			sleep 0.032;
			_try = _try+1;
			_pos= [_averagepos,CLY_randomhordeminspawndist] call CBA_fnc_randPos;
			if (!surfaceisWater _pos && !([_pos,CLY_randomhordeminspawndist] call CBA_fnc_nearPlayer)) then {_found = true;};
		};
		if (_found) then {
		sleep 1;
			_trigger=createTrigger ["EmptyDetector",_pos];
			_trigger setTriggerArea [20,20,0,false];
			_trg setTriggerActivation["NONE","PRESENT",true];
			_snd = if (random 1 > 0.6) then {true}else{false};
			[_trigger,_amount,_snd] execVM "zombie_scripts\cly_z_horde.sqf";
			_interval=CLY_randomhordemininterval+random (CLY_randomhordemaxinterval-CLY_randomhordemininterval);
			sleep _interval;			
		};
	};
};