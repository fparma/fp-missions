/*
	Executed locally when player joins mission (includes both mission start and JIP).
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.

	Parameters:
		0 - Player object
		1- Did player JiP
*/

if (!hasInterface) exitWith {};
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

FP_uniformBusy = false;
player addAction ["<t color='#ffff00'>[ Switch uniform ]</t>", {
	FP_uniformBusy = true;
	player playActionNow "Medic";
	[] spawn {
		sleep 3;
		if ('FP_Uniform_Black' in itemCargo (unitBackpack player)) then {
			_items = uniformItems player;// + magazineCargo uniformContainer player;
			_bp = unitBackpack player;
			_bpItems = (itemCargo _bp - ["FP_Uniform_Black"]);
			clearItemCargoGlobal _bp;
			_bpItems pushBack uniform player;
			removeUniform player;
			player forceAddUniform "FP_Uniform_Black";
			{_bp addItemCargoGlobal [_x, 1]} forEach _bpItems;
			[player, _items] call FP_fnc_addToContainers;
		};
		FP_uniformBusy = false;
	};
},"", 100, false, true,"", "!FP_uniformBusy && vehicle player == player && isTouchingGround player && {!(surfaceIsWater getpos player)} && {'FP_Uniform_Black' in itemCargo (unitBackpack player)}"];

if (time < 15) then {
	sleep 1;
	_heli = if (toLower (groupid (group player)) == "alpha") then {heli1} else {heli2};
	player moveInCargo [_heli, units group player find player];
	waitUntil {vehicle player == _heli};
	sleep 2;
	["FP_black"] call BIS_fnc_blackIn;
};
