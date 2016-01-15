//veh = [this] execVM "source\gear\faltGear.sqf";
_unit = _this select 0;

_unit addWeapon "ACE_BackPack_ACR";
	 
[_unit,"SmokeShellGreen",2] call ACE_fnc_PackMagazine;
[_unit,"ace_c4_m",2] call ACE_fnc_PackMagazine;
[_unit,"pipebomb",1] call ACE_fnc_PackMagazine;