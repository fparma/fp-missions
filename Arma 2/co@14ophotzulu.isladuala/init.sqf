//Make the markers invisible
"respawn_west" setMarkerAlpha 0;


if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
};
if (isNil "boom") then {boom = false;};
//Create Tasks
execVM "briefing.sqf";

// Init UPSMON
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";

//Process statements stored using setVehicleInit
processInitCommands;

//Finish world initialization before mission is launched. 
finishMissionInit;

//ACE Wound settings
Ace_sys_wounds_no_medical_gear = false;
ace_sys_wounds_leftdam  = 0.6;
ace_wounds_prevtime = 400;
if (isServer) then { ace_sys_eject_fnc_weaponCheckEnabled = {false}; 
publicVariable "ace_sys_eject_fnc_weaponCheckEnabled" };

//Add actions to flags
execVM "source\teleportflag\action_init.sqf";

// F2 - Disable Saving and Auto Saving
enableSaving [false, false];

// F2 - Disable BIS Conversations
player setVariable ["BIS_noCoreConversations", true];
	

// Bury player
if (!isdedicated) then
{
	waitUntil {!isNull player};
	player addEventHandler ["killed",{nul=_this execVM "source\burial.sqf"}];
	player setVariable ["ACE_SYS_STAMINA_MULTI", 0.6];
};

execVM "obj.sqf";