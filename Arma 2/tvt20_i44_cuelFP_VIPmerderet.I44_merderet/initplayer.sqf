if (isDedicated) exitWith {};

if ((side player) == resistance) then {
spawnFlag addAction ["Teleport to Talus", "assassintp.sqf", "talus"];
spawnFlag addAction ["Teleport to River", "assassintp.sqf", "river"];

talusFlag addAction ["Teleport to Spawn (farm)", "assassintp.sqf", "spawn"];
talusFlag addAction ["Teleport to River", "assassintp.sqf", "river"];

riverFlag addAction ["Teleport to Spawn (farm)", "assassintp.sqf", "spawn"];
riverFlag addAction ["Teleport to Talus", "assassintp.sqf", "talus"];

player execVM "scripts\markAssassins.sqf";

"removeMarker" addPublicVariableEventHandler {deleteMarkerLocal (_this select 1)};

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
		sleep 2;
		hidebody _unit; sleep 3;
		deleteVehicle _unit;
	};
}];
};

if ((side player) == EAST) then {
	player execVM "scripts\markBlufor.sqf";
	if (player != VIP) then {
		waitUntil {time > 2};
		_weapons = weapons player;
		_magazines = magazines player;
		player addEventHandler ["Killed",{
		player spawn {
		_unit = _this;
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
			sleep 2;
			hidebody _unit; sleep 3;
			deleteVehicle _unit;
		};
	}];
	};
};

if (player == VIP) then {
player addEventHandler ["Killed",{
vipDead = true; publicVariable "vipDead";
}];

takeDocument = false;

[]spawn {
	while {!takeDocument} do {
		waituntil {sleep 0.5;((player distance document)<2.0)};
			if (!takeDocument) then {documentaction= player addaction ["Take document", "scripts\document.sqf"]};
		waituntil {sleep 0.5;((player distance document)>2.5)};
			if (!takeDocument) then {player removeaction documentaction};
		};
	};
};