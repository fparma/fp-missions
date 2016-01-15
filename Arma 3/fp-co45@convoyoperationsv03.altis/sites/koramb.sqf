
_mines1 = ["NATO","mines1",6,["area19"],"SAD"] call FP_fnc_spawnGroupWP; 
[_mines1] execVM "src\spawn\loadouts\guer.sqf";
_mines2 = ["NATO","mines2",6,["area19"],"SAD"] call FP_fnc_spawnGroupWP; 
[_mines2] execVM "src\spawn\loadouts\guer.sqf";

_minesveh = ["B_apc_tracked_01_rcws_f",markerPos "minesveh",["minesveh_1","minesveh_2"]] call FP_fnc_spawnVehicle;
_MV = group _minesveh; 
[_MV] execVM "src\spawn\loadouts\guer.sqf";
_minesveh setObjectTexture [0, "fp_misc\img\fattymagoo.paa"];