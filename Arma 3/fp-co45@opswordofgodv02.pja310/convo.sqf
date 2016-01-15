//if (isServer) then {

[guard, 0] call FP_fnc_removeAction;

hint "''Oh, thank Allah you've come. We were the President's personal guard.\n\n
		We came here to try and rescue him, but it wasn't enough. They took him north, to Al Quisa. He should be there somewhere.\n\n
		Hurry! Save him, before those animals can-''
";
/*
guard sidechat "Oh, thank Allah you've come.";
sleep 2;
guard sidechat "We were the President's personal guard.";
sleep 3;
guard sidechat "We came here to try to rescue him, but it wasn't enough.";
sleep 4;
guard sideChat "They took him north, to Al Quisa. He should be there somewhere.";
sleep 3;
guard sideChat "Hurry! Save him, before those animals can-";
*/
guard allowdamage true;
sleep 8;
[
       [
			guard,
			""
		],
	"switchMove"
] call BIS_fnc_MP; 

guard setdamage 1;
//};