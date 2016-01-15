/*
	Params
	_unit - Object or Group ,  BM-21s
	_pos - Position to fire on
	_rounds - Amount of rounds per unit
	_spread - Spread for each missile. Note that spread might increase automatically with distance
	_delay - delay between each missile
*/

_grads = [_this, 0, objNull, [objNull, grpNull, []]] call BIS_fnc_param;
_pos = ([_this, 1, [0,0,0]] call BIS_fnc_param) call CBA_fnc_getPos;
_rounds = [_this, 2, 1, [0]] call BIS_fnc_param;
_spread = [_this, 3, 0, [10]] call BIS_fnc_param;
_delay = [_this, 4, 1, [0.5]] call BIS_fnc_param;
if (_delay < 0.5) then {_delay = 0.5};

//if (!local _unit) exitWith {["grad.sqf not executed where unit is local"] call BIS_fnc_error};
if ([_pos select 0, _pos select 1] isEqualTo [0,0]) exitWith {["incorrect position for grad"] call BIS_fnc_error};

for "_i" from 0 to (count _grads)-1 do {
	sleep _delay;
	[_grads select _i, _pos, _rounds, _spread, _delay] spawn {
		_unit = vehicle (_this select 0);
		_pos = _this select 1;
		_rounds = _this select 2;
		_spread = _this select 3;
		_delay = _this select 4;

		_dir = [_pos, _unit] call bis_fnc_dirTo;
		_hUnit = getTerrainHeightASL (getpos _unit);
		_hTarget = getTerrainHeightASL _pos;

		// we will change the target site depending on the hight difference between the art and the position
		// this will make the shots very accurate. no idea why.
		// if pos is higher than art, move the target away, otherwise closer
		if (_hTarget > _hUnit) then {
			_dir = _dir + 180;
		};

		_zDiff = abs(_hUnit - _hTarget);
		_oldpos = _pos;
		 _pos = [_oldpos, _zDiff, _dir] call BIS_fnc_relPos;

		// 2d distance
		_dx = (((getPosASL _unit) select 0) - (_pos select 0));
		_dy = (((getPosASL _unit) select 1) - (_pos select 1));
		_distance = sqrt((_dx*_dx)+(_dy*_dy));

		if (_distance < 100 || _distance > 20000) exitWith {["Too short or long distance"] call BIS_fnc_error};

		_charge = _distance call {
			private "_dist";
			_dist = _this;
			if (_dist < 1100) exitWith{"Close"}; // 1100, 1402
			if (_dist < 1500) exitWith{"M1"}; // 1500 ,1825
			if (_dist < 2000) exitWith{"M1A"}; // 2000, 2348
			if (_dist < 2600) exitWith{"M2"}; // 2600, 3030
			if (_dist < 3400) exitWith{"M3"}; // 3400, 3803
			if (_dist < 4600) exitWith{"M4"}; // 4600, 4962
			if (_dist < 5900) exitWith{"M5"}; // 5900, 6289
			if (_dist < 7400) exitWith{"M6"}; // 7400, 7768
			if (_dist < 9000) exitWith{"M7"}; // 9000, 9397
			if (_dist < 11200) exitWith{"M8"}; // 11200, 11652
			if (_dist < 13200) exitWith{"M9"}; // 13200, 13639
			if (_dist < 16500) exitWith{"M10"}; // 16500, 16891
			if (_dist < 20000) exitWith{"M11"}; // 20000, 20507
		};

		_ammo = "RHS_mag_40Rnd_122mm_rockets";
		_weapon = (weapons (vehicle _unit) select 0);

		_ammoSpeed = getNumber(configfile >> "CfgMagazines" >> _ammo >> "initSpeed");
		_v = _ammoSpeed * getNumber(configfile >> "CfgWeapons" >> _weapon >> _charge >> "artilleryCharge");

		//_alt = abs (getTerrainHeightASL _pos - getTerrainHeightASL (position _unit));
		_alt = 0;
		_g = 9.81;

		if (_v^4-_g*(_g*_distance^2+2*_alt*_v^2) < 0) exitWith {["Impssible shot for grad!"] call BIS_fnc_error};

		//_highAngle = atan((_v^2+sqrt(_v^4-_g*(_g*_distance^2+2*_alt*_v^2)))/(_g*_distance));
		_lowAngle = atan((_v^2-sqrt(_v^4-_g*(_g*_distance^2+2*_alt*_v^2)))/(_g*_distance));
		_z = _distance * (tan _lowAngle);

		//_unit setVehicleAmmo 1;
		_unit setFuel 1;
		_gunner = gunner _unit;
		_gunner disableAI "TARGET";
		_gunner disableAI "AUTOTARGET";
		_gunner setSkill ["aimingSpeed",0];

		for "_i" from 1 to _rounds do {
			_randPos = [_pos, _spread] call CBA_fnc_randPos;
			_randPos set [2, _z];

			//_mrk = createMarker [str random 1000, _randPos];
			//_mrk setMarkerBrush "ICON";
			//_mrk setMarkerType "mil_DOT";

			_pos set [2, _z];
			_gunner doWatch _randPos;
			if (_i == 1) then {
				sleep 4;
				_gunner doWatch _randPos;
				sleep 1;
			}else{
				sleep (_delay)-0.1;
			};
			_gunner doWatch _randPos;
			sleep 0.1;
			_unit fire [_weapon, _charge];
		};
	};
};
