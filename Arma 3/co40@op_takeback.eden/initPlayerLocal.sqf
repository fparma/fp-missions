/*
	Executed locally when player joins mission (includes both mission start and JIP).
  This script guarantees that player object exists. Init.sqf does not
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.
*/

// These below scripts are RECOMMENDED but not enabled by default
// Remove the comments and change the needed strings to fit your mission (match the object names)

/*
// Cold start
[
  "gm0, gm1, plt0", // units who can start the mission. are automatically added to "can move"
  "plt1, a0, a1, a2, b0, b1, b2, e0, q0, q1, q2, w0, w1, l0, l1" // units who can move freely
] call compile preprocessFileLineNumbers "scripts\cold_start.sqf";
*/
// Teleport flag, first is the object to addaction to, second format is ["display name", "objectName"]
[fp_flag, [
  ["Plt Command", "plt0"],
  ["Alpha", "a0"],
  ["Bravo", "b0"],
  ["Delta", "d0"]
]] execVM "scripts\teleport_flag.sqf";


[] call compile preprocessFileLineNumbers "briefing.sqf";

// Apply loadouts
if (!isNil "FP_fnc_getLoadout") then {
  private _added = [player, typeOf player] call FP_fnc_getLoadout;

  // Respawn with gear
  if (_added) then {
    player addEventHandler ["Respawn", {
      [player, typeOf player] call FP_fnc_getLoadout;
    }];
  };

  // Loadouts in singleplayer / editor
  if (!isMultiplayer) then {
    {
      [_x, typeOf _x] call FP_fnc_getLoadout;
    } forEach (switchableUnits - (entities "HeadlessClient_F" + [player]));
  };
};

CHBN_adjustBrightness = 8;
CHBN_adjustColor = [0.5,0.7,1];

CHBN_light = "#lightpoint" createVehicleLocal [0,0,0];
CHBN_light setLightBrightness 1;
CHBN_light setLightDayLight false;
CHBN_light setLightAttenuation [10e10,(30000 / (CHBN_adjustBrightness max 10e-10)),4.31918e-005,4.31918e-005];
CHBN_light setLightAmbient CHBN_adjustColor;

if ((groupId group player) == "delta") then {
  if (time < 60) then {
    [{time > 0.5}, {
      player playMoveNow "amovpknlmstpslowwrfldnon";
    }] call CBA_fnc_waitUntilAndExecute;
  } else {
    _rnd = selectRandom (units group player);
    if (vehicle _rnd != _rnd) then {
      player moveInAny (vehicle _rnd);
    } else {
      player setposatl (getposatl _rnd);
    };
  };
};

/*
if (!isNil "Ares_fnc_RegisterCustomModule") then {
  ["FP - Utils", "TP To LHD", {
    params ["", "_obj"];
    if (isNull _obj) exitWith {};
    _posm = getMarkerPos "respawn_west";
    _obj setPosASL [_posm select 0, _posm select 1, 17];
  }] call Ares_fnc_RegisterCustomModule;
};
*/
