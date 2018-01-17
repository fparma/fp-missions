/*
	Runs for everyone
  !!! This script does not guarantee that 'player' is defined, initPlayerLocal does
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.
*/

[0.6] call acre_api_fnc_setLossModelScale;
[false] call acre_api_fnc_setFullDuplex;
[false] call acre_api_fnc_setInterference;
[true] call acre_api_fnc_setRevealToAI;

enableSaving [false,false];
enableCamShake true;
setViewDistance FP_VD;
setObjectViewDistance FP_OVD;
setTerrainGrid 25;

FP_spawnChute = {
  params ["_veh", "_pos", "_obj"];
  private _chute = createVehicle ["B_Parachute_02_F", [100, 100, 200], [], 0, 'FLY'];
  _chute setPos [_pos select 0, _pos select 1, (_pos select 2) - 50];
  _obj attachTo [_chute, [0, 0, -1.3]];
  (createVehicle ["Chemlight_blue", _pos, [], 0, 'NONE']) attachTo [_chute, [0, 0, 0]];

  waitUntil {sleep 0.5; (getPosATL _obj select 2) < 1 || isNull _chute};
  detach _obj;
  _pos = getPosATL _obj;
  _obj setPosATL [_pos select 0, _pos select 1, 0.1];
  "SmokeShellPurple" createVehicle [_pos select 0, _pos select 1, (_pos select 2) + 1.5];
};

FP_attachRopeEH = {
  params ["_veh"];
  if (!(_veh isKindOf "Helicopter")) exitWith {};
  _veh addEventHandler ["RopeBreak", {
    params ["_veh", "", "_obj"];
    if (!local _veh) exitWith {};
    _pos = getPosATL _veh;
    if ((_pos select 2) < 50 ||
      {_obj getVariable ["fp_hasChute", false]} ||
      {getMass _obj > 1200}) exitWith {};

    _obj setVariable ["fp_hasChute", true];
    [_veh, _pos, _obj] spawn FP_spawnChute;
  }];
};

FP_sortTracers = {
  params ["_searchTerm", "_magazines"];
  private _found = [];
  private _rest = [];
  {
    if ([_searchTerm, _x] call BIS_fnc_inString) then {
      _found pushBack _x;
    } else {
      _rest pushBack _x
    };
  } forEach _magazines;

  (_found + _rest)
};

FP_useTracers = {
  params ["_unit"];
  if (isPlayer _unit || {!(local _unit)} || {side _unit == blufor}) exitWith {};

  private _continue = random 1 > 0.2;
  private _rifle = primaryWeapon _unit;
  if (!_continue || _rifle == "") exitWith {};

  private _magazines = getArray (configFile >> "CfgWeapons" >> _rifle >> "magazines") apply {toLower _x};
  private _tracers = _magazines select {getNumber (configFile >> "CfgMagazines" >> _x >> "tracersEvery") >= 1};

  if (count _tracers == 0) exitWith {};
  private _tracer = (["green", _tracers] call FP_sortTracers) select 0;

  [{
    params ["_unit", "_magazines", "_tracer", "_rifle"];
    _unit removeWeapon _rifle;
    {
      if ((toLower _x) in _magazines) then {
        _unit removeMagazine _x;
      };
    } forEach magazines _unit;

    _unit addMagazines [_tracer, 8];
    _unit addWeapon _rifle;
    _unit selectWeapon _rifle;
  }, [_unit, _magazines, _tracer, _rifle]] call CBA_fnc_execNextFrame;
};
