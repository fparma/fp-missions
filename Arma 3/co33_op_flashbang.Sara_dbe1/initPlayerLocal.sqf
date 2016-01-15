/*
	Executed locally when player joins mission (includes both mission start and JIP).
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.

	Parameters:
		0 - Player object
		1- Did player JiP
*/

params ["_player", "_isJip"];

if (isNil "grpCam") then {grpCam = grpNull};
[] call compile preProcessFileLineNumbers "base\initPlayer.sqf";
[] call compile preProcessFileLineNumbers "briefing.sqf";

if (str player != "gm") then {
 disableRemoteSensors true;
};

// Add JIP players to zeus
if (_isJip) then {[_player] remoteExecCall ["FP_fnc_addToCurators", 2]};

// Add teleport options to flag. See config.sqf
if (!isNil "fp_flag" && {count FP_flagTargets > 0}) then {
	[fp_flag, FP_flagTargets] call compile preProcessFileLineNumbers "base\scripts\teleport_flag.sqf"
};

// Debug script for development. Create a unit named "debugger" and use him as player.
if (str player in ["debugger"]) then {
	[] call compile preProcessFileLineNumbers "base\scripts\debug_man.sqf";
};

// FIX damage for players
player setVariable ["ACE_medical_unitDamageThreshold", [2, 14, 0.5]];

"colorCorrections" ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [0.6, 1.4, 0.6, 0.7],  [0.199, 0.587, 0.114, 0.0]];
"colorCorrections" ppEffectCommit 0;
"colorCorrections" ppEffectEnable true;

if (str player == "gm") then {

  FP_JRM_lives = 99;

  CUL_say = {
    params ["_speaker", "_msg"];
    private _units = ["actual, a0, b0, c0, d0, apc_a, apc_b, apc_c", false, true] call ACE_common_fnc_parseList;
    [_units, ["fp_msg1", "fp_msg2"] call BIS_fnc_selectRandom] call CBA_fnc_globalSay;
    [_speaker, _msg] spawn {
      params ["_speaker", "_msg"];
      sleep 1;
      (format ['%1: "%2"', _speaker, _msg]) remoteExecCall ["systemChat", 0];
    };
  };

  player addAction ["<t color='#ff8a00'>\\ Send CAS //</t>", {
    player removeAction (_this select 2);
    [] spawn {
      bis_fnc_curatorSayMessage_time = time + 30;
      ["ZULU", "All units, be advised. Danger close, CAS run on Corazol. Zulu out"] call CUL_say;

      sleep 10;
      [cas2, 216.567, 0] remoteExec ["WS_cas", 2];
      sleep 2;
      [cas1, 206.75, 0]  remoteExec ["WS_cas", 2];
      sleep 2;
      [cas3, 223.335, 0]  remoteExec ["WS_cas", 2];
      sleep 4;
      [cas4, 200.617, 0]  remoteExec ["WS_cas", 2];

      sleep 5;
      _planes = [vehicles, {typeof _x == "B_Plane_CAS_01_F"}] call ACE_common_fnc_filter;
      [_planes, {{_x addEventHandler ["Fired", {
        [_this select 6] call ace_frag_fnc_addBlackList;
      }];} forEach _this}] remoteExec ["BIS_fnc_spawn", 2];

    };
  }, 0, -99, false, true, "", ""];

  player addAction ["<t color='#ff8a00'>\\ Make combat cam blufor //</t>", {
    player removeAction (_this select 2);
    private _guys = units grpCam;
    "SUO Forces considers you hostile" remoteExecCall ["hint", _guys];
    private _w = createGroup blufor;
    private _lead = "B_officer_F" createUnit [[0,0,0], _w, "", 0, "COLONEL"];
    _guys joinSilent _w;

    {
      private _u = _x;
      {_x reveal [_u, 4]} forEach allGroups;
    } forEach units _w;
    deleteVehicle (leader _w);
  }, 0, -100, false, true, "", ""];

};

if (str player == "combatcam1") then {
  player addAction ["<t color='#ff8a00'>\\ BIS Cam //</t>", {
    ["Init"] spawn BIS_fnc_camera;
  }, 0, -99, false, true, "", ""];

  waituntil {!isnull (finddisplay 46)};
  (findDisplay 46) displayAddEventHandler ["keyUp","_this call CU_toggleHud"];
  CU_shownHud = true;
  CU_toggleHud = {
    params ["", "_dikCode", "", "_ctrl"];
    if (_ctrl && _dikCode ==  48) then {
      if (CU_shownHud) then {
        showHUD [false, false, false, false, false, false, false, false];
      }else{
        showHUD [true, true, true, true, true, true, true, true];
      };
      CU_shownHud = !CU_shownHud;
      true
    };
  };
};

[laptop, "
INTERCEPTED TRANSMISSION:::<br/>
' Haha yeah, heard about that guy [...] also, send a group over to GRID 137 089 to help set up the mortar. We will have it up and running in no time, it will be a great addition to our struggle.'
<br/>::: END
", 60, {}] execVM "xtra\scripts\intel_laptop.sqf";

[{
  [
    [
      ["OPERATION FLASHBANG"],
      ["NORTHERN SAHRANI"],
      ["0200hrs", "<t align = 'center' shadow = '1' size = '0.7' font='puristaMedium'>%1</t>", 70]
    ], 1, 0.75, "<t align = 'center' shadow = '1' size = '1.0'>%1</t>"
  ] spawn BIS_fnc_typeText;
}, [], 10] call ACE_common_fnc_waitAndExecute;
