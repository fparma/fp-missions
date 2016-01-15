if (!isServer) exitWith {};

if (!hasRunDepot) then {
	hasRunDepot = true; publicvariable "hasRunDepot";
	nul = [2,getpos depotSpawnpoint,1,["area4","random","delete:",300]] execVM "SCRIPTS\UPSMON\MON_SPAWN.SQF";
	sleep 1;
	nul = [2,getpos depotSpawnpoint,1,["area4","fortify","delete:",300]] execVM "SCRIPTS\UPSMON\MON_SPAWN.SQF";
};