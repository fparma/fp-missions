/**
* Generated by LEA for Arma 2 Combined Operation & ACE 2
* Version: 1.3.61
* Init call for loadout scripts.
*/

enable_lea_addon = false;
ace_sys_wounds_no_medical_gear = true;

if ((!isServer) && (player != player)) then {
	waitUntil {player == player};
};

if (!(player getVariable ["lea_already_connected", false])) then {
	while {!(player getVariable "lea_already_connected")} do {
	  sleep 1;
	};
	player setVariable ["lea_already_connected", true, true];
	_dummy = [] execVM "lea\loadout.sqf";
};

if (isServer) then {
	_dummy = [] execVM "lea\loadout.sqf";
};
