if (!isServer) exitWith {};
sleep 5;
[2] execVM "civilians\init.sqf";


blowbarrels = false;
waitUntil {sleep 1; blowbarrels};
sleep 3;
[] spawn {
	sleep 1;
	[[bom2], ["barrelsbeep",10]] call CBA_fnc_globalSay;
	sleep 5;
	"B_30mm_HE" createVehicle (getpos bom2);
	deleteVehicle bom2;
};
[[bom1],["barrelsbeep",10]] call CBA_fnc_globalSay;
sleep 5;
"B_30mm_HE" createVehicle (getpos bom1);
deleteVehicle bom1;
{_x setDamage 1}forEach [bom1,bom2,b1,b2,b3,b4,b5,b6,b7];
sleep 10;
[nil, nil, "per",rEXECVM, "gas.sqf"] call RE;
