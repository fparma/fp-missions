//playSound "introMusic";

if (isServer) then {
	[] spawn {
		//[["c1", "c2", "c3", "c4"],[c1,c4,c2,c3,c5],true] execVM "convoyDefend\convoyDefend_init.sqf";
		{_x enableSimulationGlobal true; _x hideObjectGlobal false} foreach list introList;
		FP_convoyGo = true; publicVariable "FP_convoyGo";
		uaz action ["LightOn", uaz];
		sleep 4;
		FP_introStart = true; publicVariable "FP_introStart";
		sleep 4;
		{sleep (.3 + random 1); _x enableAI "MOVE"; _x doMove (markerpos "civrun");} foreach [civ, civ_1,civ_2];
		sleep 6;
		{deleteVehicle _x} foreach [civ, civ_1,civ_2];
		// clean up
		sleep 35;
		{
			{deleteVehicle _x} foreach crew _x;
			deleteVehicle _x;
		}foreach list introList;
	};
};

if (!isDedicated) then {

	cutText ["", "BLACK OUT", 3];
	playSound "fp_indeep";
	waituntil {!isnil "FP_introStart"};
	cutText ["", "BLACK IN", 4];
	_camera = "camera" camcreate [0,0,0];
	_camera cameraeffect ["internal", "back"]; 

	// SETS BLACK BARS ON THE TOP AND BOTTOM OF THE SCREEN WHILE THE INTRO PLAYS 
	showcinemaborder true; 

	_camera camSetTarget t1;
	_pos = getPosATL cam1;
	_pos set [2,4];
	_camera camSetPos _pos;
	_camera camSetFov 0.1;
	_camera camCommit 0;

	_pos = getPosATL cam2;
	_pos set [2, 5];
	_camera camPreparePos _pos;
	_camera camPrepareFov 0.3;
	_camera camCommitPrepared 8;
	sleep 8;

	_pos = getPosATL cam3;
	_pos set [2, 5];
	_camera camPreparePos _pos;
	_camera camPrepareTarget t2;
	_camera camPrepareFov 0.5;
	_camera camCommitPrepared 5;
	sleep 5;

	_pos = getPosATL cam4;
	_pos set [2, 6];
	_camera camPreparePos _pos;
	_camera camCommitPrepared 20;
	sleep 1;
	[
		[
			["Operation ","underline='true' align = 'left' shadow = '1' size = '1.2' font='PuristaBold'"],
			["Toehold","underline='true' align = 'left' shadow = '1' size = '1.2'"],
			["","<br/>"],
			["by Cuel, Mallow, Tinter","align = 'left' shadow = '0.6' size = '1.0'"]
		]

	] spawn BIS_fnc_typeText2;

	sleep 14;
	cutText ["", "BLACK OUT", 4];
	sleep 4;
	// FADE OUT TO ACTUAL GAME 
	cutText ["", "BLACK IN", 3];
	_camera cameraEffect ["terminate","back"]; 
	showCinemaBorder false;
	camDestroy _camera;
};