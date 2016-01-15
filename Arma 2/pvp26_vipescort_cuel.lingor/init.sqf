if (!isDedicated && isNull player) then { waitUntil {!isNull player}; };
server execVM "revive_init.sqf";
// not really needed i guess. but eh, want to be sure that it works.
[] execVM "bon_ieds\init.sqf";
investigateFOB = false;
stayBarro = false;
buyWeapons = false;
donateMoney = false;
buyDrugs = false;
visitPresident = false;
getDrunk = false;
compareLab = false;

vipDead = false;
if(isNil "paramsArray") then{
	paramsArray = [
		11, // revive times
		1, // ieds
		2 //civ's
	];
};
cuel_ambient_civs = paramsArray select 2;


[[
["viptaskpista", "Investigate the FOB","<br><br/>The lingor military at the FOB near Pista are up to something and the VIP wants to investigate what they're up to. Infiltrate the base and steal vital information",WEST,["viptaskmark1",(getPosATL pistaLoc),"hd_objective","ColorBlue","Investigate FOB"]],
["viptaskeddie", "Buy weapons","<br><br/>In order for the VIP's company to establish some ground in Lingor, they need weapons and locals to do their bidding. The VIP wants to buy weapons from the military so that he can use it against them later on.",WEST,["viptaskmark2",(getPosATL eddieLoc),"hd_end","ColorBlue","Buy weapons"]],
["viptasklab", "Donate money to research","<br><br/>The research lab in Lingor (non-military) are researching cloning and creating androids. The VIP wants to donate money to this laboratory so that they can continue their research",WEST,["viptaskmark3",(getPosATL labLoc),"selector_selectedFriendly","ColorBlue","Donate money to research"]],
["viptaskpresident", "Talk to the president","<br><br/>The president in Lingor is a scum, but he's looking into buying some goods from the VIP's company. The VIP wants to visit him so that they can close the deal.",WEST,["viptaskmark4",(getPosATL presidentLoc),"hd_pickup","ColorBlue","Talk to president"]],
["viptaskcoconut", "Have a drink","<br><br/>The coconut grove is known for its drinks. The VIP wants to have a drink there.",WEST,["viptaskmark5",(getPosATL coconutLoc),"selector_selectedFriendly","ColorBlue","Try out of the local beverage"]],
["viptaskplant", "Collect drugs","<br><br/>An easy way to make large amounts of money is buy drugs and sell them for a higher price. Some local druglords are trying to sell their drugs, and the VIP has purchased an amount. Go there and collect them.",WEST,["viptaskmark6",(getPosATL plantLoc),"hd_join","ColorBlue","Collect drugs"]],
["viptaskmillab", "Compare military research","<br><br/>The military lab is also doing some research on cloning. The VIP wants to compare their results to the local lab. Go to their HQ, and find something useful from their research.",WEST,["viptaskmark7",(getPosATL milLabLoc),"selector_selectedFriendly","ColorBlue","Steal research"]],
["viptaskbarro", "Visit godchild","<br><br/>The VIP has a godchild in Barro. He wants to visit it, if the godchilds is not there at the moment, the VIP should still visit and show himself to the locals to make them jealous.",WEST,["viptaskmark8",(getPosATL barroLoc),"selector_selectedFriendly","ColorBlue","Visit godchild"]],
["killviptask", "Kill the VIP","<br><br/>For years, Rüger has destroyed our homes and made big greedy corporations do weird experiments on our Island. The time has come to put an end to it.",EAST,[["killvippista",(getposatl pistaLoc),"selector_selectedMission","ColorRed","Kill VIP"],["killvipeddie",(getposatl eddieLoc),"selector_selectedMission","ColorRed","Kill VIP"],["killviplab",(getposatl labLoc),"selector_selectedMission","ColorRed","Kill VIP"],["killvippresident",(getposatl presidentLoc),"selector_selectedMission","ColorRed","Kill VIP"],["killvipcoconut",(getposatl coconutLoc),"selector_selectedMission","ColorRed","Kill VIP"],["killviprailmillab",(getposatl milLabLoc),"selector_selectedMission","ColorRed","Kill VIP"],["killvipbarro",(getposatl barroLoc),"selector_selectedMission","ColorRed","Kill VIP"],["killvipplant",(getposatl plantLoc),"selector_selectedMission","ColorRed","Kill VIP"]]]
],[
["Credits","Made by cuel for FP Arma 2."],
["Mission", "Assassins must assassinate VIP. They have map markers for OPFOR / BLUFOR and 2 spawn/teleport positions around the map with vehicles (and one helicopter). BLUFOR units are not allowed at these areas and vice versa. <br><br/>VIP must complete all tasks while commandos/police is covering him."]
]]execVM "shk_taskmaster.sqf";

if(not isDedicated) then{
	player setVariable ["BIS_noCoreConversations", true];
	player enableGunLights true;
	//"cuel_sidechat" addPublicVariableEventHandler {[playerSide,"HQ"] sideChat (_this select 1)};
};

[] execVM "initplayer.sqf";
[] execVM "initserver.sqf";

//Finish world initialization before mission is launched. 
finishMissionInit;



sleep 1;
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
		hint format["Server FPS: %1\n Run Time: %2 mins\n Units: %3, Grps: %4",round _this, round (time/60), count allunits, count allgroups];
		sleep 30;
		serverLoadHint = false;	
	}] call RE;
}] call RE;	
', ""]; 