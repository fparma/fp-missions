_rodop1 = ["NATO","rodop1",6,["area2"],"SAD"] call FP_fnc_spawnGroupWP; 
[_rodop1] execVM "src\spawn\loadouts\guer.sqf";
_rodop2 = ["NATO","rodop2",6,["area2"],"SAD"] call FP_fnc_spawnGroupWP; 
[_rodop2] execVM "src\spawn\loadouts\guer.sqf";

_rodopveh = ["B_G_Offroad_01_armed_f",markerPos "rodopveh1",["rvwp1","rvwp2"]] call FP_fnc_spawnVehicle;
_RV1 = group _rodopveh; 
[_RV1] execVM "src\spawn\loadouts\guer.sqf";

sleep 5;

0 = [smiley] execVM "fp_scripts\IED\IED.sqf";

sleep 20;

_rodop3 = ["NATO","rodop3",4,["area2"],"SAD"] call FP_fnc_spawnGroupWP; 
[_rodop3] execVM "src\spawn\loadouts\guer.sqf";
_rodop4 = ["NATO","rodop4",4,["area2"],"SAD"] call FP_fnc_spawnGroupWP; 
[_rodop4] execVM "src\spawn\loadouts\guer.sqf";

_rodopveh2 = ["B_G_Offroad_01_f",markerPos "rodopveh2",["rv2wp1","rv2wp2"]] call FP_fnc_spawnVehicle;
_RV2 = group _rodopveh2; 
[_RV2] execVM "src\spawn\loadouts\guer.sqf";

_rodopveh2g = ["B_static_AT_F",markerPos "rodopveh2g",["rv2wp1","rv2wp2"]] call FP_fnc_spawnVehicle;
_RV2g = group _rodopveh2g; 
[_RV2g] execVM "src\spawn\loadouts\guer.sqf";
_rodopveh2g attachTo[_rodopveh2,[0, -1.5, 0.8]];