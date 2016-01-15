//by Bon_Inf*
//


BON_LASER_PATH = "bon_lasertargeting\";

// classes that can use the bomber
bon_laser_classes = tfor_sniper; //bon_laser_classes = [];

// type of plane that can be called in
bon_laser_planetype = "cwr2_A10LGB";

// track bomber and its assigned target if you want
bon_laser_debug = false;

// you're done here.



if(isServer) then{
	bon_laser_bomber addPublicVariableEventHandler {
		(_this select 1) spawn {
			_bomber = _this select 0;
			_player = _this select 1;
			_pilot = driver _bomber;

			While{damage _bomber < 1 && isPlayer _player && alive _pilot && vehicle _pilot != _pilot} do{sleep 5};
			sleep 20;
			deleteVehicle _bomber;
			sleep 1;
			deleteVehicle _pilot;
		};
	};
};



if(isDedicated) exitWith{};
if(not (typeOf player in bon_laser_classes) && count bon_laser_classes > 0) exitWith{};

cas = false;
hasBombed = false;

bon_laser_side = playerSide;

bon_laser_condition = "currentWeapon player=='Laserdesignator'";


getMyLaserTarget = compile (preprocessFileLineNumbers (BON_LASER_PATH+"func_getmylasertarget.sqf"));
sleep 0.1;
waitUntil {sleep 5;cas};

bon_laser_action = player addAction ["Call in Bomber",(BON_LASER_PATH+"doLaser.sqf"),[],-1,false,true,"",bon_laser_condition];

player addEventHandler ["KILLED",{
	[] spawn {
		WaitUntil{alive player};
		player removeAction bon_laser_action;
		bon_laser_action = player addAction ["Call in Bomber",(BON_LASER_PATH+"doLaser.sqf"),[],-1,false,true,"",bon_laser_condition];
	};
}];