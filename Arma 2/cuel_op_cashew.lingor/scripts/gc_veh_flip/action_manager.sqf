// General Carver Vehicle Flip Script Flip Over action manager script.
// Author: GeneralCarver
// Date: 10/18/2010
// Version: 1
// Description: This script manages the turn over action added to vehicles which have turned over. The script checks to make sure the nearest vehicle's class is supported, if its alive, if the player is on foot, and if the vehicle is empty and its up vector is not 0.





// ========================================================================================
// Define Variables

private ["_potential_veh", "_veh_array_count", "_veh_array", "_debug", "_debug_sleep", "_veh_up_vector", "_player_up_vector", "_flipped_veh", "_flip_veh_act_id"];

_veh_array_count = 0;
_veh_array = [];
_flipped_veh = player;
_debug = false;
_debug_sleep = 3;
_flip_veh_act_id = 9999;

// End Define Variables
// ========================================================================================





// ========================================================================================
// Begin Script...

if (_debug) then {player sidechat "script started. entering while loop."; sleep _debug_sleep;};

while {local player} do 
	{
	if (_debug) then {player sidechat "Script Started."; sleep _debug_sleep;};
	// checking if flip action is added...
	if (_debug) then {player sidechat "Checking if flip action is added..."; sleep _debug_sleep;};
	if (_flip_veh_act_id == 9999) then 
		{
		// action is not added. continuing with checking adding conditions...
		if (_debug) then {player sidechat "action is not added. continuing with checking adding conditions..."; sleep _debug_sleep;};
		// capture nearest vehicles to player supported by script.
		_veh_array = nearestObjects [player, ["Car", "Motorcycle"], 15];
		if (_debug) then {player sidechat ("Vehicle Array: " + (str _veh_array)); sleep _debug_sleep;};

		// count array to see if any vehicle present beforing continuing
		if (_debug) then {player sidechat "Checking to see if any supported vehicles present before continuing..."; sleep _debug_sleep;};
		_veh_array_count = count _veh_array;
		if (_veh_array_count > 0) then 
			{
			// vehicles supported by script present, continue with checking conditions.
			// make sure player is not in vehicle
			if (_debug) then {player sidechat "Checking to see if player is in a vehicle..."; sleep _debug_sleep;};
			if (vehicle player == player) then 
				{
				if (_debug) then {player sidechat "Player is not in vehicle, continuing..."; sleep _debug_sleep;};
				// capturing closest vehicle to player.
				if (_debug) then {player sidechat "Capturing closest vehicle..."; sleep _debug_sleep;};
				_potential_veh = _veh_array select 0;
				if (_debug) then {player sidechat ("Potential tipped vehicle: " + (str _potential_veh)); sleep _debug_sleep;};
				// check if vehicle is alive...
				if (_debug) then {player sidechat "Checking if vehicle is alive..."; sleep _debug_sleep;};
				if (damage _potential_veh < 1) then 
					{
					// vehicle is not destroyed, check if vehicle is empty.
					if (_debug) then {player sidechat "Vehicle is alive. checking if vehicle has crew..."; sleep _debug_sleep;};
					if (count crew _potential_veh == 0) then 
						{
						// vehicle is empty. checking to see if it can move
						if (_debug) then {player sidechat "vehicle is empty. checking to see if it can move..."; sleep _debug_sleep;};
						if (!canmove _potential_veh) then 
							{
							// vehicle cannot move. checking to see if vehicle's up vector is different than player's.
							if (_debug) then {player sidechat "vehicle cannot move. checking to see if vehicle's up vector is different than players."; sleep _debug_sleep;};
							_veh_up_vector = vectorUp _potential_veh;
							_player_up_vector = vectorUp player;
							if (_veh_up_vector select 2 == _player_up_vector select 2) then 
								{
								// up vectors are the same. aborting adding action.
								if (_debug) then {player sidechat "up vectors are the same. aborting adding action."; sleep _debug_sleep;};
								} else 
								{
								// up vectors are different. check if action is already issued.
								if (_debug) then {player sidechat "up vectors are different. check if action is already issued."; sleep _debug_sleep;};
								if (_flipped_veh == _potential_veh) then 
									{
									// vehicles are the same. aborting adding action.
									if (_debug) then {player sidechat "vehicles are the same. aborting adding action."; sleep _debug_sleep;};
									} else 
									{
									// vehicles are different. adding action.
									if (_debug) then {player sidechat "Adding Action..."; sleep _debug_sleep;};
									_flipped_veh = _potential_veh;
									_flip_veh_act_id = _flipped_veh addaction ['<t color="#FF0000">' + "Turn Over Vehicle" + '</t>', "scripts\gc_veh_flip\flip_veh.sqf", _flipped_veh, 1, true, true, "", ""];
									if (_debug) then {player sidechat "Action added."; sleep _debug_sleep;};
									};
								};
							} else 
							{
							// vehicle can move still. Aborting checking conditions.
							if (_debug) then {player sidechat "vehicle can move still. Aborting checking conditions."; sleep _debug_sleep;};
							};
						} else 
						{
						// vehicle is not empty, cancel checking conditions.
						if (_debug) then {player sidechat "Vehicle still manned. Aborting checking conditions."; sleep _debug_sleep;};
						};
					} else 
					{
					// vehicle is destroyed, abort checking conditions.
					if (_debug) then {player sidechat "Vehicle is destroyed. Aborting checking conditions."; sleep _debug_sleep;};
					};
				} else 
				{
				// player is inside a vehicle, abort checking conditions.
				if (_debug) then {player sidechat "Player is in a vehicle. Aborting conditions check."; sleep _debug_sleep;};
				};
			} else 
			{
			if (_debug) then {player sidechat "No supported vehicles near playing."; sleep _debug_sleep;};
			};
		} else 
		{
		// action is added. Aborting checking conditions to add action.
		if (_debug) then {player sidechat "action is added. Aborting checking conditions to add action."; sleep _debug_sleep;};
		};

	// check if action is added and remove if conditions not meet.
	if (_debug) then {player sidechat "Finished managing adding action. Begin checking conditions to remove action..."; sleep _debug_sleep;};
	if (_flip_veh_act_id == 9999) then 
		{
		// action not added. aborting checking removal conditions.
		if (_debug) then {player sidechat "action not added. aborting checking removal conditions."; sleep _debug_sleep;};
		} else 
		{
		// action added, checking removal conditions.
		if (_debug) then {player sidechat "action added, checking removal conditions."; sleep _debug_sleep;};
		if (_debug) then {player sidechat "checking to see if vehicle can move..."; sleep _debug_sleep;};
		if (canmove _flipped_veh) then 
			{
			if (_debug) then {player sidechat "Vehicle can move, removing action..."; sleep _debug_sleep;};
			_flipped_veh removeaction _flip_veh_act_id;
			_flip_veh_act_id = 9999;
			_flipped_veh = player;
			if (_debug) then {player sidechat "Action removed."; sleep _debug_sleep;};
			} else 
			{
			// vehicle cannot move. leave action.
			if (_debug) then {player sidechat "vehicle cannot move."; sleep _debug_sleep;};
			// checking to see if player is too far from vehicle...
			if (_debug) then {player sidechat "Checking to see if vehicle is too far from player..."; sleep _debug_sleep;};
			if (getpos player distance getpos _flipped_veh > 20) then 
				{
				// player is too far from vehicle, removing action.
				if (_debug) then {player sidechat "player is too far from vehicle, removing action..."; sleep _debug_sleep;};
				_flipped_veh removeaction _flip_veh_act_id;
				_flip_veh_act_id = 9999;
				_flipped_veh = player;
				if (_debug) then {player sidechat "Action removed."; sleep _debug_sleep;};
				} else 
				{
				// nothing. player is still within range of vehicle.
				if (_debug) then {player sidechat "Leaving Action. Player is still within range of vehicle."; sleep _debug_sleep;};
				};
			};
		};

	// pause before looping script
	sleep 1;
	if (_debug) then {player sidechat "Script looping..."; sleep _debug_sleep;};
	};

// End Script
// ========================================================================================




// ========================================================================================
// Change Log

/*

v1 - 10/18/10 - created and released.

*/