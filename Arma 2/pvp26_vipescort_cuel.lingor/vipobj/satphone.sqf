private ["_id","_unit"];
_id = _this select 2;
_unit = _this select 1;
_unit removeAction _id;

if (alive _unit) then {
donateMoney = true; publicVariable "donateMoney";
};