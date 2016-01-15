
private ["_id","_unit"];
_id = _this select 2;
_unit = _this select 1;

_unit setPosATL [getPosATL fetchSuitcase select 0, ((getPosATL fetchSuitcase) select 1)-1, getPosATL fetchSuitcase select 2];
_unit setdir ([_unit,getpos fetchSuitcase] call BIS_fnc_dirTo);

_unit playMove "AinvPknlMstpSnonWrflDnon_medic5";
sleep 10;
_unit playMove "AinvPknlMstpSnonWrflDnon_medic3";
sleep 10;
_unit playMove "AinvPknlMstpSlayWrflDnon_1";

if (alive _unit) then {
getSuitcase = true; publicVariable "getSuitcase"; // server is waiting for this var
_unit removeAction _id;
fetchSuitcase removeAction _id;
deleteVehicle fetchSuitcase;
};