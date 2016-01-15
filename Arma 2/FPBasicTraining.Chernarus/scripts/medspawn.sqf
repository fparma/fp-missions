// by Cuel

_type = _this select 3;
_areamarker = getMarkerPos "medtrainingspawn";
if (isNil "medUnit") then {medUnit = objNull};

if (_type == 0) then {
	if (!isNull medUnit) exitWith {hint "there's a target already"};
	_grp = createGroup WEST;
	medUnit = _grp createUnit ["USMC_Soldier",_areamarker, [], 0, "FORM"];
	medUnit setVehicleInit "doStop this";
	processInitCommands;
	sleep 1;
	[medUnit,0.7] call ace_sys_wounds_fnc_addDamage;
	publicVariable "medUnit";
}else{
	deleteVehicle medUnit;
	medUnit = objNull;
	publicVariable "medUnit";
};