/* 

Simple Body Removal Script
Created by Rob

Requires: CBA

*/

if (isServer) then
{
	private ["_checkDistance","_distCheck"];
	_checkDistance = 300;

	while {sleep 300;true} do
	{
		{
			_distCheck = [_x,_checkDistance] call CBA_fnc_nearPlayer;
			sleep 0.3;

			if (!_distCheck) then 
			{
				deleteVehicle _x;
			};

		} forEach allDead;
    };
};