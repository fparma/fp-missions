/*
bon_ieds_ied_defused = position (_this select 0);
if(isServer) then{
	(position (_this select 0)) execVM (BON_IED_PATH+"ied_defusion_handler.sqf");
} else {
	publicVariable "bon_ieds_ied_defused";
};
*/

_ied = _this select 0;
_caller = _this select 1;

if(getNumber (configFile >> "CfgVehicles" >> typeof _caller >> "canDeactivateMines") == 1) then {
	deleteVehicle _ied;
} else {
	if(random 2 < 1) then {
		_delay = 3 + round random 2;
		hint format["%1 seconds",_delay];
		sleep _delay;
		_ied setvariable ["bon_ied_blowit",true,true];
		hint "";
	} else {deleteVehicle _ied};
};