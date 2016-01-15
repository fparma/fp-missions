
CUEL_CENTERPOS = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
if (typeName CUEL_CENTERPOS != typeName []) then {CUEL_CENTERPOS = [0,0,0]};
if ((CUEL_CENTERPOS select 0 == 0) && (CUEL_CENTERPOS select 1 == 0)) then {CUEL_CENTERPOS = markerPos "z_center"};
if ((CUEL_CENTERPOS select 0 == 0) && (CUEL_CENTERPOS select 1 == 0)) then {if (!isDedicated) then {[] spawn {sleep 1;player sideChat "WARNING: NO CENTER POSITION AVAILABLE. PLEASE CREATE A MARKER NAMED z_center!"};};};

#define randPos [1500+(CUEL_CENTERPOS select 0)+random 4000-random 4000,1500+(CUEL_CENTERPOS select 1)+random 4000-random 4000, 0]

#define ILLEGAL_HOUSES ["Land_Wall_CGry_5_D","Land_HouseV_1L2","Land_Wall_CBrk_5_D","Land_HouseV_1L1"]