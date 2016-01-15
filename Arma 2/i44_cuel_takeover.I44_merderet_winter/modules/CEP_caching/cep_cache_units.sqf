//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: -eutf-Myke
// Vehicle driver caching and SL cache check added by Wolffy.au
// Activation method inspired by RMM_Reducer
//////////////////////////////////////////////////////////////////


private ["_cep_leader","_cep_grp","_cep_unitarray","_cep_typearray","_cep_cache_dist","_cep_type","_cep_weap","_cep_mags","_cep_bkp","_cep_bmg","_cep_bwp","_cep_rnk","_cep_pos","_cep_veh","_cep_vehpos","_tp","_cep_unit_init","_cep_unit_weap","_cep_unit_mags","_cep_unit_offset","_cep_unit_veh","_cep_unit_vehpos","_cep_unit_pos","_cep_myunit","_exit","_disable"];
if (!isServer) exitwith {};
private ["_cep_leader", "_cep_grp", "_cep_unitarray", "_cep_typearray", "_cep_cache_dist"];
_cep_leader = _this select 0;
_cep_cache_dist = _this select 1;

_cep_leader = leader _cep_leader;
_cep_grp = group _cep_leader;

_cep_unitarray = units _cep_leader - [_cep_leader];
_cep_typearray = [];

fClosestUnit = {
	private["_units", "_unit", "_dist", "_udist"];
	_units = _this select 0;
	_unit = _this select 1;
	_dist = 10^5;
	
	{
		_udist = _x distance _unit;
		if (_udist < _dist) then {_dist = _udist;};
	} forEach _units;
	_dist;
};

fTriggerUnits = {
	
private ["_trigUnits","_cep_leader"];
_cep_leader = _this select 0;
	_trigUnits = [];
	{
		if (side _x != civilian && side _cep_leader != civilian && side _x != side _cep_leader) then {
			_trigUnits = _trigUnits + [_x];
		};
	} forEach allUnits;
	_trigUnits = _trigUnits + [] call BIS_fnc_listPlayers;
	_trigUnits;
};

waitUntil{typeName allUnits == "ARRAY"};
waitUntil{typeName playableUnits == "ARRAY"};

_disable = _cep_grp getVariable "CEP_disableCache";
_disable = if(isNil "_disable") then { false; } else {_disable;};
_cep_grp setVariable ["CEP_disableCache", _disable];

_exit = false;
while {!_exit} do {	

	waitUntil{!(_cep_grp getVariable "CEP_disableCache") && [[_cep_leader] call fTriggerUnits, leader _cep_leader] call fClosestUnit > _cep_cache_dist + 15};
//hint "Out range";
		_cep_leader = leader _cep_grp;
		_cep_unitarray = (units _cep_leader) - [_cep_leader];
		{
			_cep_type = typeof _x;
			_cep_weap = weapons _x;
			_cep_mags = magazines _x;
			_cep_bkp = typeof (unitbackpack _x);
			_cep_bmg = getmagazinecargo (unitbackpack _x);
			_cep_bwp = getweaponcargo (unitbackpack _x);
			_cep_rnk = rank _x;
			_cep_pos = _cep_leader worldtomodel position _x;
			_cep_veh = assignedVehicle _x;
			_cep_vehpos = assignedVehicleRole _x;
			if (!("Driver" in _cep_vehpos)) then {
//player sideChat format["%1,%2", _x, _cep_vehpos];
				unassignVehicle _x;
//				doGetOut _x;
//				waitUntil{unitReady _x};
//player sideChat format["%1", [_cep_type, _cep_weap, _cep_mags, _cep_pos, _cep_veh, _cep_vehpos]];
				_cep_typearray = _cep_typearray + [[_cep_type, _cep_weap, _cep_mags, _cep_pos, _cep_veh, _cep_vehpos, _cep_bkp, _cep_bmg, _cep_bwp, _cep_rnk]];
				deletevehicle _x;
				_x = objNull;
			};
		} foreach _cep_unitarray;
		cep_unit_count = cep_unit_count + (count _cep_typearray);
		cep_tls = cep_tls + (count _cep_unitarray) + 1 - (count _cep_typearray);

//hint format["X: %1", [[_cep_leader] call fTriggerUnits, leader _cep_leader] call fClosestUnit];
	waitUntil{(([[_cep_leader] call fTriggerUnits, leader _cep_leader] call fClosestUnit < _cep_cache_dist)) || (_cep_grp getVariable "CEP_disableCache")};
//hint "In range";
		{
//player sideChat format["%1", _x];
			_cep_unit_init = _x select 0;
			_cep_unit_weap = _x select 1;
			_cep_unit_mags = _x select 2;
			_cep_unit_offset = _x select 3;
			_cep_unit_veh = _x select 4;
			_cep_unit_vehpos = _x select 5;
			_cep_bkp = _x select 6;
			_cep_bmg = _x select 7;
			_cep_bwp = _x select 8;
			_cep_rnk = _x select 9;
			_cep_unit_pos = _cep_leader modeltoworld _cep_unit_offset;
			_cep_myunit = (group _cep_leader) createUnit [_cep_unit_init, _cep_unit_pos, [], 0, "NONE"];
//player sideChat format["%1,%2", _cep_myunit, _cep_unit_vehpos];

			removeallweapons _cep_myunit;
			removeAllItems _cep_myunit;
			{
				_cep_myunit addmagazine _x;
			} foreach _cep_unit_mags;
			{
				_cep_myunit addweapon _x;
			} foreach _cep_unit_weap;

			if (_cep_bkp != "") then {
				_cep_myunit addbackpack _cep_bkp;
				clearweaponcargo (unitbackpack _cep_myunit);
				clearmagazinecargo (unitbackpack _cep_myunit);
			};

			for "_i" from 0 to ((count (_cep_bmg select 0))-1) do {
				(unitbackpack _cep_myunit) addmagazinecargo [(_cep_bmg select 0) select _i,(_cep_bmg select 1) select _i];
			};

			for "_i" from 0 to ((count (_cep_bwp select 0))-1) do {
				(unitbackpack _cep_myunit) addweaponcargo [(_cep_bwp select 0) select _i,(_cep_bwp select 1) select _i];
			};

			_cep_myunit setunitrank _cep_rnk;
			if (count _cep_unit_vehpos != 0) then {
				switch(_cep_unit_vehpos select 0) do {
					case "Driver": {
						_cep_myunit moveInDriver _cep_unit_veh;
						_cep_myunit assignAsDriver _cep_unit_veh;
					};
					case "Cargo": {
						_cep_myunit moveInCargo _cep_unit_veh;
						_cep_myunit assignAsCargo _cep_unit_veh;
					};
					case "Turret": {
						_tp = _cep_unit_vehpos select 1;
						_cep_myunit moveInTurret [_cep_unit_veh, _tp];
						_cep_myunit assignAsGunner _cep_unit_veh;
					};
				};
			};
		} foreach _cep_typearray;
		cep_unit_count = cep_unit_count - (count _cep_typearray);
		cep_tls = cep_tls - ((count _cep_unitarray) + 1 - (count _cep_typearray));
		_cep_typearray = [];
		if((_cep_grp getVariable "CEP_disableCache")) then {		
			cep_cached_grps = cep_cached_grps - [_cep_grp];
			_exit = true;
		};
};

true;
