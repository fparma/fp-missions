//Make sure that the player is on the server and stuff
if ((!isServer) && (player != player)) then {waitUntil {player == player};};

//======= ACE SETTINGS ======
//AI has no medical gear , true/false
Ace_sys_wounds_no_medical_gear = false; //false = AI has gear

//What damage to have when you get back on you feet 0.0 -> 0.9
ace_sys_wounds_leftdam  = 0.2;

//Poor mans revive. This is the time in seconds before you go to respawn time
ace_wounds_prevtime = 400;

//======= Turn off a bunch of BIS stuff ======
enableSaving [false, false];
player setVariable ["BIS_noCoreConversations", true];

//Tasks
[[
  ["task1", "Assault Monikute","<br><br/>Your first objective is to seize and clear Monikute. The enemy presence is unknown as of now.",true,["task1mark",(getPosATL z1),"Attack","ColorRed"," Assault"]],
  ["task2", "Destroy AA site","<br><br/>We need air support as soon as possible in this area. The US have set up an AA site in Emita Castle, it needs to be destroyed as soon as possible.",true,["task2mark",(getPosATL z2),"FireMission","ColorRed"," Destroy AA"]],
  ["task3", "Locate and disable artillery","<br><br/>Before our final assault on the airfield, we need to find a nearby artillery site and take it out so our troops can attack the airfield unhindered.",true,["task3mark",(getPosATL z4),"Strongpoint","ColorRed"," Disable artillery"]]
  ],[
  ["Situation", "Russia has launched its glorious attack on the pitiful island Emita. In order to make this war as easy as possible for our side, we must strike key positions to ensure the safety of our troops."]
]] execvm "shk_taskmaster.sqf";

if (isServer) then {
onPlayerConnected ' "respawn_east" setmarkerpos (getmarkerpos "respawn_east");'; 
	ace_sys_eject_fnc_weaponCheckEnabled = {false}; 
	publicVariable "ace_sys_eject_fnc_weaponCheckEnabled";
	{
		_x setVariable ["blown", false];
			_x addEventHandler ["handleDamage", {
				_unit = _this select 0;
				_damage = _this select 2; 
				if (_damage > 0.7) then {_unit execVM "scripts\blowup.sqf"};
				_damage
			}];
			sleep 0.5;
	}forEach [aa1,aa2,art1,art2,art3];
};
//====== Time to start the mission! ======
processInitCommands;
finishMissionInit;

if (not isDedicated) then {
	[] execVM "source\aiHearTalking.sqf"; 
	PAPABEAR = [West,"HQ"];
	["intelSideChat", {PAPABEAR sideChat (_this) }] call CBA_fnc_addEventHandler;
	player switchMove "amovpercmstpslowwrfldnon_player_idlesteady03";  
};

setViewDistance 2000;
setTerrainGrid 25;

if (time > 60) then {
	sleep 5;
	if ( "task1" call SHK_Taskmaster_isCompleted) then {
		player setPos (getmarkerpos "respawn_east");
	};
};