if (!isServer) exitWith {};

removeMarker = "";

 [] spawn {
while {!stayVorkuta} do {sleep 10;}; 
["viptaskvorkuta", "succeeded"] call SHK_Taskmaster_upd;
removeMarker = "killvipvorkuta"; publicVariable "removeMarker";
};
 
[] spawn {
while {!talkGeneral  && alive talkOfficer} do {sleep 10;}; 
	if (alive talkOfficer) then {
	cuel_sidechat = "Welcome Rüger to my base! Let us discuss your purchase";
	publicVariable "cuel_sidechat";
	sleep 30;
	if (alive talkOfficer) then {
		["viptaskarmy", "succeeded"] call SHK_Taskmaster_upd;
	};
	} else {
		[nil, nil, rHINT, "The officer has been assassinated."] call RE;
		["viptaskarmy", "canceled"] call SHK_Taskmaster_upd;
	};
	talkGeneral = true;
	removeMarker = "killviparmy"; publicVariable "removeMarker";
};

[] spawn {
while {!stayRuin} do {sleep 10;}; 
["viptaskruin", "succeeded"] call SHK_Taskmaster_upd;
removeMarker = "killvipal"; publicVariable "removeMarker";
};

[] spawn {
while {!getSuitcase} do {sleep 10;}; 
["viptasknorinsk", "succeeded"] call SHK_Taskmaster_upd;
removeMarker = "killvipnorinsk"; publicVariable "removeMarker";
}; 

[] spawn {
while {!stayRailway} do {sleep 10;}; 
["viptaskrailway", "succeeded"] call SHK_Taskmaster_upd;
removeMarker = "killviprailway"; publicVariable "removeMarker";
}; 

 [] spawn {
while {!donateMoney} do {sleep 10;}; 
["viptaskhospital", "succeeded"] call SHK_Taskmaster_upd;
removeMarker = "killviphospital"; publicVariable "removeMarker";
};

[] spawn {
while {!stayHarbor} do {sleep 10;}; 
["viptaskharbor", "succeeded"] call SHK_Taskmaster_upd;
removeMarker = "killvipharbor"; publicVariable "removeMarker";
};  

[] spawn {
while {!stayDam} do {sleep 10;}; 
["viptaskdam", "succeeded"] call SHK_Taskmaster_upd;
removeMarker = "killvipdam"; publicVariable "removeMarker";
}; 

[]spawn {
while {!stayVorkuta || !talkGeneral || !stayRuin || !stayRailway || !donateMoney || !stayHarbor || !stayDam} do {sleep 12;};
[nil,nil,"per",rTitleCut,"All VIP objectives completed!", "BLACK", 6] call RE;sleep 5; [nil,nil,"per",rENDMISSION,"END1"] call RE; 
};

[]spawn {
	while {!vipDead} do {sleep 2};
	["killviptask", "succeeded"] call SHK_Taskmaster_upd;
	[nil,nil,"per",rTitleCut,"The VIP has been assassinated.", "BLACK", 6] call RE;
	sleep 5;
	[nil,nil,"per",rENDMISSION,"END1"] call RE;
};