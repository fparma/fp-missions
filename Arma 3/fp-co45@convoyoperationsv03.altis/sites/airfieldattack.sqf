_gravia1 = ["NATO","gravia1",6,["area8"],"SAD"] call FP_fnc_spawnGroupWP; 
[_gravia1] execVM "src\spawn\loadouts\guer.sqf";
_gravia2 = ["NATO","gravia2",6,["area8"],"SAD"] call FP_fnc_spawnGroupWP; 
[_gravia2] execVM "src\spawn\loadouts\guer.sqf";
_gravia3 = ["NATO","gravia3",6,["area9"],"SAD"] call FP_fnc_spawnGroupWP; 
[_gravia3] execVM "src\spawn\loadouts\guer.sqf";

_military1 = ["NATO","military1",4,["area10"],"SAD"] call FP_fnc_spawnGroupWP; 
[_military1] execVM "src\spawn\loadouts\guer.sqf";
_military2 = ["NATO","military2",4,["area10"],"SAD"] call FP_fnc_spawnGroupWP; 
[_military2] execVM "src\spawn\loadouts\guer.sqf";
_military3 = ["NATO","military3",4,["area10"],"SAD"] call FP_fnc_spawnGroupWP; 
[_military3] execVM "src\spawn\loadouts\guer.sqf";

_aircar = ["B_G_Offroad_01_f",markerPos "airfieldcar",["airfieldcar_1","airfieldcar_2"]] call FP_fnc_spawnVehicle;
_A2AA = group _aircar; 
[_A2AA] execVM "src\spawn\loadouts\guer.sqf";

_aircargun = ["RDS_ZU23_FIA",markerPos "aircargun",["airfieldcar_1","airfieldcar_2"]] call FP_fnc_spawnVehicle;
_AA111 = group _aircargun; 
[_AA111] execVM "src\spawn\loadouts\guer.sqf";
_aircargun attachTo[_aircar,[0, -1.5, 1.7]];

_airapc = ["B_apc_wheeled_01_cannon_f",markerPos "airfieldarmor",["airfieldarmor_1","airfieldarmor_2"]] call FP_fnc_spawnVehicle;
_AIRAMB = group _airapc; 
[_AIRAMB] execVM "src\spawn\loadouts\guer.sqf";
_airapc setObjectTexture [0, "fp_misc\img\aluminummonster.paa"];