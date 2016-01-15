if (!isDedicated && isNull player) then { waitUntil {!isNull player}; };
server execVM "revive_init.sqf";
BIS_Effects_Burn = compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";	

// *******************
introDone = false;
ejectAll = false;
//********************

if (isServer) then {
	["Respawn", true] call CBA_fnc_setMarkerPersistent;
	_crater = "CraterLong" createVehicle position wreck;
_crater setposatl [getPosATL wreck select 0, getPosATL wreck select 1,-0.2]; 
[-1, {smokeFX = [firewreck, 7, time, false, false] spawn BIS_Effects_Burn;}] call CBA_fnc_globalExecute;
};

[[
],[
["Mission notes", "<br><br/>around 18:45 an allied helicopter was shot down in Kulgojev. Intel suggests that one of the pilots is still alive. Your objective is to: <br><br/><br><br/>1. Find the crash site and secure it, look for the two pilots. <br><br/><br><br/>2. If there are no bodies to be found, this is going to be a tough one. High command demands that the pilots are to be rescued. There are 3 camps near the crash site. It's likely that the enemy has taken the pilots to one of these camps. There's also some ruins that are worth investigating. Infiltrate or attack the camps and then proceed to search the camps for the pilots. Enemy resistance in this area is strong. Good luck. <br><br/>"],
["Credits","Made by cuel for FP Arma 2."]

]]execVM "shk_taskmaster.sqf";

// world initialization before mission is launched
finishMissionInit;

if (!isDedicated) then {
player setVariable ["BIS_noCoreConversations", true];
player enableGunLights false;
if (alive pilot1) then {pilot1 addAction ['capture','scripts\capture.sqf'];};
if (alive pilot2) then {pilot2 addAction ['capture','scripts\capture.sqf'];};

if (time < 5)then {
player exec "intro.sqs";
};
};



if (isServer) then {
killheligroup setCombatMode "BLUE";
zu23 reveal [crashheli, 0];
sleep 5;
zu23 reveal [crashheli, 4];
zu23 doTarget crashheli;
killheligroup setCombatMode "RED";
zu23 doFire crashheli;
crashheli setFuel 0;
sleep 7;
crashheli setdamage 1;
agony switchMove "AinjPpneMstpSnonWrflDnon";

waitUntil {introDone};
	{
	deleteVehicle _x;
	}forEach [aa,agony,zu23,crashheli,firewreck];
sleep 5;
	helitransport lock true;
	helitransport_1 lock true;
	waitUntil {ejectAll};
	helitransport lock false;
	helitransport_1 lock false;
	{
		unassignvehicle _x;
		_x action ["EJECT", helitransport];
		sleep 0.25;
	} foreach units grp1;
	{
		unassignvehicle _x;
		_x action ["EJECT", helitransport_1];
		sleep 0.25;
		_x setDamage 0;
	} foreach units grp2;
	[] spawn {
	sleep 60;
	deleteVehicle helitransport;
	deleteVehicle helitransport_1;
	};
	searchCamp3= false;
	searchCamp2 = false;
	
	waitUntil {sleep 2;searchCamp3 || searchCamp2};
	if (searchCamp3) then {
	deleteVehicle pilot1;
	}else{
	deleteVehicle pilot2;
	};
};

