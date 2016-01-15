enableSaving [false, false];
if (playerSide == west) then {
server execVM "revive_init_west.sqf";
};
if (playerSide == civilian) then {
server execVM "revive_init_civilian.sqf";
};
skiptime (paramsArray select 0);
    [[
      ["obj1east","Defend Lopatino","We have received recent information that a group of United States Marines are en route to Lopatino to attack and secure it. Defend this location at all costs, it cannot be a foorhold for the United States in our great nation!","created",["obj1eastm", getMarkerPos "lopatino", "mil_objective", "ColorRed"],CIVILIAN],
      ["obj1west","Capture Lopatino","We have breached the walls of Chernarus and it is time to secure it as our own! Chernarus will be a much enjoyed addition to the already liberated countries of forsaken Europe. Capture Lopatino and allies will move in to assist you immediately.","created",["obj1westm", getMarkerPos "lopatino", "mil_objective", "ColorRed"],WEST]
    ],[
      ["Credits","<br />Made by 2nd47 for the IFAP vs FPArmA2 series"]
    ]] execvm "shk_taskmaster.sqf";
script = [] execVM "gunControl.sqf";
sleep 5;
setViewDistance 3000;
execVM "briefing.sqf";

if(true) exitWith {}; 