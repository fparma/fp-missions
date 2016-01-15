
CUL_snowEmitter = objNull;
CUL_doSnow = {
	deleteVehicle CUL_snowEmitter;
	if (alive ACE_player) then {
		_pos = eyepos ACE_player;
		_highpos = [_pos select 0,_pos select 1,(_pos select 2) + 10];
		if (!(lineintersects [_pos,_highpos]) || vehicle ACE_player != ACE_player) then {
			CUL_snowEmitter = "#particlesource" createVehicleLocal getpos ACE_player;
			CUL_snowEmitter setParticleCircle [0.0, [0, 0, 0]];
			CUL_snowEmitter setParticleRandom [0, [10, 10, 7], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
			CUL_snowEmitter setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "", vehicle player];
			CUL_snowEmitter setDropInterval  (0.001 * ceil random 5);
			CUL_snowEmitter attachto [vehicle ACE_player,[0,0,8]];
		};
	};
};
/*
CUL_breathe_units = [];
CUL_fnc_updateBreatheUnits = {
	{
		if (_x distance ACE_player < 100 && {vehicle _x == _x}) then {
			CUL_breathe_units pushBack _x;
		} else {
			_x setVariable ["myNextBreathTime", -1];
			deletevehicle (_x getVariable ["myBreathingParticleLogic", objNull]);
			deletevehicle (_x getVariable ["myBreathingParticleSource", objNull]);
		};
	} forEach allUnits;
	{
		deletevehicle (_x getVariable ["myBreathingParticleLogic", objNull]);
		deletevehicle (_x getVariable ["myBreathingParticleSource", objNull]);
	} foreach alldead;
};


CUL_fnc_displayBreathe = {
	if (count CUL_breathe_units == 0) exitWith {[] call CUL_fnc_updateBreatheUnits};

	local _unit = CUL_breathe_units deleteAt 0;
	local _nextTime = _unit getVariable ["myNextBreathTime", -1];

	if(_nextTime == -1) then {
		_unit setVariable ["myNextBreathTime", diag_tickTime + (random 3)];
		local _source = "logic" createVehicleLocal (getpos _unit);
		_unit setVariable ["myBreathingParticleLogic", _source];
		if(_unit == player) then {
			_source attachto [_unit,[0,0.1,.04], "neck"];
		} else {
			_source attachto [_unit,[0,0.05,-0.08], "pilot"];
		};
		_unit setVariable ["myBreathingParticleSource", nil];
	};

	local _myParticleSource = _unit getVariable ["myBreathingParticleSource", nil];
	if(diag_tickTime >= _nextTime) then {
		if (isNil "_myParticleSource") then {
			_unit setVariable ["myNextBreathTime", diag_tickTime + 0.5];
			local _mylogic = _unit getVariable "myBreathingParticleLogic";
			local _fog = "#particlesource" createVehicleLocal (getpos _mylogic);
			_fog setParticleParams [
				["\a3\Data_f\ParticleEffects\Universal\Universal", 16, 12, 13,0],
				"",
				"Billboard",
				0.5,
				0.5,
				[0,0,0],
				[0,0.0,-0.3],
				1,1.275,1,0.2,
				[0,0.2,0],
				[[1,1,1,0.3], [1,1,1,0.01], [1,1,1,0]],
				[1000],
				1,
				0.04,
				"",
				"",
				_mylogic
				];
			_fog setParticleRandom [0.5, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
			_fog setDropInterval 0.01;
			_unit setVariable ["myBreathingParticleSource", _fog];
		} else {
			// Next breath, shorter time for more fatigue
			local _time = 3 + (random 1);
			local _fat = (getfatigue _unit) * 2;
			if (_fat > 1) then {
				_fat = 1;
			};
			local _factor = _time - (_fat * _time); // shorter breath when fatigued
			local _nextbreath =  diag_ticktime + 0.5 + _factor;
			_unit setVariable ["myNextBreathTime", _nextbreath];
			deletevehicle (_unit getVariable "myBreathingParticleSource");
			_unit setVariable ["myBreathingParticleSource", nil];
		};
	};
};
*/

tpw_fog_fnc_breathe = {
	private ["_unit","_int","_nextTime", "_source","_myParticleSource","_mylogic", "_fog","_nextbreath","_time","_factor","_fat"];
	{
		_unit = _x;

		// Only bother if unit is alive, close to player and foggy conditions are met
		if ((alive _unit) &&  {_unit distance player < 100} && {_unit == vehicle _unit}) then
			{
			_nextTime = _unit getVariable ["myNextBreathTime", -1];
			if(_nextTime == -1) then
				{
				_unit setVariable ["myNextBreathTime", diag_tickTime + (random 3)];
				_source = "logic" createVehicleLocal (getpos _unit);
				_unit setVariable ["myBreathingParticleLogic", _source];
				if(_unit == player) then
					{
					_source attachto [_unit,[0,0.1,.04], "neck"];
					}
				else
					{
					_source attachto [_unit,[0,0.05,-0.08], "pilot"];
					};
			_unit setVariable ["myBreathingParticleSource", nil];
				};
			_myParticleSource = _unit getVariable ["myBreathingParticleSource", nil];
			if(diag_tickTime >= _nextTime) then
				{
				if (isNil "_myParticleSource") then
					{
					_unit setVariable ["myNextBreathTime", diag_tickTime + 0.5];
					_mylogic = _unit getVariable "myBreathingParticleLogic";
					_fog = "#particlesource" createVehicleLocal (getpos _mylogic);
					_fog setParticleParams [
						["\a3\Data_f\ParticleEffects\Universal\Universal", 16, 12, 13,0],
						"",
						"Billboard",
						0.5,
						0.5,
						[0,0,0],
						[0,0.0,-0.3],
						1,1.275,1,0.2,
						[0,0.2,0],
						[[1,1,1,0.3], [1,1,1,0.01], [1,1,1,0]],
						[1000],
						1,
						0.04,
						"",
						"",
						_mylogic
						];
					_fog setParticleRandom [0.5, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
					_fog setDropInterval 0.01;
					_unit setVariable ["myBreathingParticleSource", _fog];
					}
				else
					{
					// Next breath, shorter time for more fatigue
					_time = 3 + (random 1);
					_fat = (getfatigue _unit) * 2;
					if (_fat > 1) then
						{
						_fat = 1;
						};
					_factor = _time - (_fat * _time); // shorter breath when fatigued
					_nextbreath =  diag_ticktime + 0.5 + _factor;
					_unit setVariable ["myNextBreathTime", _nextbreath];
					deletevehicle (_unit getVariable "myBreathingParticleSource");
					_unit setVariable ["myBreathingParticleSource", nil];
					};
				};
			}
		else
		{
			_unit setVariable ["myNextBreathTime", -1];
			deletevehicle (_unit getVariable "myBreathingParticleLogic");
			deletevehicle (_unit getVariable "myBreathingParticleSource");
		};
	} forEach allUnits;
	{
		deletevehicle (_x getVariable "myBreathingParticleLogic");
		deletevehicle (_x getVariable "myBreathingParticleSource");
	} foreach alldead;
};


[{
	[tpw_fog_fnc_breathe, 0.2] call cba_fnc_addPerFrameHandler;
	[CUL_doSnow, 2] call cba_fnc_addPerFrameHandler;
	//playSound "winter";
	if (!(str player in ["gm", "debugger"])) then {
		[{
			playSound "winter";
		}, 118] call cba_fnc_addPerFrameHandler;
	};
}, []] call ACE_common_fnc_execNextFrame;
