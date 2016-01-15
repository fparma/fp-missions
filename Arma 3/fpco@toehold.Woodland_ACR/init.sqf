// Run config
[] call compile preprocessFileLineNumbers "config.sqf";

// General FP init, don't remove
[] call compile preProcessFileLineNumbers "src\fp_init.sqf";

[[getPosATL covermap select 0, getPosATL covermap select 1], [1300, 1200], false] execVM "covermap.sqf";
