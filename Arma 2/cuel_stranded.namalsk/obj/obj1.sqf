"truckMarker" setMarkerAlphaLocal 1;
"truckMarker2" setMarkerAlphaLocal 1;
truck1 setVehicleLock "UNLOCKED";
truck2 setVehicleLOck "UNLOCKED";

if (!isServer) exitWith{};
if (isNil "runArmy") then {runArmy = false;};

["task1", "succeeded"] call SHK_Taskmaster_upd;
sleep 2;
["task2","Search the north army base","You and your friends are going to need weapons if you're going to survive in this place. There's also a possibility that you might find other useful stuff at the army base. You should investigate it.<br/></br/>You've spotted some nearby trucks that you could use for transport.",true,["task2mark",getmarkerpos "area2mark","mil_unknown","ColorBlue","Search the base"]] call SHK_Taskmaster_add;
sleep 5;


hint "spawn";
_pos = (getMarkerPos "area2") findEmptyPosition [10, 20];
_grp = createGroup Resistance;
_lead = _grp createUnit ["NS_zombie1", _newpos, [], 0, "FORM"];
[_lead] join _grp;
sleep 1;
[getmarkerPos "area2", Resistance, ["NS_zombie1", "NS_zombie2"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;