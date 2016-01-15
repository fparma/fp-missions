//This script updates the player and victim lists, by Celery, edited by cuel.

if (!isServer) exitWith {};

while {true} do {
	CLY_zombievictims=[];
	if (isMultiplayer) then {
		CLY_players = playableUnits;
		if (count CLY_players == 0) then {CLY_players = allUnits};
		{
			if (!isPlayer _x || !alive _x) then {
				CLY_players=CLY_players-[_x];
			};
		} forEach CLY_players;
	} else {
		CLY_players=[player];
	};
	sleep 0.02;
	{
		if (alive _x and _x isKindOf "Man" and !(vehicle _x isKindOf "Air" and getPos vehicle _x select 2>15) and isNil {_x getVariable "victim"}) then {
			if (!(_x call ace_sys_wounds_fnc_isUncon)) then {
				CLY_zombievictims set [count CLY_zombievictims,_x];
			}else{
				_i = CLY_zombievictims find _x;
				if (_i != -1) then {
					CLY_zombievictims set [_i,objNull];
				};
			};
		};
	} forEach allUnits;	
	
	sleep 1;
	if (CLY_debug) then {
		publicVariable "CLY_players";
		publicVariable "CLY_zombievictims";
	};
};