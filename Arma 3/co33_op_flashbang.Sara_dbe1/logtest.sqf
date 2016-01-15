
if (isServer) then {
  FP_sock_ID = (missionName + "_" + str (dateToNumber date) + "_" + str random 10000);

  FP_sock_log = {
    if (!params [["_args", "", [""]]]) exitWith {};
    diag_log format ["FPLOG: %1;; %2;; %3", FP_sock_ID, time, _args];
    //["log", [FP_sock_ID, time, _args]] call sock_rpc;
  };

  (format ["Starting mission: %1", missionName]) call FP_sock_log;
  [] spawn {
    waitUntil {time > 0};
    "Mission started" call FP_sock_log;
  };
  addMissionEventHandler ["Ended", {"Mission ended" call FP_sock_log}];

  ["FP_sock_connected", "onPlayerConnected", {
  	if (_name == "__SERVER__ ") exitWith {};
    (format ["%1 (%2) connected", _name, _uid]) call FP_sock_log;
  }] call BIS_fnc_addStackedEventHandler;

  ["FP_sock_disconnected", "onPlayerDisconnected", {
    if (_name == "__SERVER__ ") exitWith {};
    (format ["%1 (%2) disconnected", _name, _uid]) call FP_sock_log;
  }] call BIS_fnc_addStackedEventHandler;

  ["medical_onUnconscious", {
    params ["_unit", "_state"];
    if (!alive _unit || {!isPlayer _unit} || {!isNull (_unit getVariable ["bis_fnc_moduleRemoteControl_owner", objNull])}) exitWith {};
    private _pos = getPosATL _unit;
    _pos set [2, round (_pos select 2)];

    // Wait one second - should be enough for any "hit" messages to get through
    [{
      params ["_unit", "_pos"];
      (format ["%1 %2 at %3 (%4)", name _unit, if (_state) then {"fell unconcious"} else {"woke up"}, mapGridPosition _pos, _pos]) call FP_sock_log;
    }, [_unit, _pos], 1] call ACE_common_fnc_waitAndExecute;

  }] call ACE_common_fnc_addEventHandler;
};

if (hasInterface) then {
  [] spawn {
    waitUntil {!isNull player};

    FP_sock_getSide = {
      params ["_unit"];
      private _tr = ["B", "O", "I" , "C"];
      private _sides = [blufor,opfor,independent,civilian];
      private _side = side _unit;
      if (_side in _sides) exitWith {(_tr select (_sides find _side))};
      _side
    };

    FP_hit_throttle = [time, objNull];
    player addEventHandler ["HandleDamage", {
      params ["_unit", "_dmgedPart", "", "_shooter", "_proj"];
      if (!isPlayer _shooter) then {_unit setVariable ["fp_lasthit", nil]};

      if (!alive _unit ||
        {!isPlayer _shooter} ||
        {_unit getVariable ["ACE_isUnconscious", false]} ||
        {(time < (FP_hit_throttle select 0) && _shooter == (FP_hit_throttle select 1))}
      ) exitWith {nil};

      _unit setVariable ["fp_lasthit", [name _shooter, time, _proj]];

      FP_hit_throttle = [time + 1, _shooter];
      (format ["%1(%2) was hit by %3(%4).%5%6",
        name _unit,
        [_unit] call FP_sock_getSide,
        name _shooter,
        [_shooter] call FP_sock_getSide,
        ["", " Damaged part: " + _dmgedPart + "."] select (count _dmgedPart > 0),
        ["", " (Projectile: " + _proj + ")."] select (count _proj > 0)
      ]) remoteExecCall ["FP_sock_log", 2];

      nil

    }];

    player addEventHandler ["Fired", {
      if (_this select 2 != "HandGrenadeMuzzle") exitWith {};
      private _proj = param [6, objNull];
      if (isNull _proj) exitWith {};

      private _check = {
        params ["_proj", "_id"];
        if (speed _proj > 0.1) exitWith {};
        if (isNull _proj) exitWith {[_id] call CBA_fnc_removePerFrameHandler};

        private _pos = getPosATL _proj;
        private _near = [allPlayers, {alive _x && {_x distance _pos < 50}}] call ACE_common_fnc_filter;
        if (count _near > 0) then {
          private _pos = getPosATL _proj;
          private _names = [_near, {format ["%1 (%2m),", name _x, _x distance _proj]}] call ACE_common_fnc_map;
          (format ["%1 threw a grenade (%2) at %3(%4). %5 player(s) were within 50m (%6)",
            name player,
            typeOf _proj,
            mapGridPosition _pos,
            _pos,
            count _near,
            _names
          ]) remoteExecCall ["FP_sock_log", 2];
        };
        [_id] call CBA_fnc_removePerFrameHandler;
      };
      [_check, 0.1, _proj] call CBA_fnc_addPerFrameHandler;

    }];

    player addEventHandler ["Killed", {
      params ["_unit", "_killer"];
      private _posUnit = getPosATL _unit;
      _posUnit set [2, round (_posUnit select 2)];

      private _lasthit = _unit getVariable ["fp_lasthit", []];
      _unit setVariable ["fp_lasthit", nil];
      private _extra = "";
      if (count _lasthit > 0) then {
        _extra = format [" Last hit by %1, %2ms ago. (%3)", _lasthit select 0, time - (_lasthit select 1), _lasthit select 2];
      };

      if (_unit == _killer || {!isPlayer _killer}) exitWith {
        (format ["%1 died at %2(%3).%4",
          name _unit,
          mapGridPosition _posUnit,
          _posUnit,
          _extra
        ]) remoteExecCall ["FP_sock_log", 2];
      };

      private _posKiller = getPosATL _killer;
      _posKiller set [2, round (_posKiller select 2)];

      private _crew = [];
      if (!(_killer isKindOf "Man")) then {
        private _plrs = [fullCrew _killer, {isPlayer (_this select 0)}] call ACE_common_fnc_filter;
        _crew = [_plrs, {
          _x params ["_unit", "_role", "", "_turretPath"];
          (format ["%1 - %2(%3)", name _unit, _role, _turretPath])
        }] call ACE_common_fnc_map;
      };

      (format ["%1(%2) was killed at %3(%4) by %5(%6) (%7), from a distance of %8m (Shooter DIR: %9).%10",
        name _unit,
        [_unit] call FP_sock_getSide,
        mapGridPosition _posUnit,
        _posUnit,
        name _killer,
        [_killer] call FP_sock_getSide,
        _posKiller,
        round (_unit distance _killer),
        getDir (vehicle _killer),
        [
          " " + name _killer + "'s muzzle:" + str (currentMuzzle _killer),
          " NOTE: " + name _killer + " was in a vehicle! (" + typeOf (vehicle _killer) + "). Crew: " + str _crew
        ] select (!(_killer isKindOf "Man"))
      ]) remoteExecCall ["FP_sock_log", 2];

    }];
  };
};
