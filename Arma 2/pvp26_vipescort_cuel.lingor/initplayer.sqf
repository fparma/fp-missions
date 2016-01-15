private ["_tp1","_tp2"];
if (isDedicated) exitWith {};
"deathmark" setMarkeralphalocal 0.5;
"deathmark_1" setMarkeralphalocal 0.5;
"deathmark_2" setMarkeralphalocal 0.5;

if ((side player) == EAST) then {
_tp1 = spawnToLagosa addAction ["Teleport to Lagosa Base", "assassintp.sqf", "lagosa"];
_tp2 = lagosaToSpawn addAction ["Teleport to Spawn", "assassintp.sqf", "spawn"];

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
[] exec "scripts\cly_holster.sqs"
};

if ((side player) == WEST) then {
	player execVM "scripts\markBlufor.sqf";
	if (player != VIP) then {
[player, "escort"] execVM "loadout.sqf";
};
};

if (player == VIP) then {
player addEventHandler ["Killed",{
vipDead = true; publicVariable "vipDead";
}];

bags addaction ["Collect drugs", "vipobj\drugs.sqf"];

[]spawn {
	while {true} do{
		ccenter setPos (getPos VIP);
		sleep 10;
	};
};


[]spawn {
	while {!compareLab} do {
		waituntil {sleep 0.5;((player distance evidence)<2.0)};
			if (!compareLab) then {evidenceaction= player addaction ["Steal photos", "vipobj\evidence.sqf"]};
		waituntil {sleep 0.5;((player distance evidence)>2.5)};
			if (!compareLab) then {player removeaction evidenceaction};
		};
	};

[]spawn {
	while {!investigateFOB} do {
		waituntil {sleep 0.5;((player distance laptopFOB)<2.0)};
			if (!investigateFOB) then {laptopAction = player addaction ["Download data", "vipobj\foblaptop.sqf"]};
		waituntil {sleep 0.5;((player distance laptopFOB)>2.5)};
			if (!investigateFOB) then {player removeaction laptopAction};
		};
	};

[]spawn {
	while {!buyWeapons} do {
		waituntil {sleep 0.5;((player distance laptopWeapons)<2.0)};
			if (!buyWeapons) then {laptopActionWeapons = player addaction ["Purchase weapons", "vipobj\weaponslaptop.sqf"]};
		waituntil {sleep 0.5;((player distance laptopWeapons)>2.5)};
			if (!buyWeapons) then {player removeaction laptopActionWeapons};
		};
	};	
[]spawn {
while {!donateMoney} do {
		waituntil {sleep 0.5;((player distance satPhone)<2.0)};
			if (!donateMoney) then {satphoneaction = player addaction ["Call to make donation", "vipobj\satphone.sqf"]};
		waituntil {sleep 0.5;((player distance satPhone)>2.5)};
			if (!donateMoney) then {player removeaction satphoneaction};
		};
	};

[]spawn {
while {!visitPresident && alive president} do {
		waituntil {sleep 0.5;((player distance president)<4.0)};
			if (!visitPresident) then {presaction = player addaction ["Discuss with president", "vipobj\president.sqf"]};
		waituntil {sleep 0.5;((player distance president)>4.5)};
			if (!visitPresident) then {player removeaction presaction};
		};
	};	
[]spawn {
while {!getDrunk} do {
		waituntil {sleep 0.5;((player distance drinktable)<2.0)};
			if (!getDrunk) then {drinkaction = player addaction ["Try drinks", "vipobj\drink.sqf"]};
		waituntil {sleep 0.5;((player distance drinktable)>2.5)};
			if (!getDrunk) then {player removeaction drinkaction};
		};
	};	
if (time > 20) then {player setPos (getmarkerpos "Respawn")};	
	
};