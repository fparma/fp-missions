//veh = ["spawnPos","upsArea"] execVM "dynamic\createEnemies.sqf"
if (isServer) then 
{
_spawnPos = _this select 0;
_upsArea = _this select 1;

_group1 = createGroup EAST;
_unit1 = _group1 createUnit ["cwr2_OfficerE_Night_W", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit2 = _group1 createUnit ["cwr2_SoldierE_Mortar_W", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit3 = _group1 createUnit ["cwr2_SoldierE_HG_W", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit4 = _group1 createUnit ["cwr2_SoldierE_MG_W", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit5 = _group1 createUnit ["cwr2_SoldierE_AT_W", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit6 = _group1 createUnit ["cwr2_SoldierE_GL_W", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit7 = _group1 createUnit ["cwr2_SoldierE_Sniper_W", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit8 = _group1 createUnit ["cwr2_SoldierE_W", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit9 = _group1 createUnit ["cwr2_SoldierE_W", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;
_unit10 = _group1 createUnit ["cwr2_SoldierE_W", [(getMarkerPos _spawnPos) select 0,(getMarkerPos _spawnPos) select 1,1], [], 1, "NONE"]; sleep 0.2;

{
removeAllItems _x;
_x addWeapon "ItemMap";
_x addWeapon "ItemCompass";
_x addWeapon "NVGoggles";
}forEach units _group1;


_unit1 setVehicleInit "group this setVariable [""CEP_disableCache"", true];";
processInitCommands;

[_unit1, _upsArea, "random", "nofollow"] execVM "scripts\UPSMON.sqf"; 
};
