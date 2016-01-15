if (!isServer) exitWith {};
private ["_loc", "_rad", "_units"];

_loc = _this select 0;
_rad = _this select 1;

_units = nearestObjects [_loc, ["Man"], _rad];

{
if (!isPlayer _x) then {deleteVehicle _x};
}forEach _units;
