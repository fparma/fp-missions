
"lubjanskMarker" setMarkerAlphaLocal 1;
if (!isServer) exitWith {};

if (!("task1" call SHK_Taskmaster_isCompleted)) then {
["task1", "succeeded"] call SHK_Taskmaster_upd;
};

["task2","Try to contact HQ","You cannot signal HQ since all radios was destroyed with the boat. <br/><br/>You should try searching Lubjansk for some sort of radio or phone that you can contact HQ with and find out what your objective is, considering the circumstances."] call SHK_Taskmaster_add;

nul = [1,getMarkerPos "lubjanskMarker",2,["lubjanskMarker","random","nofollow","delete:",300]] execVM "SCRIPTS\UPSMON\MON_SPAWN.SQF";