
_oreo1 = ["NATO","oreo1",4,["area22"],"SAD"] call FP_fnc_spawnGroupWP; 
[_oreo1] execVM "src\spawn\loadouts\guer.sqf";
_oreo2 = ["NATO","oreo2",4,["area22"],"SAD"] call FP_fnc_spawnGroupWP; 
[_oreo2] execVM "src\spawn\loadouts\guer.sqf";
_oreo3 = ["NATO","oreo3",6,["area22"],"SAD"] call FP_fnc_spawnGroupWP; 
[_oreo3] execVM "src\spawn\loadouts\guer.sqf";

_oreo4 = ["NATO","oreo4",6,["area22"],"SAD"] call FP_fnc_spawnGroupWP; 
[_oreo4] execVM "src\spawn\loadouts\guer.sqf";
_oreo5 = ["NATO","oreo5",6,["area23"],"SAD"] call FP_fnc_spawnGroupWP; 
[_oreo5] execVM "src\spawn\loadouts\guer.sqf";


_oreoveh1 = ["B_G_Offroad_01_armed_f",markerPos "oreoveh1",["oreoveh1_1","oreoveh1_2"]] call FP_fnc_spawnVehicle;
_OV1 = group _oreoveh1; 
[_OV1] execVM "src\spawn\loadouts\guer.sqf";

_oreoveh2 = ["B_G_Offroad_01_armed_f",markerPos "oreoveh2",["oreoveh2_1","oreoveh2_2"]] call FP_fnc_spawnVehicle;
_OV2 = group _oreoveh2; 
[_OV2] execVM "src\spawn\loadouts\guer.sqf";

