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

// Teleport flag, first is the object to addaction to, second format is ["display name", "objectName"]
[fp_flag, [
  ["Plt Command", "plt0"],
  ["Alpha actual", "a0"],
  ["Bravo actual", "b0"]
]] execVM "scripts\teleport_flag.sqf";
*/

[laptop, "You have copied the encrypted data to your flash drive", 60] execVM "scripts\intel_laptop.sqf";

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

["ace_firedPlayer", {
  if ((_this select 2) == "IRGrenade" && {isNil "fp_extract"} && {(getPosATL player) inArea extracttrigger}) then {
    fp_extract = true;
    publicVariable "fp_extract";
    hintSilent "Extraction inbound";
  };
}] call CBA_fnc_addEventHandler;

player createDiaryRecord
["Diary",["Mission","
<br />
1) Create a diversion by blowing up the fuel station (2x c4 required) <br />
2) Retrieve any intel from the leaders house <br />
3) Destroy the antenna in Georgetown <br />
4) Rescue the captured ambassador <br />
5) When you are done, throw an IR Grenade near the Extract marker for UH60 pick up.
"]];

player createDiaryRecord
["Diary",["Briefing","
The Syndikat presence is strong in Georgetown and finally something is being done about it. With a laser-precise insertion and objectives we hope to cause mass confusion.

<br /><br />Kingfisher - UAV, is available for recon and CAS. Firing any rockets before the diversion is prohibited.
"]];

