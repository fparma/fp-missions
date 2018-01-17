/*
	Runs for everyone
  !!! This script does not guarantee that 'player' is defined, initPlayerLocal does
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.
*/

enableSaving [false,false];
enableCamShake true;
setViewDistance FP_VD;
setObjectViewDistance FP_OVD;
setTerrainGrid 25;

fp_uav_refuel = {
	params [["_uav", objNull, [objNull]], "_trigger"];
	if (isNull _uav || {_uav getVariable ["fp_inprogress", false]}) exitWith {};
	_uav setVariable ["fp_inprogress", true, true];

	[_uav, 0] remoteExecCall ["setFuel", _uav];
	[_uav, [0,0,0]] remoteExecCall ["setVelocity", _uav];
	titleText ["Refueling, Repairing, Rearming...", "PLAIN DOWN", 60];

	[{
		params ["_uav"];
		_uav setDamage 0;
		[_uav, 1] remoteExecCall ["setVehicleAmmo", _uav];
		[_uav, 1] remoteExecCall ["setFuel", _uav];
		titleText ["", "PLAIN"];
		[{
			params ["_uav"];
			_uav setVariable ["fp_inprogress", false, true];
		}, _uav, 30] call CBA_fnc_waitAndExecute;
	}, _uav, 60] call CBA_fnc_waitAndExecute;
};