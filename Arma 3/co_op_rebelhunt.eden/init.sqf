/*
	Runs for everyone
  !!! This script does not guarantee that 'player' is defined, initPlayerLocal does
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.
*/

enableSaving [false,false];
enableCamShake true;
setViewDistance FP_VD;
setObjectViewDistance FP_OVD;
setTerrainGrid 25;


fp_lavLoadout = {
	params ["_veh"];
	_veh call fp_fnc_clearVehicle;
	["ACE_Wheel", _veh] call ace_cargo_fnc_loadItem;
	["ACE_Wheel", _veh] call ace_cargo_fnc_loadItem;
	["ACE_Wheel", _veh] call ace_cargo_fnc_loadItem;
	_veh addMagazineCargoGlobal ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249", 6];
	_veh addMagazineCargoGlobal ["hlc_30rnd_556x45_b_HK33", 6];
	_veh addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 16];
};

fp_truckLoadout = {
	params ["_veh"];
	_veh call fp_fnc_clearVehicle;
	["ACE_MedicalSupplyCrate", _veh] call ace_cargo_fnc_loadItem;
	while {["ACE_Wheel", _veh] call ace_cargo_fnc_canLoadItemIn} do {
		["ACE_Wheel", _veh] call ace_cargo_fnc_loadItem;
	};
	_veh addMagazineCargoGlobal ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249", 10];
	_veh addMagazineCargoGlobal ["hlc_30rnd_556x45_b_HK33", 10];
	_veh addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 30];
	_veh addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 20];
	_veh addMagazineCargoGlobal ["SmokeShell", 6];
	_veh addMagazineCargoGlobal ["SmokeShellGreen", 6];
	_veh addMagazineCargoGlobal ["HandGrenade", 6];
	_veh addWeaponCargoGlobal ["CUP_launch_M136", 2];
	_veh addItemCargoGlobal ["ToolKit", 10];
};

fp_guerBox = {
	params ["_veh"];
	_veh call fp_fnc_clearVehicle;
	_veh addMagazineCargoGlobal ["CUP_5x_22_LR_17_HMR_M", 3 + round random 10];
	_veh addMagazineCargoGlobal ["CUP_10x_303_M", 3 + round random 20];
	_veh addMagazineCargoGlobal ["CUP_30Rnd_545x39_AK_M", 3 + round random 15];
};

fp_civs = {
	params ["_unit"];
	if (side group _unit == civilian && !isPlayer _unit) then {
		_unit setUnitPos "UP";
		_unit addEventHandler ["Killed", {
			params ["_unit", "_killer"];
			if (side group _killer == blufor && isPlayer _killer) then {
				format ["%1 MURDERED an unarmed civilian", name _killer] remoteExecCall ["systemChat"];
			};
		}];
	};
};