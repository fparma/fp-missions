_caller = _this select 1;
_type = _this select 3;
sleep (random 1);
if (!spawningDone) exitWith {hint "Please wait before you try to spawn enemies."};

if (isServer) then {
	spawningDone = false;
	publicVariable "spawningDone";
	if (_type < 3) then {
		switch (_type) do {
			case 0: {
					_text = format ["Spawning requested by %1 at Easy training. Reset in progress",name _caller];
					[-1, {spawner sidechat _this},_text] call CBA_fnc_globalExecute;
					[z1] call DAC_Deactivate;
					waituntil{DAC_NewZone == 0};
					sleep 5;
					[z1] call DAC_Activate;
					"train1" setMarkerColor "ColorRed";
			};
			case 1: {
					_text = format ["Spawning requested by %1 at Medium training. Reset in progress",name _caller];
					[-1, {spawner sidechat _this},_text] call CBA_fnc_globalExecute;
					[z2] call DAC_Deactivate;
					waituntil{DAC_NewZone == 0};
					sleep 5;
					[z2] call DAC_Activate;
					"train2" setMarkerColor "ColorRed";
			};
			case 2: {
					_text = format ["Spawning requested by %1 at Hard training. Reset in progress",name _caller];
					[-1, {spawner sidechat _this},_text] call CBA_fnc_globalExecute;
					[z3] call DAC_Deactivate;
					waituntil{DAC_NewZone == 0};
					sleep 5;
					[z3] call DAC_Activate;
					"train3" setMarkerColor "ColorRed";
			};
		};
	}else{
		_text = format ["Deactivation of all zones requested by %1.",name _caller];
		[-1, {spawner sidechat _this},_text] call CBA_fnc_globalExecute;
		[z1] call DAC_Deactivate;
		waituntil{DAC_NewZone == 0};
		"train1" setMarkerColor "ColorOrange";
		[z2] call DAC_Deactivate;
		waituntil{DAC_NewZone == 0};
		"train2" setMarkerColor "ColorOrange";
		[z3] call DAC_Deactivate;
		waituntil{DAC_NewZone == 0};
		"train3" setMarkerColor "ColorOrange";
	};
	sleep 10;
	spawningDone = true;
	publicVariable "spawningDone";
	if (_type < 3) then {
	[-1, {spawner sidechat _this},"Spawning Done! Happy hunting."] call CBA_fnc_globalExecute;
	}else{
	[-1, {spawner sidechat _this},"All zones deactivated."] call CBA_fnc_globalExecute;
	};
}else{
	[0,{_this execVM "scripts\enemyspawning.sqf";},[0,_caller,0,_type]] call CBA_fnc_globalExecute;
};