/*
 * This file contains parameters to config and function call to start an instance of
 * traffic in the mission. The file is edited by the mission developer.
 *
 * See file Engima\Traffic\Documentation.txt for documentation and a full reference of
 * how to customize and use Engima's Traffic.
 */

 private ["_parameters"];

// Set traffic parameters.
_parameters = [
	["SIDE", civilian],
	["VEHICLES", ["C_Offroad_01_F", "RDS_Gaz24_Civ_03", "RDS_Gaz24_Civ_01", "RDS_Golf4_Civ_01", "RDS_S1203_Civ_01", "RDS_Octavia_Civ_01", "RDS_Lada_Civ_04", "RDS_Lada_Civ_02"]],
	["VEHICLES_COUNT", 5],
  ["AREA_MARKER", "drive"],
  ["HIDE_AREA_MARKER", true],
  ["ON_SPAWN_CALLBACK", {
    params ["_veh"];
    _veh allowCrewInImmobile true;
    if (random 1 > 0.4) then {_veh lock 3};
    private _driver = driver _veh;
    clearMagazineCargoGlobal _veh; clearWeaponCargoGlobal _veh; clearItemCargoGlobal _veh;
    [_driver, _veh] call FP_fnc_addToCurators;
    _driver setVariable ["ace_medical_preventInstaDeath", false];

    _driver addEventHandler ["Killed", {
      params ["", "_killer"];
      if (isPlayer _killer) then {
        (format ["%1 murdered an unarmed civilian", name _killer]) remoteExecCall ["systemChat", 0];
      };
    }];
  }],
	["MIN_SPAWN_DISTANCE", 900],
	["MAX_SPAWN_DISTANCE", 1300],
	["MIN_SKILL", 0],
	["MAX_SKILL", 0],
	["DEBUG", false]
];

// Start an instance of the traffic
_parameters spawn ENGIMA_TRAFFIC_StartTraffic;
