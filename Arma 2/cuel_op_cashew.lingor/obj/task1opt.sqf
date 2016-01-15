if (!isServer) exitWith {};

if (!boomArt) then {
	sleep random 2;
	boomArt = true; publicVariable "boomArt";
	bomb = "R_57mm_HE" createVehicle getpos art1;
                        []spawn {
                                sleep 1;
                                        [-1, {smokeFX = [art1, 9, time, false, false] spawn BIS_Effects_Burn;}] call CBA_fnc_globalExecute;
                                };
	sleep random 1;
	bomb = "B_20mm_AA" createVehicle getpos art1;
	sleep random 1;
	bomb = "R_57mm_HE" createVehicle getpos art1;
sleep 3; 
};

if (!("taskopt1" call SHK_Taskmaster_isCompleted) && boomArt2) then {
["taskopt1", "succeeded"] call SHK_Taskmaster_upd; 
};
