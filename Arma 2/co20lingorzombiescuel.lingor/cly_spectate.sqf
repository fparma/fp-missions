/*
CLY Spectate - Simple spectating script by Celery

Makes a player enter spectator mode, following units from their perspectives and cycling between them with mouse buttons.

Execution:
0=[[spectateable sides],spectate players only] execVM "cly_spectate.sqf"
Leave sides array empty to include everyone. AI can always be spectated in SP to test the script.

Example:
0=[[west,east],true] execVM "cly_spectate.sqf"
This will allow the player to spectate BLUFOR and OPFOR players.

Execute in onPlayerRespawnAsSeagull.sqs in non-respawn missions.
Otherwise execute where you want with the conditions you deem best.

For a more impressive first person spectating experience, use the cameraView script that enables automatic switching into
aiming mode whenever the spectatee does it (works only with players). Put the following in the init script:
[] spawn {player setVariable ["cameraview","INTERNAL",true];while {true} do {if (alive player and cameraView!=(player getVariable "cameraview")) then {player setVariable ["cameraview",cameraView,true]};sleep 0.1}};
*/

_sides=_this select 0;
_playersonly=_this select 1;

player setVariable ["spectating",player,true];
_body=player;
_name=name player;
_spectatee=objNull;

_wait=time+5;
waitUntil {alive player or (playerRespawnTime==-1 and time>_wait)};

titleCut ["","BLACK FADED",0.1];
sleep 0.2;

//Mouse input
CLY_spectate_cycle=0;
findDisplay 46 displayAddEventHandler ["MouseButtonDown","if ((_this select 1)==0) then {CLY_spectate_cycle=CLY_spectate_cycle+1};if ((_this select 1)==1) then {CLY_spectate_cycle=CLY_spectate_cycle-1}"];

_i=0;

//Spectate
while {true} do {
	_respawned=false;
	if (!alive player) then {_respawned=true};
	waitUntil {alive player};
	
	//Gather list of viable spectatees
	_spectatees=[];
	_units=[];
	if (_playersonly and isMultiplayer) then {
		_units=if (isNil "CLY_players") then {playableUnits} else {CLY_players};
	} else {
		_units=allUnits;
	};
	if (isMultiplayer) then {
		{if ((side _x in _sides or count _sides==0) and (!_playersonly or isPlayer _x) and alive _x and _x!=player and isNil {_x getVariable "spectating"}) then {_spectatees set [count _spectatees,_x]}} forEach _units
	} else {
		{if ((side _x in _sides or count _sides==0) and alive _x and _x!=player and isNil {_x getVariable "spectating"}) then {_spectatees set [count _spectatees,_x]}} forEach _units
	};
	
	if (count _spectatees>0 or isNull _spectatee) then {
		_changed=false;
		
		//First run
		if (isNull _spectatee) then {
			_spectatee=_body;
			if (count _spectatees>0) then {
				_spectatee=_spectatees select _i;
				_name=name _spectatee;
			};
			_changed=true;
		};
		
		//Find correct index for intended spectatee
		if (_spectatee in _spectatees) then {_i=_spectatees find _spectatee};
		
		//Switch to living version of previously dead spectatee
		if (!alive _spectatee and {name _x==_name} count _spectatees==1) then {
			{if (name _x==_name) then {_i=_forEachIndex}} forEach _spectatees;
			_changed=true;
		};
		
		//Check cycle
		if (CLY_spectate_cycle>0) then {_i=_i+1;_changed=true;CLY_spectate_cycle=0};
		if (CLY_spectate_cycle<0) then {_i=_i-1;_changed=true;CLY_spectate_cycle=0};
		
		//Correct index
		if (_i>=count _spectatees) then {_i=0};
		if (_i<0) then {if (count _spectatees>1) then {_i=count _spectatees-1} else {_i=0}};
		
		//Update spectatee if changed
		if (_changed and count _spectatees>0) then {
			_spectatee=_spectatees select _i;
			_name=name _spectatee;
		};
		
		//Set view mode (requires cameraView script)
		_view=cameraView;
		if (!isNil {_spectatee getVariable "cameraview"}) then {
			_specview=_spectatee getVariable "cameraview";
			if (_specview in ["INTERNAL","GUNNER"] and _view in ["INTERNAL","GUNNER"] and _view!=_specview) then {
				_view=_specview;
				_changed=true;
			};
		};
		
		//Spectate the spectatee
		if (_changed or _respawned) then {
			vehicle _spectatee switchCamera _view;
			if (player getVariable "spectating"!=_spectatee) then {
				player setVariable ["spectating",_spectatee,true];
			};
		};
		
		//Spectator hint
		_ai=if (!isPlayer _spectatee and _spectatee!=_body) then {" (AI)"} else {""};
		if (!alive _spectatee) then {_ai=" (dead)"};
		hintSilent format ["Spectating\n%1%2",_name,_ai];
	};
	sleep 0.05;
};