/*
	General FP init. Not for editing unless you know what you doing
*/

enableSaving [false,false];
setGroupIconsVisible [true,false]; //Show only 2D
enableCamShake true;
setViewDistance 2000;
setObjectViewDistance 2000;
setTerrainGrid 25;

// Run config
[] call compile preprocessFileLineNumbers "config.sqf";

// TFAR settings. Sets the default channels etc
if (isClass(configFile>>"CfgPatches">>"task_force_radio")) then {
	[] call compile preProcessFileLineNumbers "base\scripts\tfar_settings.sqf";
};

if (hasInterface) then {
	// Clients

	// Log ace markers. Yes we are overwriting ace functions
	ACE_markers_fnc_placeMarker = compile preProcessFileLineNumbers "base\scripts\log_ace_markers.sqf";
	ACE_maptools_fnc_handleMouseButton = compile preProcessFileLineNumbers "base\scripts\log_ace_line_markers.sqf";

	// Hide all UPS markers with correct name, e.g: "area0", "area1", "area_0", "area_1"
	for "_i" from 0 to 50 do {
		_a = format ["area%1",_i];
		_a setMarkerAlphaLocal 0;
		_a = format ["area_%1",_i];
		_a setMarkerAlphaLocal 0;
	};

	// Add teleport options to flag. Format is ["Display Name", "objectName"]
	if (!isNil "fp_flag") then {
		[fp_flag,[
			["Actual", "actual"],
			["Alpha Actual","a0"],
			["Bravo Actual","b1"],
			["Charlie Actual","c1"],
			["Delta Actual","d0"]
		]] call compile preProcessFileLineNumbers "base\scripts\teleport_flag.sqf";
	};

	[] spawn {
		waitUntil {!isNull player};

		player addEventHandler ["Respawn", {
			// Time before the teleport flag (if available) can be used again, to prevent people from just teleporting after dying.
			// The flag is for JiPs not deaths. 3 min default. Edit in config.sqf
			FP_tp_timeout = time + FP_respawnTeleportDelay;

			// Add new unit to zeus
			[_this select 0, "FP_fnc_addCuratorObject", false] call BIS_fnc_MP;
		}];

		// Fix so player cant join ENEMY side, where all sides fires on him
		player addEventHandler ["HandleRating", {
			_rating = _this select 1;
			(abs _rating)
		}];

		// Debug script for development. Create a unit named "debugger" and use him as player.
		if (str player in ["debugger"]) then {
			[] execVM "base\scripts\debug_man.sqf";
		};

		// Lower weapon after mission start
		sleep  0.3;
		player switchMove "amovpercmstpslowwrfldnon";
	};
};

if (isServer && FP_use_cleanUp) then {
	// clean up script
	// will not delete units dead on mission start
	// will not delete units where "this setVariable ["fp_noDelete", true]"
	[] execVM "base\scripts\clean_up.sqf";
};

if (isMultiplayer && {!isNil "FP_jrm_enabled"} && {FP_jrm_enabled}) then {
	[] call FP_JRM_fnc_clientInit;
	[] call FP_JRM_fnc_serverInit;
};

FP_fnc_baseInit = nil;
