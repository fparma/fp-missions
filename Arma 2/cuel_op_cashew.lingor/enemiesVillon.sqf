if (!isServer) exitWith {};

if (!hasRun) then {
	hasRun = true; publicvariable "hasRun";
	nul = [1,getpos villonSpawnpoint,2,["area3","random","nofollow","delete:",300]] execVM "SCRIPTS\UPSMON\MON_SPAWN.SQF";
	sleep 1;
	nul = [1,getpos villonSpawnpoint,1,["area3","fortify","nofollow","delete:",300]] execVM "SCRIPTS\UPSMON\MON_SPAWN.SQF";
	sleep 0.5;
	waitUntil {sleep 4;("task1" call SHK_Taskmaster_isCompleted)};
	"Spawn" setMarkerpos (getMarkerpos "spawn2");
	ammo1 setpos (getMarkerpos "boxmove");
	[nil,nil,rHINT,"Spawnpoint has been moved closer to Villon."] call RE;
};