private ["_id","_unit"];
_id = _this select 2;
_unit = _this select 1;
_unit removeAction _id;

_unit setPosATL [((getPosATL laptopFOB) select 0)-0.1, ((getPosATL laptopFOB) select 1)+0.7, getPosATL laptopFOB select 2];
_unit setdir ([_unit,getpos laptopFOB] call BIS_fnc_dirTo);

_unit playMove "ActsPercSnonWnonDnon_tableSupport_TalkA";
sleep 40;

if (alive _unit) then {
investigateFOB = true; publicVariable "investigateFOB";
};