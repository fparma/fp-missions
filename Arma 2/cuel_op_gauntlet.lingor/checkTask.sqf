waitUntil {sleep 2;(!alive drugtruck1) && (!alive drugtruck2) && (!alive drugtruck3)};

["tskDrugs","succeeded"] call SHK_Taskmaster_upd;
sleep 8;
["tskChase","Chase the drug trucks that escaped","Our UAV has spotted 2 drug trucks that has fled from the scene. Get a vehicle and chase after them BEFORE they reach their destination!<br/><br/>Vehicles has been sighted near Calamar, location marked on your map."] call SHK_Taskmaster_add;
execVM "task2check.sqf";

_markerstr = createMarker ["mkr_unit1",[0,0]];
_markerstr setMarkerShape "ICON";
"mkr_unit1" setMarkerType "WARNING";
"mkr_unit1" setMarkerColor "ColorRed";

_markerstr2 = createMarker["mkr_unit2",[0,0]];
_markerstr2 setMarkerShape "ICON";
"mkr_unit2" setMarkerType "WARNING";
"mkr_unit2" setMarkerColor "ColorRed";

[] spawn {
  while {not isnull chasetruck1} do { "mkr_unit1" setmarkerpos getpos chasetruck1; sleep 2; };
};
[] spawn {
  while {not isnull chasetruck2} do { "mkr_unit2" setmarkerpos getpos chasetruck2; sleep 2; };
};
"Spawn" setMarkerPos (getMarkerPos "spawn1");
box1 setPos (getPos boxmove);


waitUntil {sleep 5;(!alive chasetruck1) && (!alive chasetruck2)};

if (!(["tskChase","failed"] call SHK_Taskmaster_hasState)) then{
["tskChase","succeeded"] call SHK_Taskmaster_upd;
sleep 6;
[nil, nil, rHINT, "Both drug trucks destroyed. Good job."] call RE;
sleep 10;
[objNull, objNull, rENDMISSION, "END2"] call RE;
};
