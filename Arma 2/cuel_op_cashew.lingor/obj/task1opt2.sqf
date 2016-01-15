if (!isServer) exitWith {};

if (!boomArt2) then {
	sleep random 2;
	boomArt2 = true; publicVariable "boomArt2";
	bomb = "R_57mm_HE" createVehicle getpos art2;
                        []spawn {
                                sleep 1;
                                        [-1, {smokeFX2 = [art2, 9, time, false, false] spawn BIS_Effects_Burn;}] call CBA_fnc_globalExecute;
                                };
	sleep random 1;
	bomb = "B_20mm_AA" createVehicle getpos art2;
	sleep random 1;
	bomb = "R_57mm_HE" createVehicle getpos art2;
sleep 3; 
};

if (!("taskopt1" call SHK_Taskmaster_isCompleted) && boomArt) then {
["taskopt1", "succeeded"] call SHK_Taskmaster_upd; 
};
