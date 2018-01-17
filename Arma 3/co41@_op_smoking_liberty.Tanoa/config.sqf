FP_VD = 2000; // Regular view distance
FP_OVD = 1800; // Regular object view distance
FP_VD_AIR = 5000; // View distance when piloting or gunning air vehicles
FP_OVD_AIR = 4500;  // Object view distance when piloting or gunning air vehicles

// The amount of allowed respawns
// if -1 = infinite respawn. 0 = zero respawn. can be higher
FP_JRM_respawns = -1;


fp_xian = {
	params ["_veh"];
	if (!local _veh) exitWith {};
	_veh call fp_fnc_clearVehicle;
	_veh addBackpackCargoGlobal ["B_Parachute", 18];
	_veh addMagazineCargoGlobal ["150Rnd_762x54_Box_Tracer", 10];
	_veh addMagazineCargoGlobal ["100Rnd_580x42_Mag_Tracer_F", 10];

	_veh addMagazineCargoGlobal ["30Rnd_580x42_Mag_F", 20];
	_veh addMagazineCargoGlobal ["30Rnd_580x42_Mag_Tracer_F", 10];
	_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_green", 20];
	
	_veh addMagazineCargoGlobal ["RPG32_F", 2];
	_veh addMagazineCargoGlobal ["RPG32_HE_F", 2];
	
	_veh addItemCargoGlobal ["Item_ToolKit", 4];
};

fp_nomove = {
	params [["_obj", objNull]];
	if (!alive _obj) exitWith {};
	{_x disableAI "PATH"} forEach units group _obj;
	(leader (group _obj)) addEventHandler ["Local", {
		params ["_obj", "_loc"];
		if (_loc) then {
			{_x disableAI "PATH"} foreach units group _obj;
		};
	}];
};

fp_veh = {
	params [["_obj", objNull]];
	if (!local _obj) exitWith {};
	[_obj] call fp_fnc_clearVehicle;
	_obj allowCrewInImmobile true;
};