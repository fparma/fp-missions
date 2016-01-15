//For JIP's, wait until the player is fully connected
if ((!isServer) && (player != player)) then {
	waitUntil {player == player};
};
//Turn off saving.
enableSaving [false, false];

// *********** ACE WOUNDS ************
//How much damage is max left when healed in the field, (is multiplied times the amount the unit was healed in the field already), instead of healed at a medical facility
ace_sys_wounds_leftdam  = 0.2;
//Timer before respawn
ace_wounds_prevtime = 400;
//Should player start with medical gear?
ace_sys_wounds_no_medical_gear = false;
//remove comment if you want the player to be able to respawn without having to wait for the timer.
//ace_sys_wounds_no_rpunish = true;
// more info: http://wiki.ace-mod.net/Wounding_System
// *********** ACE WOUNDS ************

//dont put gear in a bag when pilot or crew member
if (isServer) then {
	ace_sys_eject_fnc_weaponCheckEnabled = {false}; 
	publicVariable "ace_sys_eject_fnc_weaponCheckEnabled";
};

//turn off conversations; script so AI can hear us talk on ACRE if close enough and finally remove player corpses script
if (!isDedicated) then {
	player setVariable ["BIS_noCoreConversations", true];
	[] execVM "scripts\aiHearTalking.sqf"; 
	player addEventHandler ["killed",{veh = _this execVM "source\burial.sqf"}];
};

//view distance and grass
setViewDistance 2500;
setTerrainGrid 25;

processInitCommands;
finishMissionInit;

//lower weapon at player start
player switchMove "amovpercmstpslowwrfldnon_player_idlesteady03";  