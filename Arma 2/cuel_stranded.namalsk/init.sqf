if (!isDedicated && isNull player) then { waitUntil {!isNull player}; };

server execVM "revive_init.sqf";
player setVariable ["BIS_noCoreConversations", true];
player enableGunLights true; 
"truckMarker" setMarkerAlphaLocal 0;
"truckMarker2" setMarkerAlphaLocal 0;
[[
["task1", "Search for supplies and survivors in Vorkuta.","<br/>Namalsk is lost. These mutants are in full control of Namalsk and the only thing all remaining humans can do is try to get off this godforsaken island. Since your team is low on ammo and supplies, not to mention people, you should search Vorkuta for more<br/><br/>Even though it's very likely that Vorkuta is infested, it's your only chance.",true,[["task1mark",getmarkerpos "area1","mil_unknown","ColorGreen","Search for supplies and other survivors"]]]
],[
["Credits","Made by cuel for FP Arma 2."]
]]execvm "shk_taskmaster.sqf";

[player,200,10,10,3,6,-0.3,0.1,0.3,1,1,1,30,10,15,true,0.4,0.5,0.025,0,0,0,0,24] execFSM "Fog.fsm";

if (isServer) then
{
    //Init UPSMON scritp
    call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";	
};

BIS_Effects_Burn = compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";



//Process statements stored using setVehicleInit
processInitCommands;
//Finish world initialization before mission is launched. 
finishMissionInit;
//if (isServer) exitWith {};
if (true) then {
    canSpawn = false;
    _pos = [0,0,0];
    while {!canSpawn} do {
	if (alive (leader (group player))) then {
            _pos = (getPos (leader (group player))) findEmptyPosition [5, 50, typeOf (vehicle player)];
            canSpawn = true;
	} else {
            {
                if (vehicle _x == _x && (alive _x)) then
                {
                    _pos = (getPos _x) findEmptyPosition [5, 50, typeOf (vehicle player)];
                    if (true) exitWith {canSpawn = true;};
        			}
                } forEach units group player;
            };
            if (canSpawn && (!(surfaceIsWater _pos))) then {if (true) exitWith {player setPos _pos};} else {canSpawn = false;};
            sleep 2;
        };
    };
