if (!isDedicated && isNull player) then { waitUntil {!isNull player}; };

tfor_sniper = ["cwr2_BlackOp_Laser"];
if (!isDedicated) then {
player setVariable ["BIS_noCoreConversations", true];
player enableGunLights false;
};

server execVM "revive_init.sqf";
BIS_Effects_Burn = compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";	


if (isServer) then {
	["Respawn", true] call CBA_fnc_setMarkerPersistent;
//[-1, {smokeFX = [firewreck, 7, time, false, false] spawn BIS_Effects_Burn;}] call CBA_fnc_globalExecute;
};
[[
],[
["Mission notes", "<br><br/>The Russians have been advancing in Everon for weeks. We've tried our best to hold them off but it has been difficult. Recently, there has been enemy activity in Gravette, we think they're setting up an AA and mortar site. By orders from High Command your objetive is to infiltrate Gravette and with some help from CAS mark their ammo/aa site with a Laser designator. Be aware that the A10 will only be able to drop one bomb before returning to refuel so make it count. When the ammo dump has been take care off, proceed into Gravette and clear it of all enemies.<br><br/>"],
["Credits","Made by cuel for FP Arma 2."]

]]execVM "shk_taskmaster.sqf";

// world initialization before mission is launched
finishMissionInit;
[] execVM "bon_lasertargeting\init.sqf";