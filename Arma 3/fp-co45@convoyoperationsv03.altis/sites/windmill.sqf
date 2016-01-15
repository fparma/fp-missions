
_tankamb1 = ["NATO","tankamb1",6,["area20"],"SAD"] call FP_fnc_spawnGroupWP; 
[_tankamb1] execVM "src\spawn\loadouts\guer.sqf";
_tankamb2 = ["NATO","tankamb2",6,["area20"],"SAD"] call FP_fnc_spawnGroupWP; 
[_tankamb2] execVM "src\spawn\loadouts\guer.sqf";
_tankamb3 = ["NATO","tankamb3",6,["area20"],"SAD"] call FP_fnc_spawnGroupWP; 
[_tankamb3] execVM "src\spawn\loadouts\guer.sqf";

_windmillveh1 = ["B_mbt_01_cannon_f",markerPos "windmillveh1",["windmillveh1_1","windmillveh1_2"]] call FP_fnc_spawnVehicle;
_WMV1 = group _windmillveh1; 
[_WMV1] execVM "src\spawn\loadouts\guer.sqf";

_windmillveh2 = ["B_mbt_01_cannon_f",markerPos "windmillveh2",["windmillveh2_1","windmillveh2_2"]] call FP_fnc_spawnVehicle;
_WMV2 = group _windmillveh2; 
[_WMV2] execVM "src\spawn\loadouts\guer.sqf";