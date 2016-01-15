/*
	 Executes side-specific gear scripts in \gear
*/

private ["_unit","_type","_side"];
_unit = _this select 0;

_type = toUpper(_this select 1);
_unit setvariable ["FP_kit_type",_type];

if (!local _unit) exitWith {};

// clear unit
removeAllWeapons _unit;
{_unit removeMagazine _x} foreach (magazines _unit);
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadGear _unit;
{
	_unit unassignItem _x;
	_unit removeItem _x;
} foreach (assignedItems _unit);

// Execute side-specific script
_side =  ([blufor,opfor,independent,civilian] find (side _unit));
[_unit,_type] call compile preprocessFileLineNumbers format ["gear\gear_%1.sqf", ["blufor","opfor","indep","civ"] select _side];