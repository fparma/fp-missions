/*
	General FP init. Should not be edited
*/

CUL_fixDamage = {
  params ["_unit"];
  if (!local _unit || {faction _unit != "FP_Faction_FEC"}) exitWith {};
  _unit setVariable ["ACE_medical_unitDamageThreshold", [1, 13, 0.2]]
};

CUL_switchCrew = {
  params ["_veh"];
  if (!local _veh || {!(side _veh in [opfor, independent])}) exitWith {};
  private _crew = crew _veh;
  private _amount = count _crew;
  private _slots = [];
  {_slots pushBack (assignedVehicleRole _x)} forEach _crew;
  {deleteVehicle  _x} forEach _crew;

  private _newCrew = [];
  private _grp = createGroup independent;
  for "_i" from 1 to _amount do {
    _newCrew pushBack (_grp createUnit ["FP_Faction_FEC_Rifleman", [0,0,0], [], 0, "FORM"]);
  };

  _grp addVehicle _veh;
  {
    _x params ["_slot", "_path"];
    private _unit = _newCrew select  _forEachIndex;

    switch (toLower _slot) do {
      case "driver": {_unit moveInDriver _veh};
      case "turret": {_unit moveInTurret [_veh, _path]};
      case "cargo": {_unit moveInCargo _veh;}
    };
  } forEach _slots;

  (units _grp) remoteExecCall ["FP_fnc_addToCurators", 2];
};

[] call compile preprocessFileLineNumbers "config.sqf";

enableSaving [false,false];
enableCamShake true;
setViewDistance FP_VD;
setObjectViewDistance FP_OVD;
setTerrainGrid 25;

// Clients
if (hasInterface) then {

	// Hide all UPS markers with correct name, e.g: "area0", "area1", "area_0", "area_1"
	for "_i" from 0 to 50 do {
		(format ["area%1",_i]) setMarkerAlphaLocal 0;
		(format ["area_%1",_i]) setMarkerAlphaLocal 0;
	};

};
