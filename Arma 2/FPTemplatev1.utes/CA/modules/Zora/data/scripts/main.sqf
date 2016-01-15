scriptName "Zora\data\scripts\main.sqf";
/*
	File: main.sqf
	Author: Karel Moricky

	Description:
	Init script of Zora system.
	Will initialize some of SOM variables of SOM is not running.

	Parameter(s):
	_this: the Zora logic unit which triggered this script.
*/

_BIS_Zora_path = "ca\modules\zora\data\";

_logic = _this select 0;
_logic setvariable ["unitslist",[]];
_logic setvariable ["grp",units _logic - [_logic]];
_logic setpos [1000,10,0];
//[_logic] join grpnull;

//--- Execute Functions
if (isnil "bis_fnc_init") then {
	createcenter sidelogic;
	_logicGrp = creategroup sidelogic;
	_logicFnc = _logicGrp createunit ["FunctionsManager",position player,[],0,"none"];
};

//--- Functions loaded
waituntil {!isnil "BIS_fnc_init"};
_fsm = _this execFSM _BIS_Zora_path + "fsms\zora.fsm";
_logic setvariable ["fsm",_fsm];

BIS_Zora_setZones = compile (preprocessFileLineNumbers (_BIS_Zora_path + "scripts\functions\setZones.sqf"));
if (isnil "BIS_Zora_pause") then {BIS_Zora_pause = false};

private ["_centerW", "_centerE", "_centerG", "_centerC"];
_centerW = createCenter west;
_centerE = createCenter east;
_centerG = createCenter resistance;
_centerC = createCenter civilian;
/*
west setFriend [east, 0];
east setFriend [west, 0];
east setFriend [resistance, 0];
resistance setFriend [east, 0];
*/
