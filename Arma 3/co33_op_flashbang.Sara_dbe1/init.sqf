[] call compile preprocessFileLineNumbers "Engima\Traffic\Init.sqf";
[] call compile preprocessFileLineNumbers "logtest.sqf";

WS_cas = {
    private ["_pos","_class","_type","_dir","_dummy"];

    _pos = getposATL (_this select 0);
    _dir = (_this select 1);
    _type = if (count _this > 2) then {(_this select 2)} else {0}; //  CAS run. 0: Guns only. 1: Rockets only. 2: Both.
    _class = if (count _this > 3) then {(_this select 3)} else {"B_Plane_CAS_01_F"};

    _dummy = "LaserTargetCBase" createVehicle _pos;
    _dummy enableSimulationGlobal false; _dummy hideObjectGlobal true;
    _dummy setVariable ["vehicle", _class, true];
    _dummy setVariable ["type", _type, true];
    _dummy setDir _dir;

    [_dummy,nil,true] spawn BIS_fnc_moduleCAS;
    [{deleteVehicle _this}, _dummy, 60] call ACE_common_fnc_waitAndExecute;
};

0 spawn {
  ["BEAR", "All units, this is Bear. We are leaving base, Bear out."] call CUL_say;
  sleep 12;
  ["PAPA LIMA", "All units from Papa Lima. En route to the shore. Papa Lima out"] call CUL_say;
};

{_x addBackpack "B_Parachute"} foreach units group this
