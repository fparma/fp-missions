/*
	Executed locally when player joins mission (includes both mission start and JIP).
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.

	Parameters:
		0 - Player object
		1- Did player JiP
*/

private "_isJip";
_isJip = _this select 1; // this can be used to check for JiPs

if (_isJip) then {
	[player, "FP_fnc_addCuratorObject", false] call BIS_fnc_MP;
};

// Get briefing
[] call compile preProcessFileLineNumbers "briefing.sqf";

// Respawn with correct gear if using template gear
player addEventHandler ["Respawn", {
	// Time before the teleport flag (if available) can be used again, to prevent people from just teleporting after dying.
	// The flag is for JiPs not deaths. 3 min default. Edit in config.sqf
	FP_tp_timeout = time + FP_tp_respawnDelay;

	_this execVM "src\respawn.sqf";
}];

// Fix so player cant join ENEMY side, where all sides fires on him
player addEventHandler ["HandleRating", {
	_rating = _this select 1;
	(abs _rating)
}];

// Weapons cold and unit lock on mission start. Edit on config.sqf
if (isMultiplayer && !isNil "FP_missionStarters" && {count FP_missionStarters > 0}) then {
	[] call FP_fnc_weaponsColdAndUnitLock;
};

// Longer view distance for pilots. Edit in config.sqf
if (!isNil "FP_pilotNames" && {str player in FP_pilotNames}) then {
	[] execVM "fp_scripts\viewdistance.sqf";
};

// Delete grenades thrown in spawn
player addEventHandler ["Fired",
{
	if (_this select 2 == "HandGrenadeMuzzle") then
	{
		if ((_this select 0) distance (markerPos (["respawn_west","respawn_east","respawn_guerrila","respawn_civilian"] select ([WEST,EAST,independent,civilian] find side player))) < 50) then
		{
			deleteVehicle (_this select 6);
			titleText ["G IS FOR GRENADES", "PLAIN", 3];
		};
	};
}];

[player,"FP_insignia"] call BIS_fnc_setUnitInsignia;

if (str player in ["gm", "debugger"]) then {
	[] execVM "gm.sqf";
	[] execVM "Ares_CustomSpawns.sqf";
};

if (isMultiplayer && !_isJip) then {
	titleCut ["", "BLACK FADED", 999];
	[] spawn {
		waitUntil {time > 0};
		[
		        [
		                ["FP CAMPAIGN MISSION 2","align = 'left' size = '1' font='PuristaBold'"],
		                ["","<br/>"],
						["OPERATION CRUSADER","align = 'left' size = '1' font='PuristaBold'"],
						["","<br/>"],
						[format ["%1, %2", player call BIS_fnc_locationDescription, [daytime, "HH:MM"] call BIS_fnc_timeToString],"align = 'left' size = '0.8' font='puristaMedium'"],
						["","<br/>"],
						[format ["%1 %2", (rank player) call CBA_fnc_capitalize, name player],"align = 'left' size = '0.8' font='puristaMedium'"]
		        ]
		, 1, 1, false] spawn BIS_fnc_typeText2;
	    sleep 2;
	    "dynamicBlur" ppEffectEnable true;
	    "dynamicBlur" ppEffectAdjust [6];
	    "dynamicBlur" ppEffectCommit 0;
	    "dynamicBlur" ppEffectAdjust [0.0];
	    "dynamicBlur" ppEffectCommit 5;
	    titleCut ["", "BLACK IN", 6];
	};
};
