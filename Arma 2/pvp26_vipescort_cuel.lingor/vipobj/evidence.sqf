private ["_id","_unit"];
_id = _this select 2;
_unit = _this select 1;
_unit removeAction _id;
sleep 0.5;
deleteVehicle evidence;
compareLab = true; publicVariable "compareLab";