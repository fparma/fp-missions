
_type = toUpper FP_end;

switch (_type) do {

	case "OPFORDEAD": {
		sleep 2;
		[{["End1",true,true] call BIS_fnc_endMission},'BIS_fnc_spawn',nil,true] call BIS_fnc_MP;
	};
	case "BLUFORDEAD": {
		sleep 2;
		[{["End2",true,true] call BIS_fnc_endMission},'BIS_fnc_spawn',nil,true] call BIS_fnc_MP;
	};
	case "TRUCKARMED": {
		sleep 2;
		if (!isDedicated) then {
			cutText ["", "BLACK", 0];
			sleep 1.2;
			setViewDistance 5000;
			setObjectViewDistance 4000;
			showCinemaBorder true;

			_cam = "camera" camCreate [0,0,0];
			_cam cameraEffect ["internal", "back"];
			_pos = getPosASL glEndNuke;
			_pos set [2, 300];
			_cam camSetPos _pos;
			_cam camSetTarget tempest;
			_cam camSetFov 0.05;
			_cam camCommit 0;
			cutText ["", "BLACK IN", 2];
			sleep 1;
			_cam camPrepareFov 0.7;
			_cam camCommitPrepared 6;
			sleep 2;
			mdh_nuke_destruction_zone	= 0;
			mdh_nuke_camshake			= 1;
			mdh_nuke_ash				= 0;
			mdh_nuke_colorcorrection	= 1;
			0 = [] execVM "nuke\nuke.sqf";
			sleep 6;
		}else{
			sleep 10.2;
		};
		[{["End4",true,true] call BIS_fnc_endMission},'BIS_fnc_spawn',nil,true] call BIS_fnc_MP;
	};
	case "BLUFORARRIVED": {
		if (isServer) then {
			[] spawn {
					tank1 hideObjectGlobal false;
					tank1 enableSimulationGlobal true;
					sleep 2;
					tank2 hideObjectGlobal false;
					tank2 enableSimulationGlobal true;
			};
		};
		if (!isDedicated) then {
			sleep 4;
			cutText ["", "BLACK", 0];
			sleep 1.2;
			showCinemaBorder true;
			_cam = "camera" camCreate [0,0,0];
			_cam cameraEffect ["internal", "back"];
			_pos = getPosASL glEnd;
			_pos set [2, 20];
			_cam camSetPos _pos;
			_cam camSetTarget tank1;
			_cam camSetFov 0.6;
			_cam camCommit 0;
			cutText ["", "BLACK IN", 2];
			sleep 6;
		}else{
			sleep 11.2;
		};
		[{["End3",true,true] call BIS_fnc_endMission},'BIS_fnc_spawn',nil,true] call BIS_fnc_MP;
	};
	default {
		hint "mission should have ended, bug?"
	};
};
