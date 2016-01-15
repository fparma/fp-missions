/*
	Executed only on server when mission is started.
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.
*/

// Create AI centers
local _allUnits = allUnits;
local _sideHasNoUnits = {
	params ["_side"];
	(({if ((side _x) isEqualTo _side) exitWith {1}} count _allUnits) isEqualTo 0)
};

if ([east] call _sideHasNoUnits) then {createCenter east};
if ([west] call _sideHasNoUnits) then {createCenter west};
if ([resistance] call _sideHasNoUnits) then {createCenter resistance};
if ([civilian] call _sideHasNoUnits) then {createCenter civilian};

{
	local _curator = _x;
	_curator addCuratorEditableObjects [vehicles,true];
	_curator addCuratorEditableObjects [(allMissionObjects "Man"),false];
	_curator addCuratorEditableObjects [(allMissionObjects "Air"),true];
	_curator addCuratorEditableObjects [(allMissionObjects "Ammo"),false];
	_curator setCuratorWaypointCost 0;
	{_curator setCuratorCoef [_x, 0]} forEach ["place","edit","delete","destroy","group","synchronize"];
} forEach allCurators;

if (FP_use_cleanUp) then {
	// clean up script
	// will not delete units dead on mission start
	// will not delete units where "this setVariable ["fp_noDelete", true]"
	[] execVM "base\scripts\clean_up.sqf";
};

if (!isNil "FP_JRM_fnc_init") then {
	[] call FP_JRM_fnc_init;
};

sleep 0.1;
// [] execvm "objects.sqf";


sleep 1;
_arr = [[[5340.17,6355.7,0.686617],289.394],
[[5340.54,6357.79,0.991909],269.826],
[[5338.66,6358.74,1.69543],198.794],
[[5337.26,6356.21,1.31067],18.1286],
[[5335.72,6356.91,1.72863],287.278],
[[5335.54,6359.7,3.31706],201.958]];
{
	removeAllWeapons _x;
	removeAllContainers _x;
	removeAllItems _x;
	removeAllAssignedItems _x;
	removeHeadgear _x;
	removeGoggles _x;
	_x setHit ["Hands", 0.8];
	_x setHit ["Torso", 0.5];
	_x allowDamage false;
	_pos = _arr select _forEachIndex;
	_x setPosATL (_pos select 0);
	_x setDir (_pos select 1);
	_x allowDamage true;
	["SetHandcuffed", _x, [_x, true]] call ace_common_fnc_targetEvent;
	_x allowDamage true;
} forEach [cap1, cap2, cap3, cap4, cap5, cap6];
