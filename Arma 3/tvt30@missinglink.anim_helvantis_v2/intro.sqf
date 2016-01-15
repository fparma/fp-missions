if (isDedicated) exitWith {};
0 fadeSound 0;
waitUntil {time > 0};
if (time > 10) exitWith {0 fadeSound 1};
cutText ["", "BLACK", 0];
// black screen

sleep 1.2;

// black bars at top and bottom of screen
showCinemaBorder true;

// create the camera
_cam = "camera" camCreate [0,0,0];
_cam cameraEffect ["internal", "back"];

// set the position of the camera, it will be the game logic and -10 meters above the sea level
_pos = getPosASL gl1;
_pos set [2, 10];
_cam camSetPos _pos;
_cam camSetTarget tempest;
_cam camCommit 0; // commit in 0 seconds, we just want to switch it over there instantly

[] spawn {
	// Fade in from black
	sleep 1;
	cutText ["", "BLACK IN", 2];
	4 fadeSound 1;
	sleep 1;
	[
		[
			["Missing Link ","align = 'left' shadow = '1' size = '1.2' font='PuristaBold'"],
			["by Cuel","align = 'left' shadow = '0.6' size = '0.6'"]
		]
	] spawn BIS_fnc_typeText2;
	sleep 3;
	_str = "<t font='TahomaB' size='0.7' shadow='1' color='#237176'>OPFOR: activate device (action menu, takes 20sec) <br/>BLUFOR: defend device until reinforcements arrive</t>";
	[_str,0,1,6,0,0,499] spawn BIS_fnc_dynamicText;
};
// FF9500

// prepare the second position
_pos = getPosASL gl2;
_pos set [2, 15];
_cam camPreparePos _pos;
_cam camCommitPrepared 6;
sleep 6;

_pos = getPosASL gl3;
_pos set [2, 20];
_cam camPreparePos _pos;
_cam camCommitPrepared 6;
sleep 5;

// fade out to black
cutText ["", "BLACK OUT", 2];
sleep 2;
// destroy the camera
_cam cameraEffect ["terminate", "back"];
camDestroy _cam;

// remove borders
showCinemaBorder false;

// fade in
cutText ["", "BLACK IN", 2];
