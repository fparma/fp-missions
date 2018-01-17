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
  ["Plt Command", "plt"],
  ["Alpha actual", "a0"],
  ["Bravo actual", "b0"]
]] execVM "scripts\teleport_flag.sqf";

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

player createDiaryRecord ["Diary", ["Assets", "
4x LAV-25 (M240)<br />
2x Unarmed HMMWV<br />
2x MTVR (Transport)<br /><br />

Refuel and Rearm trucks can be dispatched from base by Plt Commander.
"]];


player createDiaryRecord ["Diary", ["Intel", "
All intel of rebel camps given to us by the local government have been marked on the map. Expect at least 1 camp in each zone, but there might be more. You might be able to gather information regarding the camps from the local populace, if they like you.<br /><br />
Reports indicate the rebels might have APCs available, we have been unable to confirm the type or amount.<br />
We have had zero reports of anti-personnel mines being used by the rebels, but we suspect they throw might together some improvised explosive devices<br />
"]];

player createDiaryRecord ["Diary", ["Execution", "
Search the marked areas for any rebel camps.<br /><br />
Destroy any military assets found in the camps.
"]];

player createDiaryRecord ["Diary", ["Briefing", "
Pro-Russian Rebels have been terrorizing Everon for several months and the local government are uncapable of resolving the conflict and have asked for our help.<br /><br />
Our plan is to take our their camps and assets.
"]];


fp_RespawnCodeCargo = {
  ["FP_screen"] call BIS_fnc_blackOut;
  [{
    params ["_obj"];
    [false] call FP_fnc_spectate;
    player assignAsCargo _obj;
    player moveInCargo _obj;
    ["FP_screen"] call BIS_fnc_blackIn;
  }, _this select 0, 2 + random 2] call CBA_fnc_waitAndExecute;
};

if (!isNil "Ares_fnc_RegisterCustomModule") then {
  private _text = "FP - Respawn";
  // Respawns and moves all players (that can fit) inside the cargo of a specific vehicle

  [_text, "Respawn PLT", {
    params ["_pos", "_obj"];
    private _uids = fp_plt select {!(isNull _x)} apply {getPlayerUID _x};
    FP_JRM_savedState = FP_JRM_savedState select {!((_x select 0) in _uids)};
    publicVariable "FP_JRM_savedState";
    [_pos] remoteExecCall ["FP_JRM_fnc_forceRespawn", fp_plt];
  }] call Ares_fnc_RegisterCustomModule;

    [_text, "Respawn ALPHA", {
    params ["_pos", "_obj"];

    private _uids = fp_alpha select {!(isNull _x)} apply {getPlayerUID _x};
    FP_JRM_savedState = FP_JRM_savedState select {!((_x select 0) in _uids)};
    publicVariable "FP_JRM_savedState";
    [_pos] remoteExecCall ["FP_JRM_fnc_forceRespawn", fp_alpha];
  }] call Ares_fnc_RegisterCustomModule;

  [_text, "Respawn BRAVO", {
    params ["_pos", "_obj"];
    private _uids = fp_bravo select {!(isNull _x)} apply {getPlayerUID _x};
    FP_JRM_savedState = FP_JRM_savedState select {!((_x select 0) in _uids)};
    publicVariable "FP_JRM_savedState";
    [_pos] remoteExecCall ["FP_JRM_fnc_forceRespawn", fp_bravo];
  }] call Ares_fnc_RegisterCustomModule;
};