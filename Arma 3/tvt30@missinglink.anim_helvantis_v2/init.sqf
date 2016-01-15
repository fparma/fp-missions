FP_JRM_respawns = 0;
// TFAR settings
if (isClass(configFile>>"CfgPatches">>"task_force_radio")) then {
	[] call compile preProcessFileLineNumbers "tfar_settings.sqf";
};
// General FP init, don't remove
[] call compile preProcessFileLineNumbers "src\fp_init.sqf";

if (paramsArray select 0 == 1) then {
	setDate [2035,12,02,23,45]
};

FP_reinfTimeArrival = [730, 1030, 1330, 1630] select (paramsArray select 1);

// Client only stuff
if (!isDedicated) then {
	FP_isJIP = isNull player;
	// Hide markers
	{ _x setMarkerAlphaLocal 0; } foreach ["respawn_west","respawn_east","respawn_guer","respawn_guerrila","respawn_civilian"];
	[] execVM "intro.sqf";
	waitUntil {!isNull player};
	if (!isServer) then {
		[] execVM "jrm.sqf";
	};
	{player addItem _x} forEach [ "ACE_fieldDressing","ACE_fieldDressing", "ACE_Morphine"];
	[] spawn {
		while {true} do {
			{
				if (alive _x && side _x == opfor && {!(_x getVariable ["fp_rutexture",false])} && {uniform _x == 'U_I_CombatUniform'}) then {
					_x setObjectTexture [0, "snowberezka.paa"];
					_x setVariable ["fp_rutexture", true];
				};
			} foreach (call CBA_fnc_players);
			sleep 1.23;
		};
	};

	[] execVM "gearcheck.sqf";

	[] execvm "tpw_core.sqf";

	[250,3,1,1,1,1,1] execvm "tpw_fog.sqf";
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

	[] spawn {
		_maxspeed = 20;
		while {alive player && isNil "FP_missionLive"} do {

			_curspeed = speed player;
			if (_curspeed > _maxspeed) then {
				_vel = velocity player;
				_dir = direction player;
				_speed = _curspeed - _maxspeed;
				player setVelocity [(_vel select 0)/_curspeed * _maxspeed,(_vel select 1)/_curspeed * _maxspeed, 1];
			};
			sleep 0.02;
		};
	};
};

// Server only scripts
if (isServer) then {
	[] execVM "jrm.sqf";
};
