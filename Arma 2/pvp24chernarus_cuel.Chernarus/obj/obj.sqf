if (!isServer) exitWith {};
private ["_attackpos","_attackside","_defside","_spawnattack","_spawndefense","_carpos","_defCount","_attCount","_pos","_loc","_place","_forest","_posSelect","_mark"];
_pos = position _this;
_loc = _this;
_place = format ["%1", text _loc];
[nil, nil, rHINT, "Round starts in 2 minutes. Choose your gear"] call RE;
_attackpos =   [_pos, 500] call SHK_pos;
_forest = selectBestPlaces [_attackpos,200,"forest",50,5];
_posSelect = _forest select (floor random (count _forest));

if ((count _posSelect > 1) && (_posSelect select 0) distance _pos > 300 ) then {_attackpos = _posSelect select 0};

_attackside = WEST;
_defside = EAST;
if (random 2 < 1) then {
_attackside = EAST;
_defside = WEST;
};
sleep 57;
["attack"+_place,"Attack "+_place,"<br><br/>Your objective is to attack "+_place+". Clear out all enemies to win.",_attackside,[["attackmark",_pos,"mil_warning","ColorRed","Attack"]]] call SHK_Taskmaster_add;	
["defend"+_place,"Defend "+_place,"<br><br/>Your objective is to defend "+_place+". Clear out all enemies to win.",_defside,[["defendmark",_pos,"mil_warning","ColorBlue","Attack"]]] call SHK_Taskmaster_add;	


if (!isMultiplayer) then {playableUnits = switchableUnits;};
_spawnattack = _attackpos findEmptyPosition [5, 50];
_spawndefense = _pos findEmptyPosition [5, 50];
if (count _spawnattack == 0) then {_spawnattack = _attackpos};
if (count _spawndefense == 0) then {_spawndefense = _pos};
[nil, nil, rHINT, "Round will start in 1 minute. Get ready"] call RE;
sleep 57;
[nil, nil, rHINT, "Round starting..."] call RE;
sleep 1;
/*
//pbv test
if (_attackside == WEST) then {
tpwest = _spawnattack;
publicVariable "tpwest";
tpeast = _spawndefense;
publicVariable "tpeast";
}else{
tpwest = _spawndefense;
publicVariable "tpwest";
tpeast = _spawnattack;
publicVariable "tpeast";
};
if (!isdedicated) then{if (playerSide == west) then {player setPos _spawnattack}else {player setPos _spawndefense;};};
//
*/
{
	if ((side _x) == _attackside) then {
		_x setPosATL [(_spawnattack select 0)+random (10), ( _spawnattack select 1)+random (10), 0];
	} else {
		_x setPosATL [( _spawndefense select 0)+ random(10), ( _spawndefense select 1)+random(10), 0];
	};
sleep 0.5;
}forEach playableUnits;

[] spawn {
clearWeaponCargoGlobal bluforammo;
clearMagazineCargoGlobal bluforammo;
clearWeaponCargoGlobal opforammo;
clearMagazineCargoGlobal opforammo;
};

if (random(5) > 3) then {
	if (_attackside == WEST) then {
		_carpos = _spawnattack findEmptyPosition [5, 100, "HMMWV_M2"];
		"HMMWV_M2" createVehicle _carpos;
		"HMMWV_M2" createVehicle _carpos;
		_carpos = _spawndefense findEmptyPosition [5, 100, "Offroad_DSHKM_INS"];
		"Offroad_DSHKM_INS" createVehicle _carpos;
		"Offroad_DSHKM_INS" createVehicle _carpos;
		}else {
		_carpos = _spawndefense findEmptyPosition [5, 100, "HMMWV_M2"];
		"HMMWV_M2" createVehicle _carpos;
		"HMMWV_M2" createVehicle _carpos;
		_carpos = _spawnattack findEmptyPosition [5, 100, "Offroad_DSHKM_INS"];
		"Offroad_DSHKM_INS" createVehicle _carpos;
		"Offroad_DSHKM_INS" createVehicle _carpos;
		};
};
if (random 5 > 4) then {
	if (_attackside == WEST) then {
		_carpos = _spawnattack findEmptyPosition [5, 100, "LAV25"];
		"LAV25" createVehicle _carpos;
		_carpos = _spawndefense findEmptyPosition [5, 100, "BTR90"];
		"BTR90" createVehicle _carpos;
		}else {
		_carpos = _spawndefense findEmptyPosition [5, 100, "LAV25"];
		"LAV25" createVehicle _carpos;
		_carpos = _spawnattack findEmptyPosition [5, 100, "BTR90"];
		"BTR90" createVehicle _carpos;
		};
};
defenddead = false;
sleep 1;

while {true} do {
sleep 4;
	_defCount = {side _x == _defside && alive _x} count (nearestObjects [_pos, ["Man","LandVehicle"],300]);
	_attCount = {side _x == _attackside && alive _x} count (nearestObjects [_pos, ["Man","LandVehicle"],1000]);
	sleep 1;
	if (_defCount == 0) exitWith {defenddead = true};
	if (_attCount == 0) exitWith {defenddead = false};
};

if (defenddead) then {
	["defend"+_place, "failed"] call SHK_Taskmaster_upd;
	["attack"+_place, "succeeded"] call SHK_Taskmaster_upd;
}else {
	["defend"+_place, "succeeded"] call SHK_Taskmaster_upd;
	["attack"+_place, "failed"] call SHK_Taskmaster_upd;
};
bluforammo execVM "fillbluforammo.sqf";
opforammo execVM "fillopforammo.sqf";

if (_attackside == WEST) then {
	if (defenddead) then {
	bluforwins = bluforwins+1;
	} else {
	opforwins = opforwins+1;
	};
}else{
	if (defenddead) then {
	opforwins = opforwins+1;
	} else {
	bluforwins = bluforwins+1;
	};
};

sleep 5;
{
	if ((_x distance _pos) < 1000) then {
	_x setDamage 0;
	removeAllWeapons _x;
		if (side _x == WEST) then {_x setPosATL (getmarkerPos "respawn_west")}
		else {if (side _x == EAST) then {_x setPosATL (getmarkerPos "respawn_east")};};
	};
	sleep 0.5;
}foreach playableUnits;
if (true) exitWith {missionDone = true;};












