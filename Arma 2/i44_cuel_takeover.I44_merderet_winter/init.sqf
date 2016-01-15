if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
};


//Init UPSMON scritp (must be run on all clients)
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";	
[300] call compile preprocessFileLineNumbers "modules\CEP_caching\main.sqf";
//Process statements stored using setVehicleInit
processInitCommands;
//Finish world initialization before mission is launched. 
_diary4 = player createDiaryRecord ["Diary", ["Time and weather", "13:00. Snowing."]];
_diary3 = player createDiaryRecord ["Diary", ["Intelligence report", "The US Army has a few scattered troops around St Mer Pacese. Expect mostly infantry, however it's likely that a few mechanized sections are still around the area. Be cautious."]];
_diary2 = player createDiaryRecord ["Diary", ["Briefing", "First, secure the three farms around St Mer Pacese. Then proceed to Chef-du-Pont and secure the bridge."]];  
finishMissionInit;

if (isServer) then {
["town1", true] call CBA_fnc_setMarkerPersistent;
["farm1", true] call CBA_fnc_setMarkerPersistent;
["farm2", true] call CBA_fnc_setMarkerPersistent;
["chef", true] call CBA_fnc_setMarkerPersistent;
["respawn_west", true] call CBA_fnc_setMarkerPersistent;
};

if (isDedicated) exitWith {};

player addEventHandler ["Killed",{
player spawn {
_unit = _this;
		private ['_magazines','_weapons'];
			_weapons = weapons player;
			_magazines = magazines player;
		WaitUntil{alive player};
		removeAllWeapons player;
		removeAllItems player;
		{player addMagazine _x} foreach _magazines;
		{player addWeapon _x} foreach _weapons;
		if (primaryWeapon player != "") then {
       			player selectWeapon (primaryWeapon player);
	        	_muzzles = getArray(configFile>>"cfgWeapons" >> primaryWeapon player >> "muzzles"); // Fix for weapons with grenade launcher
		        player selectWeapon (_muzzles select 0);
		};
		if (alive apc) then {
			player moveInCargo apc;
		} else {
			if (alive tank) then {
				player moveInCargo tank;
			};
		};
		sleep 2;
		hidebody _unit; sleep 3;
		deleteVehicle _unit;
	};
}];