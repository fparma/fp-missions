waitUntil {!isNull player};
#include "cuel_scripts\defines.sqf"
#include "cuel_scripts\client\funcs.sqf"
#include "cuel_scripts\weapondefines.sqf"

cutText ["","BLACK FADED",1];
player enableIRLasers true; 
player enableGunLights true; 

if (param_playerfired == 1) then {
	firedHandled = true;
	cuel_weaponFired = compile preProcessFileLineNumbers "cuel_scripts\client\fn_cuel_fired.sqf";
	player addEventHandler ["fired", {_this spawn cuel_weaponFired}];
};

player addEventHandler ["Respawn", { player spawn {
			waitUntil {alive player}; 
			"dynamicBlur" ppEffectEnable true;   
			"dynamicBlur" ppEffectAdjust [6];   
			"dynamicBlur" ppEffectCommit 0;     
			"dynamicBlur" ppEffectAdjust [0.0];  
			"dynamicBlur" ppEffectCommit 5;
			sleep remPlayerBodyTime; hideBody _this;sleep 5; deleteVehicle _this;
		};
	}
];

call compile preProcessFileLineNumbers "cuel_scripts\client\loadout.sqf";

if (isServer) then { [] spawn { call compile preprocessFileLineNumbers "initserver.sqf"; }; }; 
endLoadingScreen;
cutText ["","BLACK IN",1];


if ((player distance [0,0,0]) < 10) then {
	player setPosATL (markerPos "respawn_west");
};

if (CLY_debug) then {
	[] spawn {
		while {CLY_debug} do {
hintSilent format ['Total units: %1\n
Groups: %2 \n
Dead: %3\n
Amount players: %4 \n
Amount of triggers: %5\n
Possible victims: %6
					',count allUnits,
					count allGroups,
					count allDead,
					count CLY_players,
					totTriggers,
					CLY_zombievictims
			];
			sleep 0.5;
		};
	};
};

#include "cuel_scripts\client\mainLoop.sqf"