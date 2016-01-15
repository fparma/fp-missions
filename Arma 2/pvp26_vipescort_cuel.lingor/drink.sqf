private ["_id","_unit"];
_id = _this select 2;
_unit = _this select 1;
_unit removeAction _id;

disableuserinput true;
_unit playMove "ActsPercMrunSlowWrflDf_TumbleOver";
_unit setposatl [((getPosATL drinktable) select 0)+0.1, ((getPosATL drinktable) select 1)-0.7, getPosATL drinktable select 2];
_unit setdir (([_unit,getpos laptopFOB] call BIS_fnc_dirTo)-90);
sleep 5;
disableuserinput false;
if (alive _unit) then {
	getDrunk = true; publicVariable "getDrunk";
};