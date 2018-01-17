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
  ["Alpha SQL", "a0"],
  ["Bravo SQL", "b0"],
  ["Romeo SQL", "r0"]
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

if (player == missionNamespace getVariable ["uavoperator", objNull] && {alive ugv1}) then {
  player connectTerminalToUAV ugv1;
};

private _msg =  "After closing severals 'popups' you found an e-mail telling Officer Gandez to makte haste to the nearby train station.<br />It seems to be directly south east of here.";
[laptop1, _msg, 40, {
    ["counter1"] remoteExecCall ["fp_fnc_uncache", 2];
}] execVM "scripts\intel_laptop.sqf";

private _msg2 =  "You have recovered a SITREP from nearby units. There was recently an incident in Imone, east of here. Officer Gandez marked himself as the reporting officer.";
[laptop2, _msg2, 40, {}] execVM "scripts\intel_laptop.sqf";

private _msg3 =  "The computer had a AAF shipping manifest, the destination seems to be the diesel power plant north of Tanoa Airport";
[laptop3, _msg3, 40, {}] execVM "scripts\intel_laptop.sqf";

private _msg4 =  "This is Officer Gandez personal laptop. You have found shipping manifest files, mentioning that the diesel power plant north of Tanoa Airfield is the supply depot.";
[laptop4, _msg4, 40, {}] execVM "scripts\intel_laptop.sqf";

player createDiaryRecord
["Diary",["[IMG] Officer Gandez","<img image='img_gandez.jpg'/>"]];

player createDiaryRecord
["Diary",["Execution", "
<br />PRIMARY: Find and destroy AAF supply depot
<br /><br />
Secondary: Secure Bala airstrip <br />
Secondary: Secure Saint-George airstrip and Lijnhaven docks<br />
Secondary: Secure intel regarding the location of supply depot<br /><br />
Romeo objective: Locate and eliminate HVT, Officer Gandez.
"]];

player createDiaryRecord
["Diary",["Briefing","After a recent peace treaty, AAF entered a deal with the Tanoan government in order to combat the rising Syndikat group. A few months has passed and AAF has seemingly increased their activity in Tanoa, with next to no progress regarding Syndikat. AAF is shady, and the Tanoan government has asked CSAT, due to our past with AAF, to help convince AAF to leave Tanoa.<br /><br />Initial conversations has not gone well and we do not see a peaceful solution.<br />
We have intel that AAF has been sending supplies to Tanoa for weeks, storing them in a depot. We have not been able to locate that depot, but taking it out would be a major setback for AAF<br /><br />"]];