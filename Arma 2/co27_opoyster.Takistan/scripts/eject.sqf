if (!isServer) exitWith {};
//if (isServer && (local player)) then {[(vehicle player),player] execVM "\x\ace\addons\sys_eject\jumpout.sqf";};
{hint format ["%1",_x];["timeToEject",_x,transport] call CBA_fnc_whereLocalEvent;sleep 0.1;}forEach units grp1;