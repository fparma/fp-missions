//veh = [this] execVM "source\gear\medicGear.sqf";

_unit = _this select 0;
	
[_unit,"ACE_Medkit",10] call ACE_fnc_PackMagazine;	 
[_unit,"ACE_LargeBandage",7] call ACE_fnc_PackMagazine;	 
[_unit,"ACE_Bandage",10] call ACE_fnc_PackMagazine; 
[_unit,"ACE_Epinephrine",10] call ACE_fnc_PackMagazine;
[_unit,"ACE_Morphine",10] call ACE_fnc_PackMagazine;