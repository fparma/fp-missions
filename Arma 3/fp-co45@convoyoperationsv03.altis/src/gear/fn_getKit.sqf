// Gives specific loadouts to units (template-like)
// unit init example:
// [this,"PLT"] call FP_fnc_getKit
// uncomment next line if you do not want custom loadouts (or just remove init lines from in-game)
// if (true) exitWith {};

_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_kit = toUpper ([_this,1,"",[""]] call BIS_fnc_param);

if (local _unit) then {
	_unit setVariable ["FP_kit_type",_kit];
	[_unit,_kit] call FP_fnc_assignKit;
};