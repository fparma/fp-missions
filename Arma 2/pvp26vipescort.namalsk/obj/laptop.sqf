
private ["_id","_unit"];
_id = _this select 2;
_unit = _this select 1;
_unit removeAction _id;

_unit setPosATL [((getPosATL laptop) select 0)+0.4, ((getPosATL laptop) select 1)-0.4, getPosATL laptop select 2];
_unit setdir ([_unit,getpos laptop] call BIS_fnc_dirTo);

_unit playMove "ActsPercSnonWnonDnon_tableSupport_TalkA";
sleep 40;

if (alive _unit) then {
WireMoney = 1; publicVariable "WireMoney";
sleep 1;
donateMoney = true; publicVariable "donateMoney"; // server is waiting for this var
};
_unit removeAction _id;
laptop removeAction _id;
