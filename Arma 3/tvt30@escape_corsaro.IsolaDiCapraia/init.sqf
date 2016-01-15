// TFAR settings
if (isClass(configFile>>"CfgPatches">>"task_force_radio")) then {
	[] call compile preProcessFileLineNumbers "tfar_settings.sqf";
};
// General FP init, don't remove
[] call compile preProcessFileLineNumbers "src\fp_init.sqf";

// Client only stuff
if (!isDedicated) then {
	FP_isJIP = isNull player;
	// Hide markers
	{ _x setMarkerAlphaLocal 0; } foreach ["respawn_west","respawn_east","respawn_guer","respawn_guerrila","respawn_civilian"]; 

	waitUntil {!isNull player};
	// "player" command is now initialised (IMPORTANT for JiP compability, if you have no idea what this is, just add client scripts below

	// Add any side specific markers that should become visible to only one side
	{_x setMarkerAlphaLocal 1} foreach ([
		["respawn_west"], // BLUFOR
		["respawn_east"], // OPFOR
		["respawn_guerrila"], // INDEP
		["respawn_civilian"] // CIV
	] select ([west,east,independent,civilian] find (side player)));

	// Execute briefing
	[] call compile preProcessFileLineNumbers "briefing.sqf";

	// Respawn with same gear if using gear scripts
	player addEventHandler ["Respawn",{
		_unit = _this select 0;
		if (!isNil "FP_kit_type" &&  {FP_kit_type != ""}) then {
			[_unit,_type] call FP_fnc_getGear;
		};
	}];

};

// Server only scripts
if (isServer) then 
{


};
// add any "run for everyone" scripts below

// handles JIP and respawn, check the file for settings
[] execVM "src\jipAndRespawnManager.sqf";


// Civilians
// [] execVM "fp_scripts\civ\civ_main.sqf";
