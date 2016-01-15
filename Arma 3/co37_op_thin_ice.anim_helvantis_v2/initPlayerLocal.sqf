/*
	Executed locally when player joins mission (includes both mission start and JIP).
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.

	Parameters:
		0 - Player object
		1- Did player JiP
*/

if (!hasInterface) exitWith {};

if (!(str player in ["gm", "debugger"])) then {
		disableRemoteSensors true;
};

_isJip = _this select 1;
[] call compile preProcessFileLineNumbers "base\initPlayer.sqf";

// Add JIP players to zeus
if (_isJip) then {
	[player, "FP_fnc_addCuratorObject", false] call BIS_fnc_MP;
};

// Get briefing
[] call compile preProcessFileLineNumbers "briefing.sqf";

// Add teleport options to flag. See config.sqf
if (!isNil "fp_flag") then {
	[fp_flag, FP_flag_targets] call compile preProcessFileLineNumbers "base\scripts\teleport_flag.sqf";
};

// Longer view distance for pilots. Edit in config.sqf
if (!isNil "FP_pilotNames" && {str player in FP_pilotNames}) then {
	[] execVM "base\scripts\pilot_viewdistance.sqf";
};

// Debug script for development. Create a unit named "debugger" and use him as player.
if (str player in ["debugger"]) then {
	[] call compile preProcessFileLineNumbers "base\scripts\debug_man.sqf";
};

// Weapons cold and unit lock on mission start. Edit in config.sqf
if (!isNil "FP_lockStarters" && {count FP_lockStarters > 0}) then {
	[] call FP_fnc_coldStart;
};

// Delete grenades thrown in spawn
player addEventHandler ["Fired", {
	if (_this select 2 == "HandGrenadeMuzzle") then {
		if ((_this select 0) distance (markerPos (["respawn_west","respawn_east","respawn_guerrila","respawn_civilian"] select ([WEST,EAST,independent,civilian] find side player))) < 80) then
		{
			[_this select 6] call ace_frag_fnc_addBlackList;
			deleteVehicle (_this select 6);
			titleText ["G IS FOR GRENADES", "PLAIN", 2];
		};
	};
}];

if (!isNil "FP_JRM_fnc_init") then {
	[] call FP_JRM_fnc_init;
};

if (str player in ["gm", "debugger"]) then {
	[player, "Curator"] call bis_fnc_setUnitInsignia;
} else {
	[player, "FP_insignia"] call bis_fnc_setUnitInsignia;
};

[] call compile preprocessFileLineNumbers "effects.sqf";

if (!isNil "Ares_fnc_RegisterCustomModule") then {
	["FP", "Eject cargo", {
		local _obj = _this select 1;
		if (isNull _obj || {_obj isKindOf "Man"} || {speed _obj > 2}) exitWith {};

		local _units = assignedCargo _obj;
		{
			_x leaveVehicle (vehicle _x);
			_x action ["Eject", vehicle _x];
		}forEach _units;
	}] call Ares_fnc_RegisterCustomModule;
};


/*
_adjustLight = {
	CHBN_light setLightAttenuation [10e10,(30000 / (CHBN_adjustBrightness max 10e-10)),4.31918e-005,4.31918e-005];
	CHBN_light setLightAmbient CHBN_adjustColor;
};

if (missionNamespace getVariable ["CHBN_running",false]) exitWith {systemChat "CHBN script already running!"};
CHBN_running = true;

CHBN_adjustBrightness = missionNamespace getVariable ["CHBN_adjustBrightness",1];
CHBN_adjustColor = missionNamespace getVariable ["CHBN_adjustColor",[0.5,0.7,1]];

if (!isNil "CHBN_light") then {deleteVehicle CHBN_light};
CHBN_light = "#lightpoint" createVehicleLocal [0,0,0];
CHBN_light setLightBrightness 1;
CHBN_light setLightDayLight false;
call _adjustLight;

for "_i" from 0 to 1 step 0 do {
	_adjustBrightness = CHBN_adjustBrightness;
	_adjustColor = CHBN_adjustColor;
	waitUntil {!(_adjustBrightness isEqualTo CHBN_adjustBrightness) || !(_adjustColor isEqualTo CHBN_adjustColor)};
	call _adjustLight;
};

*/
