_area3g = ["NATO","area3g",6,["area3"],"SAD"] call FP_fnc_spawnGroupWP; 
[_area3g] execVM "src\spawn\loadouts\guer.sqf";


_area4g1 = ["NATO","area4g1",4,["area4"],"SAD"] call FP_fnc_spawnGroupWP; 
[_area4g1] execVM "src\spawn\loadouts\guer.sqf";
_area4g2 = ["NATO","area4g2",4,["area4"],"SAD"] call FP_fnc_spawnGroupWP; 
[_area4g2] execVM "src\spawn\loadouts\guer.sqf";

0 = [ambush2trig,12,2,20] execVM "fp_scripts\artillery.sqf";

_a2v1 = ["B_G_Offroad_01_f",markerPos "a2v1",["a2v1wp1","a2v1wp2"]] call FP_fnc_spawnVehicle;
_A2AA = group _a2v1; 
[_A2AA] execVM "src\spawn\loadouts\guer.sqf";

_a2v1g = ["B_static_AT_F",markerPos "a2v1g",["a2v1wp1","a2v1wp2"]] call FP_fnc_spawnVehicle;
_AA1 = group _a2v1g; 
[_AA1] execVM "src\spawn\loadouts\guer.sqf";
_a2v1g attachTo[_a2v1,[0, -1.5, 0.8]];

_a2v2 = ["B_apc_tracked_01_rcws_f",markerPos "a2v2",["a2v2wp1","a2v2wp2"]] call FP_fnc_spawnVehicle;
_A2AT = group _a2v2; 
[_A2AT] execVM "src\spawn\loadouts\guer.sqf";
_a2v2 setObjectTexture [0, "fp_misc\img\fattymagoo.paa"];