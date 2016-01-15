/*
	Function: FP_fnc_coldStart

	API:
		Any

	Description:
		Removes all bullets fired until mission has started.

		Any units that are not leaders or defined in FP_noLockUnits will not be able to move far from their start position
		until any units defined in FP_missionStarters has started the mission.

		Needs to be executed on every client.

	Parameters:
		0 - Force active even if used before. Useful for e.g mission ending [Boolean]

	Author:
		Cuel 2015-01-19
*/

if (!hasInterface) exitWith{};
params [["_force", false, [false]]];

if (!_force && !isNil "FP_coldLockActive") exitWith{};
FP_coldLockActive = true;

if (_force) then {
	FP_missionHasStarted = false;
};

if ((isNil "FP_missionHasStarted" || {!FP_missionHasStarted}) && {!isNil "FP_lockStarters"} && {count FP_lockStarters > 0}) then {

	_this spawn {

		if (str player in FP_lockStarters) then {
			FP_startMissionAction = player addAction ["<t color='#ffff00'>[ Start mission (weapons hot) ]</t>", {
				// Remove others action
				[{if (!isNil "FP_startMissionAction") then { player removeAction FP_startMissionAction; FP_startMissionAction = nil}}, "BIS_fnc_spawn", true] call BIS_fnc_MP;
				// Tell server to record the time misson was started. Time is most precise on the server.

				0 spawn {
					"Mission going live, weapons hot" call FP_fnc_hint;
					sleep 2;
					FP_missionHasStarted = true;
					publicVariable "FP_missionHasStarted";
					sleep 4;
					"" call FP_fnc_hint;
				};
			}, nil, 0, false, true];
		};

		_firedEv = player addEventHandler ["Fired", {
			[_this select 6] call ace_frag_fnc_addBlackList;
			deleteVehicle (_this select 6);
		}];

		_spawnPos = getPosATL player;
		if (str player in FP_lockCanMove || {count FP_lockCanMove == 0 && leader group player == player}) then {
			_spawnPos = [];
		};

		while {isNil "FP_missionHasStarted" || {!FP_missionHasStarted}} do {
			if (count _spawnPos > 0 && {player distance _spawnPos > 20}) then {
				vehicle player setPosATL _spawnPos;
				hintSilent "You are locked in place until mission has started";
				[] spawn {sleep 5; hintSilent ""};
			};
			sleep 2.23;
		};
		player removeEventHandler ["Fired", _firedEv];
	};
};
