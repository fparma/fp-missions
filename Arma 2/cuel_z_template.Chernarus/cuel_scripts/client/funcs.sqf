"CLY_z_attackpv" addPublicVariableEventHandler {
	_var = _this select 1;
	(_var select 0) switchMove (_var select 1);
};

"CUEL_z_deathpv" addPublicVariableEventHandler {
	_var = _this select 1;
	_z = _var select 0;
	_s = _var select 1;
	_obj= "HeliHEmpty" createVehicleLocal [0,0,0]; _obj attachTo [_z,[0,0,1.5]];
	_obj say3D _s;
	_obj spawn {sleep 5;deleteVehicle _this};
};

CUEL_getAmmo = {
	private ["_mag"];
	_mag = getArray (configFile >> "CfgWeapons" >> _this >> "magazines") select 0;
	_mag
};

//originally by celery
zombieTextureUpdate = {
	{
	if (!isNil {_x getVariable "face"}) then 
		{
			if (typeName (_x getVariable "face" select 0)== "STRING") then 
			{
				_x setFace (_x getVariable "face" select 0);
				_x setMimic (_x getVariable "face" select 1);
				_x setVariable ["face",nil]
			};
		};
		sleep 0.01;
	} forEach allUnits;
};

findHouse = {
	private ["_buildings","_enterables","_house","_nr"];
	_buildings = nearestObjects [_this select 0, ["House"], _this select 1]; 
	_enterables = []; 
	{ 
		if (
			(format["%1", _x buildingPos 0] != "[0,0,0]") &&
			(alive _x) &&
			(!(typeOf _x in ILLEGAL_HOUSES))
		) then { 
			_enterables set [count _enterables, _x]; 
		}; 
	} forEach _buildings; 
	if ((count _enterables) < 2) exitWith {[]};
	_house = _enterables call BIS_fnc_selectRandom;
	_nr =[_house,0] call countPositions;
	if (_nr < 2) exitWith {[]};
	[_house,_nr]
}; 


countPositions = {
	private ["_i","_house","_hPos"]; 
    _house = _this select 0; 
    _i 	 = _this select 1; 
    
	_hPos	 = format["%1", _house buildingPos _i]; 
	if (_hPos == "[0,0,0]") exitWith {_i}; 
	[_house, _i+1] call countPositions; 
}; 

CUEL_spawnLoot = {
private ["_obj","_bpos","_house","_get"];
if (count _playerloots < 8) then {
		_get = [ player,150] call findHouse;
		if (count _get > 0) then {
			_house = _get select 0;
			if (!([_house,30] call CBA_fnc_nearPlayer)) then {
				_bpos = _house buildingPos floor(random(_get select 1));
				if (isNil {_house getVariable "c_has_loot"} && (_bpos select 2 < 5)) then {
					_obj =  createVehicle ["WeaponHolder",_bpos,[], 1, "CAN_COLLIDE"];
					_house setVariable ["c_has_loot",_obj,true];
					_playerloots set [count _playerloots,_house];
					_obj call spawn_loot;
					(group player) reveal [_obj,4];
				};		
			};
		};
	};
};


spawn_loot = {
	private ["_obj","_r"];
	_obj = _this;
	_r = round (random 100);
	switch (true) do {
		case (_r <= 10): {
			_wep = C_WEAPONS call BIS_fnc_selectRandom;
			_mag = _wep call CUEL_getAmmo;
			_obj addWeaponCargoGlobal [_wep,1];
			_obj addMagazineCargoGlobal [_mag,1+(ceil(random 3))];
			if (CLY_debug) then {_m= createMarker [format["loot_%1",_obj],getposatl _obj];_m setMarkerType "Dot"; _m setMarkerColor "ColorRed";_m setMarkerText "WEPAON"};
		};
		case (_r > 10 && _r <= 30): {
			_wep = C_PISTOLS call BIS_fnc_selectRandom;
			_mag = _wep call CUEL_getAmmo;
			_obj addWeaponCargoGlobal [_wep,1];
			_obj addMagazineCargoGlobal [_mag,1+(ceil(random 4))];
			if (CLY_debug) then {_m= createMarker [format["loot_%1",_obj],getposatl _obj];_m setMarkerType "Dot"; _m setMarkerColor "ColorRed";_m setMarkerText "PISTOLA"};
		};
		case (_r >= 30 && _r < 80): {
			_chance = 150;
			{_chance = round(_chance / 2.5); if (random 100 < _chance) then {_obj addMagazineCargoGlobal [C_MED select _x,1]};}count [0,1,2,3];
			if (CLY_debug) then {_m= createMarker [format["loot_%1",_obj],getposatl _obj];_m setMarkerType "Dot"; _m setMarkerColor "ColorRed";_m setMarkerText "MED"};
		};
				case (_r >= 80 && _r < 95): {
			_chance = 150;
			_obj addMagazineCargoGlobal [C_MAG call BIS_fnc_selectRandom,1 + (floor random 4)];
			if (CLY_debug) then {_m= createMarker [format["loot_%1",_obj],getposatl _obj];_m setMarkerType "Dot"; _m setMarkerColor "ColorRed";_m setMarkerText "AMMO"};
		};
		default{player sidechat "could not spawn loot."};
	};
};

CUEL_checkLoot = {
	_playerloots = _playerloots - [objNull];
	{
		_obj = _x getVariable "c_has_loot";
		if (isNil "_obj") exitWith {_playerloots = _playerloots - [_x]};
		if (isNull _obj) exitWith {_playerloots = _playerloots - [_x]};
		if (player distance _x > 200 && (!([_x,100] call CBA_fnc_nearPlayer))) then {
			deleteVehicle _obj; _playerloots = _playerloots - [_x];
		};		
	}forEach _playerloots;
	
};