/*
	Executed locally when player joins mission (includes both mission start and JIP).
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.

	Parameters:
		0 - Player object
		1- Did player JiP
*/

_isJip = _this select 1; // this can be used to check for JiPs

// Add JIP players to zeus
if (_isJip) then {
	[player, "FP_fnc_addCuratorObject", false] call BIS_fnc_MP;
};

// Get briefing
[] call compile preProcessFileLineNumbers "briefing.sqf";

// Longer view distance for pilots. Edit in config.sqf
if (!isNil "FP_pilotNames" && {str player in FP_pilotNames}) then {
	[] execVM "base\scripts\pilot_viewdistance.sqf";
};

// Weapons cold and unit lock on mission start. Edit in config.sqf
if (!isNil "FP_lockStarters" && {count FP_lockStarters > 0}) then {
	[] call FP_fnc_weaponsColdAndUnitLock;
};

// Delete grenades thrown in spawn
player addEventHandler ["Fired", {
	if (_this select 2 == "HandGrenadeMuzzle") then {
		if ((_this select 0) distance (markerPos (["respawn_west","respawn_east","respawn_guerrila","respawn_civilian"] select ([WEST,EAST,independent,civilian] find side player))) < 50) then
		{
			(_this select 6) setposatl [0,0, 1000];
			deleteVehicle (_this select 6);
			titleText ["G IS FOR GRENADES", "PLAIN", 2];
		};
	};
}];

if (str player in ["gm", "gm2"]) then {
	[] execVM "gm.sqf";
}else{
	player addEventHandler ["Respawn", {
		[[[name player], {player sideChat (_this + " has respawned")}], "BIS_fnc_spawn", [gm, gm2]] call BIS_fnc_MP;

		hintSilent "Get in the front respawn truck to get transported back to the field. If there's no truck wait for it to come back";
		0 spawn {sleep 5; hintSilent ""};
	}];
};
