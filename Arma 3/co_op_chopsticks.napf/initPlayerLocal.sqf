/*
	Executed locally when player joins mission (includes both mission start and JIP).
  	This script guarantees that player object exists. Init.sqf does not
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.
*/

[] call compile preprocessFileLineNumbers "briefing.sqf";

if ([player] call ace_common_fnc_isEngineer) then {
  [] call compile preprocessFileLineNumbers "fob.sqf";
};

fpa_checkRespawn = {
  private _timeOfDeath = param [1, CBA_missionTime];
  private _wait = _timeOfDeath + (3 * 60);
  if (player getVariable ["fpa_respawning", false]) exitWith {};
  player setVariable ["fpa_respawning", true];

  [{
    params ["_args", "_id"];
    _args params ["_wait"];

    private _canRespawn =  CBA_missionTime > _wait;
    if (_canRespawn && {missionNamespace getVariable ["fp_fob", false]}) exitWith {
      player setVariable ["fpa_respawning", false];
      [_id] call CBA_fnc_removePerFrameHandler;
      [] call fpa_jrm_fnc_forceRespawn;

      [{
        titleText ["", "PLAIN DOWN"];
        [] call fpa_common_fnc_respawnMenu;
      }] call CBA_fnc_execNextFrame;
    };

    private _str = if (_canRespawn) then {
      "when FOB deployed";
    } else {
      format ["in %1", [_wait - CBA_missionTime, "M:SS"] call CBA_fnc_formatElapsedTime];
    };
    private _text = format ["<t color='#eee' size='1.2'>Respawning %1</t>", _str];
    titleText [_text, "PLAIN DOWN", -1, true, true];
  }, 1, [_wait]] call CBA_fnc_addPerFrameHandler; 
};

["fpa_jrm_onPermaDeath", fpa_checkRespawn] call CBA_fnc_addEventHandler;
["fpa_jrm_jipPermaDeath", fpa_checkRespawn] call CBA_fnc_addEventHandler;

// Apply loadout
if (!isNil "FP_fnc_getLoadout") then {
  private _added = [player, typeOf player] call FP_fnc_getLoadout;

  // Respawn with gear
  if (_added) then {
    player addEventHandler ["Respawn", {
      [player, typeOf player] call FP_fnc_getLoadout;
    }];
  };

  if (!isMultiplayer) then {
    // Give AI loadouts
    {
      [_x, typeOf _x] call FP_fnc_getLoadout;
    } forEach (switchableUnits - (entities "HeadlessClient_F" + [player]));
  };
};

// Easier arsenal in editor, validate mission
if (!isMultiplayer) then {
  // Make arsenal easier to enter
  [["<t color='#ffff00'>[ Arsenal ]</t>", {["Open", true] spawn bis_fnc_arsenal}, 0, -85, false, true, "", ""]] call CBA_fnc_addPlayerAction;
  
  // Validate unit descriptions and callsigns. Can be removed (description.ext)
  private _cfg = getMissionConfig "MissionSQM";
  if (!isNull _cfg) then {
    [_cfg] call fpa_common_fnc_validateMission;
  };
};