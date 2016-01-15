// BAS f - ShackTactical - localMarker
// Version: 0-0-7 (2007-07-23)
// Modified at 2011 sometime
// Author(s): Fer | Raedor
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_grp","_mkrType","_mkrText","_mkrColor","_mkrName","_mkr"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_grp = _this select 0;
_mkrType = _this select 1;
_mkrText = _this select 2;
_mkrColor = _this select 3;
_mkrName = str format ["mkr_%1",_grp];

// ====================================================================================


// CREATE MARKER
	switch (_mkrType) do
	{
	// car
		case 0:
		{
			_mkr = createMarkerLocal [_mkrName,[(getPos _grp) select 0,(getPos _grp) select 1]];
			_mkr setMarkerShapeLocal "ICON";
			_mkrName setMarkerTypeLocal "b_motor_inf";
			_mkrName setMarkerColorLocal _mkrColor;
			_mkrName setMarkerSizeLocal [0.7, 0.7];
			_mkrName setMarkerTextLocal _mkrText;
		};
	// heli
		case 1:
		{
			_mkr = createMarkerLocal [_mkrName,[(getPos _grp) select 0,(getPos _grp) select 1]];
			_mkr setMarkerShapeLocal "ICON";
			_mkrName setMarkerTypeLocal "b_air";
			_mkrName setMarkerColorLocal _mkrColor;
			_mkrName setMarkerSizeLocal [0.7, 0.7];
			_mkrName setMarkerTextLocal _mkrText;
		};
	// Airplane
		case 2:
		{
			_mkr = createMarkerLocal [_mkrName,[(getPos _grp) select 0,(getPos _grp) select 1]];
			_mkr setMarkerShapeLocal "ICON";
			_mkrName setMarkerTypeLocal "b_plane";
			_mkrName setMarkerColorLocal _mkrColor;
			_mkrName setMarkerSizeLocal [0.7, 0.7];
			_mkrName setMarkerTextLocal _mkrText;
		};	

	// medevac 
		case 3:
		{
			_mkr = createMarkerLocal [_mkrName,[(getPos _grp) select 0,(getPos _grp) select 1]];
			_mkr setMarkerShapeLocal "ICON";
			_mkrName setMarkerTypeLocal "b_med";
			_mkrName setMarkerColorLocal _mkrColor;
			_mkrName setMarkerSizeLocal [0.7, 0.7];
			_mkrName setMarkerTextLocal _mkrText;
		};
	// armor
		case 4:
		{
			_mkr = createMarkerLocal [_mkrName,[(getPos _grp) select 0,(getPos _grp) select 1]];
			_mkr setMarkerShapeLocal "ICON";
			_mkrName setMarkerTypeLocal "b_armor";
			_mkrName setMarkerColorLocal _mkrColor;
			_mkrName setMarkerSizeLocal [0.7, 0.7];
			_mkrName setMarkerTextLocal _mkrText;
		};		
	};

// ====================================================================================
//Update marker position
	for [{_i=0}, {_i<=10000}, {_i=_i+1}] do
	{
		if ((alive _grp) && ((vehicle player) != player) && (count (crew _grp)) > 0) then 
		{
		
		_mkrName setMarkerAlphaLocal 1;
		_mkrName setMarkerPosLocal [(getPos _grp) select 0,(getPos _grp) select 1];
		}	
		else 
		{
			_mkrName setMarkerAlphaLocal 0;
		};
		sleep 6;
	};

// ====================================================================================


if (true) exitWith {};
