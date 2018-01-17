/*
    Executed only by server
    See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
        for details about when the script is exactly executed.
*/

// Track casualties for each side and show on mission end
// Must be used in combination with fpa_common_fnc_endMissionServer
[] call fpa_common_fnc_trackKills;
[] call compile preprocessFileLineNumbers "fob.sqf";

["fpb_fobCreated", {
	missionNamespace setVariable ["fp_fob", true, true];
}] call CBA_fnc_addEventHandler;

["fpb_fobRemoved", {
		missionNamespace setVariable ["fp_fob", false, true];
}] call CBA_fnc_addEventHandler;

["B_Truck_01_box_F", "init", {
	params ["_veh"];
	private _box = "BOX_Nato_Equip_F" createVehicle (getPos _veh);
	{
		clearMagazineCargoGlobal _x;
		clearWeaponCargoGlobal _x;
		clearItemCargoGlobal _x;
	} forEach [_veh, _box];

	_box addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", 10];
	_box addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 50];
	_box addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 30];
	_box addMagazineCargoGlobal ["Titan_AT", 8];
	_box addMagazineCargoGlobal ["Titan_AP", 4];
	_box addMagazineCargoGlobal ["20Rnd_762x51_Mag", 10];
	_box addItemCargoGlobal ["ToolKit", 4];
	
	_box addMagazineCargoGlobal ["3Rnd_SmokeRed_Grenade_shell", 4];
	_box addMagazineCargoGlobal ["3Rnd_SmokeYellow_Grenade_shell", 4];
	_box addMagazineCargoGlobal ["ACE_HuntIR_M203", 4];
	_box addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", 4];
	_box addWeaponCargoGlobal ["launch_NLAW_F", 2];
	_box addBackpackCargoGlobal ["B_UAV_01_backpack_F", 2];

	[_veh, 20] call ace_cargo_fnc_setSpace;
	[_box, _veh] call ace_cargo_fnc_loadItem;
	["ace_medicalSupplyCrate", _veh] call ace_cargo_fnc_loadItem;
	{["ACE_Wheel", _veh] call ace_cargo_fnc_loadItem} count [0,1];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["B_APC_Wheeled_01_Cannon_F", "init", {
	params ["_veh"];
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;

	_veh addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", 4];
	_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 20];
	_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 10];
	_veh addItemCargoGlobal ["ACE_fieldDressing", 20];
	_veh addItemCargoGlobal ["ACE_morphine", 8];
	_veh addItemCargoGlobal ["ACE_epinephrine", 8];
	_veh addItemCargoGlobal ["ToolKit", 1];
	{["ACE_Wheel", _veh] call ace_cargo_fnc_loadItem} count [0,1,2];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["B_MRAP_01_hmg_F", "init", {
	params ["_veh"];
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;

	_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 20];
	_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 10];
	_veh addItemCargoGlobal ["ACE_fieldDressing", 10];
	_veh addItemCargoGlobal ["ACE_morphine", 4];
	_veh addItemCargoGlobal ["ACE_epinephrine", 4];
	_veh addItemCargoGlobal ["ToolKit", 1];	
}, true, [], true] call CBA_fnc_addClassEventHandler;

["B_MRAP_01_F", "init", {
	params ["_veh"];
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;

	if (_veh getVariable ["fpa_delta", false]) then {
		_veh addMagazineCargoGlobal ["130Rnd_338_Mag", 6];
		_veh addMagazineCargoGlobal ["Titan_AT", 2];
		_veh addMagazineCargoGlobal ["Titan_AP", 2];
		_veh addMagazineCargoGlobal ["20Rnd_762x51_Mag", 10];
	};

	_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 20];
	_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 10];
	_veh addItemCargoGlobal ["ACE_fieldDressing", 10];
	_veh addItemCargoGlobal ["ACE_morphine", 4];
	_veh addItemCargoGlobal ["ACE_epinephrine", 4];
	_veh addItemCargoGlobal ["ToolKit", 1];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["B_Truck_01_Transport_F", "init", {
	params ["_veh"];
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;

	_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 20];
	_veh addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 10];
	_veh addItemCargoGlobal ["ACE_fieldDressing", 10];
	_veh addItemCargoGlobal ["ACE_morphine", 4];
	_veh addItemCargoGlobal ["ACE_epinephrine", 4];
	_veh addItemCargoGlobal ["ToolKit", 1];
	{["ACE_Wheel", _veh] call ace_cargo_fnc_loadItem} count [0,1,2];
}, true, [], true] call CBA_fnc_addClassEventHandler;