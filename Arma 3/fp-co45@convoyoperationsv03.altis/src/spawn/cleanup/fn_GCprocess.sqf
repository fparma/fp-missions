if (!isServer) exitWith {};
// Save all units that are dead on mission start
waitUntil {sleep 2; time > 10};
private ["_startingUnits","_tmp","_unit","_delay"];
_startingUnits = allDeadMen;
while {true}do 
{
	if (count FP_gc_queue > 0) then 
	{
		for "_i" from 0 to (count FP_gc_queue)-1 do 
		{
			_unit = FP_gc_queue select _i;
			_delay = if (_unit isKindOf "Man") then {300} else {500};
			if (((_unit getVariable ["fp_added",100])+ _delay) < time ) then 
			{
				if !([_unit,200] call CBA_fnc_nearPlayer) then 
				{
					FP_gc_queue set [_i,objNull];
					_unit spawn 
					{
						if (_this isKindOf "Man") then 
						{
							hideBody _this;
							sleep 10;
							_tmp = group _this;
							if (count units _tmp == 0) then {deleteVehicle _this; deleteGroup _tmp};
						};
						if (!isNull _this) then {
							deleteVehicle _this;
						};
					};
				};
			};
		sleep 0.2;
		};		
	FP_gc_queue = FP_gc_queue - [objNull];
	}
	else
	{
		sleep 8;
		{
			sleep 0.2;
			if (!(_x in FP_gc_queue) && !(_x in _startingUnits)) then {
				[_x] call FP_fnc_addTrash;
			}
		}forEach allDeadMen;
	};
	sleep 5;
};