private ["_id","_unit"];
_id = _this select 2;
_unit = _this select 1;
_unit removeAction _id;
bags removeaction _id;

_unit setPosATL	[2596.8,4097.75,0.00143862]; 
_unit setDir 297;

_unit playMove "AinvPknlMstpSnonWrflDr_medic1";
sleep 10;
_unit playmove "AinvPknlMstpSnonWrflDnon_medicEnd";
sleep 2;
if (alive _unit) then {
buyDrugs = true; publicVariable "buyDrugs";
};