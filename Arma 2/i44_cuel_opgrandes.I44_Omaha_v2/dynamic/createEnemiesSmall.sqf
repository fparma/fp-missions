//veh = ["spawnPos","upsArea"] execVM "dynamic\createEnemiesSmall.sqf"
if (isServer) then 
{
_spawnPos = _this select 0;
_upsArea = _this select 1;

_group1 = createGroup EAST;
_unit1 = _group1 createUnit ["I44_Man_G_WH_G43", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit2 = _group1 createUnit ["I44_Man_G_WH_MP40", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit3 = _group1 createUnit ["I44_Man_G_WH_K98k_PzF30", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit4 = _group1 createUnit ["I44_Man_G_WH_K98k_GGrGer", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;

_unit1 setVehicleInit "group this setVariable [""CEP_disableCache"", true];";
processInitCommands;

[_unit1, _upsArea, "random", "nofollow"] execVM "scripts\UPSMON.sqf"; 
};
