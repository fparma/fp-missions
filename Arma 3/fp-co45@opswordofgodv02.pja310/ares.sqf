
["FP", "Spawn guerilla", {
	_pos = [_this, 0, [], [[]]] call BIS_fnc_param;
	_dialogResult =
	[
		"Spawn guerilla group",
		[
			["Amout in group", ["2", "4", "8"]],
			["Type", ["Only spawn","Patrol area", "Garrison (radius)"]],
			["Radius", ["50m", "100m", "150m"]]
		]
	] call Ares_fnc_ShowChooseDialog;

	_amount = [2,4,8] select (_dialogResult select 0); 
	_type = ["spawn", "patrol", "garrison"] select (_dialogResult select 1);
	_radius = [50, 100, 150] select (_dialogResult select 2);

	private ["_grp"];
	switch _type do {
		case "patrol": {
			_mrk = ["mrk_" + str(random 1000), _pos, "ELLIPSE", [_radius, _radius]] call CBA_fnc_createMarker;
			_mrk setMarkerAlphaLocal 0.3;
			_grp = ["CSAT", _pos, _mrk, _amount] call FP_fnc_spawnPatrol;
		};

		case "garrison": {
			_grp = ["CSAT", _pos, _amount, _radius] call FP_fnc_spawnGarrison;
		};

		default {
			_grp = ["CSAT", _pos, _amount] call FP_fnc_spawnGroup;	
		};
	};
	if (typeName _grp == typeName grpNull) then {
		[_grp] execVM "src\spawn\loadouts\guer.sqf";
	}else{
		_last = grpNull;
		_g = grpNull;
		{
			_g  = group _x;
			if (_g != _last) then {
				[_g] execVM "src\spawn\loadouts\guer.sqf";
			};
		}foreach _grp;
	};
	

}] call Ares_fnc_RegisterCustomModule;


["FP", "Spawn guerilla vehicle", {
	_pos = [_this, 0, [], [[]]] call BIS_fnc_param;
	_dialogResult =
	[
		"Spawn guerilla vehicle",
		[
			["Type", ["Armed offroad","BMP 1", "T-72"]],
			["Action", ["Spawn only", "Patrol"]],
			["Patrol radius", ["50m", "100m", "150m", "200m", "300m", "500m"]]
		]
	] call Ares_fnc_ShowChooseDialog;

	_vehType = ["O_G_Offroad_01_armed_F", "rhs_bmp1_tv", "rhs_t72ba_tv"] select (_dialogResult select 0); 
	_action = ["spawn", "patrol"] select (_dialogResult select 1);
	_radius = [50, 100, 150, 200, 300, 500] select (_dialogResult select 2);

	private ["_veh"];
	switch _action do {
		case "spawn": {
			_veh = [_vehType, _pos] call FP_fnc_spawnVehicle; 
		};
		case "patrol": {
			_mrk = ["mrk_" + str(random 1000), _pos, "ELLIPSE", [_radius, _radius]] call CBA_fnc_createMarker;
			_mrk setMarkerAlphaLocal 0.3;
			_veh = [_vehType, _pos, _mrk] call FP_fnc_spawnVehicle; 
		};
	};
	[group driver _veh] execVM "src\spawn\loadouts\guer.sqf";

}] call Ares_fnc_RegisterCustomModule;

["FP", "Make civ suicide bomber", {
	_unit = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
	if (isNull _unit) exitWith {};
	[_unit] execVM "fp_scripts\ied\bomber_man.sqf";
}] call Ares_fnc_RegisterCustomModule;

["FP", "Create IED", {
	_pos = [_this, 0, [], [[]]] call BIS_fnc_param;
	_veh = createVehicle [["Land_bags_EP1","Land_Crates_stack_EP1","Land_Misc_Garb_Heap_EP1","Fort_Crate_wood"] call BIS_fnc_selectRandom, _pos, [], 0, "CAN_COLLIDE"];
	_veh addEventHandler ["Hit", {
		_veh = _this select 0;
		_veh setVariable ["fp_hits", 1 + (_veh getVariable ["fp_hits", 0])];
		if (alive _veh && _veh getVariable ["fp_hits", 0] > 2) then {
			_pos = getPosATL _veh;
			deleteVehicle _veh;
			_bomb = "M_Titan_AT" createVehicle[_pos select 0, _pos select 1, (_pos select 2)+0.1];
			_crater = createVehicle ["CraterLong_small", _pos, [], 0, "NONE"];
			_crater spawn {
				sleep 300;
				deleteVehicle _this;
			};
		};
	}];
	
	[_veh, "FP_fnc_addCuratorObject", false] call BIS_fnc_MP;
	_trig = ([getPosATL _veh, "AREA:", [5, 5, 0, true], "ACT:", ["ANY", "PRESENT", false], "STATE:", ["{isPlayer _x} count thisList > 0", "[(thisTrigger getVariable ['fp_ied',objNull])] execVM 'fp_scripts\ied\ied.sqf' ",""]] call CBA_fnc_createTrigger) select 0;
	_trig attachTo [_veh, [0,0,0]];
	_trig setVariable ["fp_ied", _veh];

}] call Ares_fnc_RegisterCustomModule;