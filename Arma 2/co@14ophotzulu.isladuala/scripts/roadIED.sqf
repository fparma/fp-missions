/*
VEHICLE IED SCRIPT by SSG - Cuel
put a small trigger near your IED, activation once by the side that you want.

Put in trigger:
condition: getposATL (thisList select 0) select 2 < 3 && (vehicle (thisList select 0)) isKindOf "Car" 
USE THIS if you do NOT want APC's to trigger it. (the script still works on some APC's.)
condition: getposATL (thisList select 0) select 2 < 3 && (vehicle (thisList select 0)) isKindOf "Car" && !((vehicle (thisList select 0)) isKindOf "Wheeled_APC")
only human drivers:
condition: getposATL (thisList select 0) select 2 < 3 && (vehicle (thisList select 0)) isKindOf "Car"  && (isPlayer(driver (thisList select 0)))

on act: veh = [(vehicle (thisList select 0)),nameOfIED,"left/right"] execVM "roadIED.sqf";


params:
1 : (thisList select 0) << do not change
2:  name of object (ied)
3: "left" or "right".  << typo's etc will result in "right" (default).
*/

_car = _this select 0;
_ied = _this select 1;
_side = _this select 2;

if (isServer) then {	
	if (_ied == objNull) exitWith {hint "INVALID IED OBJECT"};
	if (toLower(_side) == "left") then {
	_side = "wheel_1_1_steering";
	}else{
	_side = "wheel_2_1_steering";
	};
	"B_30mm_HE" createVehicle [getPosATL _ied select 0,getPosATL _ied select 1,(getPosATL _ied select 2)+0.5]; 
	deleteVehicle _ied;
	sleep 0.3;
	_car setHit [_side,1];
};
