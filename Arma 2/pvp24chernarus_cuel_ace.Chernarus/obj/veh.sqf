private ["_attackside", "_spawnattack","_spawndefense", "_cars","_apc"];
_attackside = _this select 0;
_spawnattack = _this select 1;
_spawndefense = _this select 2;

_cars = false;
_apc = false;
if (random(5) > 3) then {
	if (_attackside == WEST) then {
		_carpos = _spawnattack findEmptyPosition [5, 100, "HMMWV_M2"];
		_c1 ="HMMWV_M2" createVehicle _carpos;
		_c1 = "HMMWV_M2" createVehicle _carpos;
		_carpos = _spawndefense findEmptyPosition [5, 100, "Offroad_DSHKM_INS"];
		_o1 ="Offroad_DSHKM_INS" createVehicle _carpos;
		_o2 = "Offroad_DSHKM_INS" createVehicle _carpos;
		_cars = true;
		}else {
		_carpos = _spawndefense findEmptyPosition [5, 100, "HMMWV_M2"];
		_c1 = "HMMWV_M2" createVehicle _carpos;
		_c2 = "HMMWV_M2" createVehicle _carpos;
		_carpos = _spawnattack findEmptyPosition [5, 100, "Offroad_DSHKM_INS"];
		_o1 = "Offroad_DSHKM_INS" createVehicle _carpos;
		_o2 = "Offroad_DSHKM_INS" createVehicle _carpos;
		_cars = true;
		};
};
sleep 1;
if (random 5 > 4) then {
	if (_attackside == WEST) then {
		_carpos = _spawnattack findEmptyPosition [5, 100, "LAV25"];
		_l1 = "LAV25" createVehicle _carpos;
		_carpos = _spawndefense findEmptyPosition [5, 100, "BTR90"];
		_b1 ="BTR90" createVehicle _carpos;
		_apc = true;
		}else {
		_apc = true;
		_carpos = _spawndefense findEmptyPosition [5, 100, "LAV25"];
		_l1 = "LAV25" createVehicle _carpos;
		_carpos = _spawnattack findEmptyPosition [5, 100, "BTR90"];
		_b1 = "BTR90" createVehicle _carpos;
		};
};
sleep 1;
if (_cars || _apc) then {
if (_cars) then {waitUntil {sleep 5;missionDone};sleep 1;deletevehicle _c1; deletevehicle _c2; deletevehicle _o1; deletevehicle _o2;};
if (_apc) then {waituntil {sleep 5;missionDone};sleep 1; deletevehicle _l1; deletevehicle _b1;};
};