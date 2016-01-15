if (!isServer) exitWith {};

if (!hasRunVidora) then {
	hasRunVidora = true; publicvariable "hasRunVidora";
	nul = [1,getpos vidoraSpawnpoint,2,["area5","random","nofollow","delete:",300]] execVM "SCRIPTS\UPSMON\MON_SPAWN.SQF";
	sleep 1;
	nul = [1,getpos vidoraSpawnpoint,1,["area5","fortify","nofollow","delete:",300]] execVM "SCRIPTS\UPSMON\MON_SPAWN.SQF";
	sleep 0.5;
                        []spawn {
                                sleep 1;
                                        [-1, {[flame1, 5, time, false, false] spawn BIS_Effects_Burn;}] call CBA_fnc_globalExecute;
                                };
                        []spawn {
                                sleep 1;
                                        [-1, {[flame2, 5, time, false, false] spawn BIS_Effects_Burn;}] call CBA_fnc_globalExecute;
                                };
};