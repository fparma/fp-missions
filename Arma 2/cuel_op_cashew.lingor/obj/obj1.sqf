if (!isServer) exitWith {};

if (!("task1" call SHK_Taskmaster_isCompleted)) then {
["task1", "succeeded"] call SHK_Taskmaster_upd;
};