// by Cuel

_type = _this select 3;
_areamarker = "tankspawnmarker";
_centerpos = getMarkerPos _areamarker; _centerX = abs(_centerpos select 0); _centerY = abs(_centerpos select 1);
_centerpos = [_centerX,_centerY];
_areasize = getMarkerSize _areamarker; _rangeX = _areasize select 0; _rangeY = _areasize select 1;
_areadir = (markerDir _areamarker) * -1;
_cosdir=cos(_areadir);
_sindir=sin(_areadir);

_targetPos = [_centerX,_centerY,_rangeX,_rangeY,_cosdir,_sindir,_areadir] call KRON_randomPos;		

_veh = "";

switch (_type) do {
	case 0: {
		_veh = createVehicle ["TargetFakeTank_EP1", _targetPos, [], (random 360), "NONE"];
	};
	case 1: {
		_dir = [_targetPos, _centerpos] call BIS_fnc_dirTo;
		if (_dir < 0) then {
			_dir = _dir + 360;
		};
		_v = [_targetPos, _dir, "Pickup_PK_GUE", RESISTANCE] call bis_fnc_spawnvehicle;
		_veh = _v select 0;
	};
	case 2: {
		_dir = [_targetPos, _centerpos] call BIS_fnc_dirTo;
		if (_dir < 0) then {
			_dir = _dir + 360;
		};
		_v = [_targetPos, _dir, "BRDM2_INS", RESISTANCE] call bis_fnc_spawnvehicle;
		_veh = _v select 0;

	};
	case 3: {
		_dir = [_targetPos, _centerpos] call BIS_fnc_dirTo;
		if (_dir < 0) then {
			_dir = _dir + 360;
		};
		_v = [_targetPos, _dir, "T72_INS", RESISTANCE] call bis_fnc_spawnvehicle;
		_veh = _v select 0;
	};
};
sleep 0.02;
if (_type > 0) then {
	_veh setVehicleInit "this allowCrewInImmobile true;"; processInitCommands;
};

_move = "";
if ((_targetPos distance (getMarkerpos "tanktrainmove1")) > (_targetPos distance (getMarkerpos "tanktrainmove2"))) then {
	_move = getMarkerPos "tanktrainmove1";
}else{
	_move = getMarkerPos "tanktrainmove2";
};

if (local _veh) then {
	_veh setVehicleAmmo 0;
	_veh doMove _move;
}else{
	[-0, {_veh = (_this select 0), _m = (_this select 1); _veh setVehicleAmmo 0;_veh doMove _m}, _veh, _move] call CBA_fnc_globalExecute;
};

sleep 1;
if (_type > 0) then {
	_w = time;
	_w = _w+60;
	waitUntil {sleep 1;(time > _w) || (!(canMove _veh)) };
	sleep 10;
	{
		deleteVehicle _x;
	}foreach crew _veh;
	deleteVehicle _veh;
}else{
	_w = time;
	_w = _w+90;
	waitUntil {sleep 1;(time > _w) || ((damage _veh) > 0.5)};
	sleep 10;
	deleteVehicle _veh;
};