private ["_tp1","_tp2","_tp3","_tp4","_tp5","_tp6","_mark"];
if (isDedicated) exitWith {};
"deathmark" setMarkeralphalocal 0.5;
"deathmark_1" setMarkeralphalocal 0.5;
"deathmark_2" setMarkeralphalocal 0.5;

if ((side player) == EAST) then {
_tp1 = spawnToTara addAction ["Teleport to Tara", "assassintp.sqf", "tara"];
_tp2 = spawnToSeraja addAction ["Teleport to Seraja", "assassintp.sqf", "seraja"];

_tp3 = taraToSpawn addAction ["Teleport to Spawn", "assassintp.sqf", "spawn"];
_tp4 = taraToSeraja addAction ["Teleport to Seraja", "assassintp.sqf", "seraja"];

_tp5 = serajaToSpawn addAction ["Teleport to Spawn", "assassintp.sqf", "spawn"];
_tp6 = serajaToTara addAction ["Teleport to Tara", "assassintp.sqf", "tara"];

player execVM "scripts\markAssassins.sqf";
[player, "assassin"] execVM "loadout.sqf";

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

if ((side player) == WEST) then {
	player execVM "scripts\markBlufor.sqf";
	if (player != VIP) then {
[player, "escort"] execVM "loadout.sqf";
};
};

if (player == VIP) then {
talkAction = talkOfficer addAction ["Talk to Officer", "obj\talk.sqf"];
suitCaseAction = fetchSuitcase addAction ["Take items from suitcase", "obj\suitcase.sqf"];
WireMoney =  0;

player addEventHandler ["Killed",{
vipDead = true; publicVariable "vipDead";
}];

while {WireMoney == 0 && !donateMoney} do {
	waituntil {sleep 0.5;((player distance laptop)<2.0) or (WireMoney == 1)};
		if (WireMoney == 0) then {laptopAction = player addaction ["Donate Money to hospital", "obj\laptop.sqf"]};
	waituntil {sleep 0.5;((player distance laptop)>2.5) or (WireMoney == 1)};
		if (WireMoney == 0) then {player removeaction laptopAction};
		
	};
};