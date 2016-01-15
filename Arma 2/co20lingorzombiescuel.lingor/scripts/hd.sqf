private ["_id","_unit"];
_id = _this select 2;
_unit = _this select 1;
_unit removeAction _id;

_unit  setPosATL [((getPosATL computar) select 0)-1, ((getPosATL computar) select 1)-1, getPosATL computar select 2];
_unit setdir ([_unit,getpos computar] call BIS_fnc_dirTo);

_unit playMove "AinvPknlMstpSnonWrflDr_medic1";
sleep 10;
_unit playmove "AinvPknlMstpSnonWrflDnon_medicEnd";
sleep 2;
if (alive _unit) then {
harddrive = true; publicVariable "harddrive";
};