
0 = [term1] execvm "fp_scripts\IED\largeIEDsilent.sqf";
sleep 0.4;
0 = [term2] execvm "fp_scripts\IED\largeIEDsilent.sqf";
sleep 1;
0 = [term3] execvm "fp_scripts\IED\IEDsilent.sqf";

_terminal1 = ["NATO","terminal1",6,["area11"],"SAD"] call FP_fnc_spawnGroupWP; 
[_terminal1] execVM "src\spawn\loadouts\guer.sqf";
_terminal2 = ["NATO","terminal2",6,["area11"],"SAD"] call FP_fnc_spawnGroupWP; 
[_terminal2] execVM "src\spawn\loadouts\guer.sqf";
_terminal3 = ["NATO","terminal3",6,["area12"],"SAD"] call FP_fnc_spawnGroupWP; 
[_terminal3] execVM "src\spawn\loadouts\guer.sqf";
_terminal4 = ["NATO","terminal4",10,["area12"],"SAD"] call FP_fnc_spawnGroupWP; 
[_terminal4] execVM "src\spawn\loadouts\guer.sqf";
