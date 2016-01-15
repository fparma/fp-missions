_unit = _this select 0;

sleep 10;

removeheadgear _unit;
removegoggles _unit;
removeuniform _unit; 

_unit forceadduniform "rds_uniform_Functionary2";
_unit addgoggles "G_Aviator";