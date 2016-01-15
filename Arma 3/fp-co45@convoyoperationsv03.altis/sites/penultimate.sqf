
_pen1 = ["NATO","pen1",6,["area21"],"SAD"] call FP_fnc_spawnGroupWP; 
[_pen1] execVM "src\spawn\loadouts\guer.sqf";
_pen2 = ["NATO","pen2",6,["area21"],"SAD"] call FP_fnc_spawnGroupWP; 
[_pen2] execVM "src\spawn\loadouts\guer.sqf";
_pen3 = ["NATO","pen3",6,["area21"],"SAD"] call FP_fnc_spawnGroupWP; 
[_pen3] execVM "src\spawn\loadouts\guer.sqf";

_penveh1 = ["B_mbt_01_tusk_f",markerPos "penveh1",["penveh1_1","penveh1_2"]] call FP_fnc_spawnVehicle;
_PV1 = group _penveh1; 
[_PV1] execVM "src\spawn\loadouts\guer.sqf";

_penveh2 = ["B_G_Offroad_01_f",markerPos "penveh2",["penveh2_1","penveh2_2"]] call FP_fnc_spawnVehicle;
_PV2 = group _penveh2; 
[_PV2] execVM "src\spawn\loadouts\guer.sqf";

_penveh2g = ["B_static_AT_F",markerPos "penveh2g",["penveh2_1","penveh2_2"]] call FP_fnc_spawnVehicle;
_PV2g = group _rodopveh2g; 
[_PV2g] execVM "src\spawn\loadouts\guer.sqf";
_penveh2g attachTo[_penveh2,[0, -1.5, 0.8]];