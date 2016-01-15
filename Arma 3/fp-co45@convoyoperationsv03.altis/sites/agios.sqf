_area6g1 = ["NATO","area6g1",6,["area6"],"SAD"] call FP_fnc_spawnGroupWP; 
[_area6g1] execVM "src\spawn\loadouts\guer.sqf";

_AGITANK = ["B_mbt_01_tusk_f",markerPos "agitank",["agitankwp"]] call FP_fnc_spawnVehicle;
_ATG = group _AGITANK; 
[_ATG] execVM "src\spawn\loadouts\guer.sqf";

_agitruck = ["B_G_Offroad_01_f",markerPos "agitruck",["agitruck_1"]] call FP_fnc_spawnVehicle;
_AGT = group _agitruck; 
[_AGT] execVM "src\spawn\loadouts\guer.sqf";

_agitruckgun = ["RDS_ZU23_FIA",markerPos "agitruckgun",["agitruck_1"]] call FP_fnc_spawnVehicle;
_AGTG = group _agitruckgun; 
[_AGTG] execVM "src\spawn\loadouts\guer.sqf";
_agitruckgun attachTo[_agitruck,[0, -1.5, 1.6]];

_agi1 = ["NATO","agi1",4,["area14"],"SAD"] call FP_fnc_spawnGroupWP; 
[_agi1] execVM "src\spawn\loadouts\guer.sqf";
_agi2 = ["NATO","agi2",4,["area14"],"SAD"] call FP_fnc_spawnGroupWP; 
[_agi2] execVM "src\spawn\loadouts\guer.sqf";
_agi3 = ["NATO","agi3",8,["area14"],"SAD"] call FP_fnc_spawnGroupWP; 
[_agi3] execVM "src\spawn\loadouts\guer.sqf";
_agi4 = ["NATO","agi4",6,["area14"],"SAD"] call FP_fnc_spawnGroupWP; 
[_agi4] execVM "src\spawn\loadouts\guer.sqf";