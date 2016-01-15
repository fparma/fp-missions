if (!isDedicated && isNull player) then { waitUntil {!isNull player}; };
//server execVM "revive_init.sqf";
"greenmark1" setmarkeralphalocal 0.4;
"greenmark2" setmarkeralphalocal 0.4;
"greenmark3" setmarkeralphalocal 0.4;

if(isNil "paramsArray") then{
	paramsArray = [
		0 // time of day
	];
};

[[
["viptaskbosson", "Inspect the Fort","<br><br/>Der Fuhrer has always been interested in Chateau de Bosson. The officer has been given the task to inspect the fort and its defense capabilities.",EAST,["viptaskmark1",(getmarkerpos "inspectbosson"),"hd_objective","ColorBlue","Inspect Fort"]],
["viptaskdocument", "Retrieve the document","<br><br/>A shipping document is located in Chateau de Guy-son. It is vital and needs to be retrieved.",EAST,["viptaskmark2",(getmarkerpos "collectdocument"),"hd_objective","ColorBlue","Retrieve document"]],
["viptaskmorale", "Boost morale","<br><br/>A small squad has been guarding Chef-du-Pont for several months. Their morale is low and a visit by the officer would surely boost it.",EAST,["viptaskmark3",(getmarkerpos "boostmorale"),"hd_objective","ColorBlue","Boost morale"]],
["viptaskcheckpoint", "Inspect Checkpoint","<br><br/>On the main road to Chef-du-Pont is a small checkpoint. The officer needs to ensure that everything is in order there.",EAST,["viptaskmark4",(getmarkerpos "inspectcheckpoint"),"hd_objective","ColorBlue","Inspect checkpoint"]],
["viptaskconvoy", "Inspect convoy","<br><br/>A convoy is leaving tomorrow morning. They've had problems with their shipping manifests and the condition of some of their vehicles has been reported as bad. Make sure everything is in order.",EAST,["viptaskmark5",(getmarkerpos "inspectconvoy"),"hd_objective","ColorBlue","Investigate the convoy"]],
["viptaskfriend", "Visit an old friend","<br><br/>In his youth, the officer studied cooking with a french local. It has been years since he last saw him and would like to pay him a quick visit to catch up.",EAST,["viptaskmark6",(getmarkerpos "visitfriend"),"hd_objective","ColorBlue","Visit friend"]],
["killviptask", "Kill the Officer","<br><br/>The time has come for payback! A highly ranked officer is visiting Merderet today. Aided by allied forces you've been given spare amounts of weapons and explosives. Your mission objective is to locate the VIP and end his life.",resistance,[["killvipbosson",(getmarkerpos "inspectbosson"),"selector_selectedMission","ColorRed","Kill officer"],["killvipdocument",(getmarkerpos "collectdocument"),"selector_selectedMission","ColorRed","Kill officer"],["killvipboostmorale",(getmarkerpos "boostmorale"),"selector_selectedMission","ColorRed","Kill officer"],["killvipcheckpoint",(getmarkerpos "inspectcheckpoint"),"selector_selectedMission","ColorRed","Kill officer"],["killvipconvoy",(getmarkerpos "inspectconvoy"),"selector_selectedMission","ColorRed","Kill officer"],["killvipfriend",(getmarkerpos "visitfriend"),"selector_selectedMission","ColorRed","Kill officer"]]]
],[
["Credits","Made by cuel for FP Arma 2."],
["Mission notes", "<br><br/>The French must assassinate the german Officer during his visit in Merderet. They've received aid from allied forces in terms of guns and small explosives.<br><br/><br><br/>Green markers on the map indicate strong resistance points and thus should be avoided by Germans at all costs, in order to protect the VIP<br><br/>Red markers indicate German troops."]
]]execVM "shk_taskmaster.sqf";


if(not isDedicated) then{
	player setVariable ["BIS_noCoreConversations", true];
	player enableGunLights true;
};

[] execVM "initplayer.sqf";
[] execVM "initserver.sqf";

//Finish world initialization before mission is launched. 
finishMissionInit;

if (paramsArray select 0 == 1) then {
skipTime 8;
};