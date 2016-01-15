if (isDedicated) exitWith {};
removeAllWeapons player;
removeAllItems player;
	
player addweapon "ACE_Earplugs";
player addweapon "ACE_GlassesLHD_glasses";
player addWeapon "Binocular";
player addweapon "ItemMap";
player addweapon "ItemCompass";
player addweapon "ItemWatch";

	
player addEventHandler ["Killed",{
player spawn {
private ["_unit"];
_unit = _this;
		WaitUntil{alive player};
		removeAllWeapons player;
		sleep 120;
		hidebody _unit; 
		sleep 3;
		deleteVehicle _unit;
	};
}];
player setVariable ["BIS_noCoreConversations", true];

//'borrowed' from insurgency! credits to pitn :)
serverLoadHint = false;
_trg = createTrigger["EmptyDetector", [0,0,0]]; 
_trg setTriggerText "check server load";
_trg setTriggerArea[0,0,0,false]; 
_trg setTriggerActivation["ALPHA","PRESENT",true]; 
_trg setTriggerStatements ["this", 'if (serverLoadHint) exitWith { player groupChat "You may only check the server load every 30 seconds to prevent network lag"; }; 
serverLoadHint = true; 
[nil,server,"loc",rSPAWN,player,{
	[nil,_this,"loc",rSPAWN,diag_fps,{
		hint format["Server FPS: %1\n Run Time: %2 min(s)",round _this, round (time/60)];
		sleep 30;
		serverLoadHint = false;	
	}] call RE;
}] call RE;	
', ""]; 