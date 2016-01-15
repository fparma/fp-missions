if (!isDedicated && isNull player) then { waitUntil {!isNull player}; };
server execVM "revive_init.sqf";
// not really needed i guess. but eh, want to be sure that it works.

stayDam = false;
stayVorkuta = false;
stayHarbor = false;
stayRuin = false;
talkGeneral = false;
getSuitcase = false;
stayRailway = false;
donateMoney = false;
vipDead = false;

[[
["viptaskvorkuta", "Visit Vorkuta","<br><br/>The civilians in Vorkuta would love to see the VIP on the streets. The VIP should go there and show himself.",WEST,["viptaskmark1",(getPosATL vorkutaLoc),"hd_objective","ColorBlue","Visit Vorkuta"]],
["viptaskarmy", "Speak to the officer","<br><br/>The VIP should visit the Officer at the North Army Base and discuss a potential purchase.",WEST,["viptaskmark2",(getPosATL armyLoc),"hd_end","ColorBlue","Talk to Officer"]],
["viptaskruin", "Visit the Ruin","<br><br/>There's a strange ruin/artifact at Al. The VIP wants to visit it before he buys it.",WEST,["viptaskmark3",(getPosATL alLoc),"selector_selectedFriendly","ColorBlue","Visit ruin"]],
["viptasknorinsk", "Retrieve the suitcase","<br><br/>There's a suitcase waiting for the VIP at Norinsk. He wants to retrieve it.",WEST,["viptaskmark4",(getPosATL norinskLoc),"hd_pickup","ColorBlue","Retrieve suitcase"]],
["viptaskrailway", "Look at trains","<br><br/>The VIP likes trains. He wants to look at some trains.",WEST,["viptaskmark5",(getPosATL railwayLoc),"selector_selectedFriendly","ColorBlue","Look at trains"]],
["viptaskhospital", "Donate money to hospital","<br><br/>The VIP wants to donate money to the old hospital.<br><br/>Locate the laptop inside hospital and begin the transfer.",WEST,["viptaskmark6",(getPosATL hospitalLoc),"hd_join","ColorBlue","Donate money"]],
["viptaskharbor", "Look at boats","<br><br/>The VIP likes boats. He wants to look at some boats.",WEST,["viptaskmark7",(getPosATL harborLoc),"selector_selectedFriendly","ColorBlue","Look at boats"]],
["viptaskdam", "Visit the dam","<br><br/>The dam has a beatiful view. The VIP should look at it.",WEST,["viptaskmark8",(getPosATL damLoc),"selector_selectedFriendly","ColorBlue","Look at the view"]],
["killviptask", "Kill the VIP","<br><br/>For years, Rüger the dick has destroyed our homes and forced big greedy corporations to do weird experiments on our Island. The time has come to put an end to it.",EAST,[["killvipvorkuta",(getposatl vorkutaLoc),"selector_selectedMission","ColorRed","Kill VIP"],["killviparmy",(getposatl armyLoc),"selector_selectedMission","ColorRed","Kill VIP"],["killvipdam",(getposatl damLoc),"selector_selectedMission","ColorRed","Kill VIP"],["killvipnorinsk",(getposatl norinskLoc),"selector_selectedMission","ColorRed","Kill VIP"],["killvipal",(getposatl alLoc),"selector_selectedMission","ColorRed","Kill VIP"],["killviprailway",(getposatl railwayLoc),"selector_selectedMission","ColorRed","Kill VIP"],["killviphospital",(getposatl hospitalLoc),"selector_selectedMission","ColorRed","Kill VIP"],["killvipharbor",(getposatl harborLoc),"selector_selectedMission","ColorRed","Kill VIP"]]]
],[
["Credits","Made by cuel for FP Arma 2."],
["Mission", "Assassins must assassinate VIP. They have map markers for OPFOR / BLUFOR and 3 spawn/teleport positions around the map with vehicles. BLUFOR units are not allowed at these areas. <br><br/>VIP must complete all tasks while commandos/police is covering him."]
]]execVM "shk_taskmaster.sqf";

if(not isDedicated) then{
	player setVariable ["BIS_noCoreConversations", true];
	player enableGunLights true;
	"cuel_sidechat" addPublicVariableEventHandler {[playerSide,"HQ"] sideChat (_this select 1)};
};

[] execVM "initplayer.sqf";
[] execVM "initserver.sqf";

//Finish world initialization before mission is launched. 
finishMissionInit;