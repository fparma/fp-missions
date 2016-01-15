_area6g1 = ["NATO","area6g1",6,["area6"],"SAD"] call FP_fnc_spawnGroupWP; 
[_area6g1] execVM "src\spawn\loadouts\guer.sqf";

_telosveh1 = ["B_G_Offroad_01_f",markerPos "telosv1",["telosv1wp"]] call FP_fnc_spawnVehicle;
_TV1 = group _telosveh1; 
[_TV1] execVM "src\spawn\loadouts\guer.sqf";

_telosv1g = ["B_static_AA_F",markerPos "telosv1g",["telosv1wp"]] call FP_fnc_spawnVehicle;
_TV1G = group _telosv1g; 
[_TV1G] execVM "src\spawn\loadouts\guer.sqf";
_telosv1g attachTo[_telosveh1,[0, -1.5, 0.8]];

_telosveh2 = ["B_G_Offroad_01_f",markerPos "telosv2",["telosv2wp"]] call FP_fnc_spawnVehicle;
_TV2 = group _telosveh2; 
[_TV2] execVM "src\spawn\loadouts\guer.sqf";

_telosv2g = ["RDS_ZU23_FIA",markerPos "telosv2g",["telosv2wp"]] call FP_fnc_spawnVehicle;
_TV2G = group _telosv2g; 
[_TV2G] execVM "src\spawn\loadouts\guer.sqf";
_telosv2g attachTo[_telosveh2,[0, -1.5, 1.6]];

_area7g1 = ["NATO","area7g1",6,["area7"],"SAD"] call FP_fnc_spawnGroupWP; 
[_area7g1] execVM "src\spawn\loadouts\guer.sqf";
_area7g1 = ["NATO","area7g1",6,["area7"],"SAD"] call FP_fnc_spawnGroupWP; 
[_area7g1] execVM "src\spawn\loadouts\guer.sqf";