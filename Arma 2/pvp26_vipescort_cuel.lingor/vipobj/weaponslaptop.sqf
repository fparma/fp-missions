private ["_id","_unit"];
_id = _this select 2;
_unit = _this select 1;
_unit removeAction _id;

_unit setPosATL  [((getPosATL laptopWeapons) select 0)+1, ((getPosATL laptopWeapons) select 1), getPosATL laptopWeapons select 2];
_unit setdir ([_unit,getpos laptopWeapons] call BIS_fnc_dirTo);

_unit playMove "ActsPercSnonWnonDnon_tableSupport_TalkA";
sleep 40;

if (alive _unit) then {
buyWeapons = true; publicVariable "buyWeapons";
};
_unit removeAction _id;
