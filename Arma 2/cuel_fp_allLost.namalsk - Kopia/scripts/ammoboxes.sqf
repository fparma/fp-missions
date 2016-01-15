//by cuel

if (!isServer) exitWith {};
private ["_box", "_pos", "_plr", "_dir", "_dist"];

// get random group
while {true} do {
sleep 60;
	_plr = call getRandomGroup;
	 _dir = (([(group _plr),2] call SHK_Intercept_getDir)-30+(round(random(75))));
	_dist = (random 50) + 100;
	_pos =	[(getPos vehicle _plr select 0) + (_dist * sin(_dir)), (getPos vehicle _plr select 1) + (_dist * cos(_dir)), 0];
	_box = "LocalBasicWeaponsBox" createVehicle (_pos);
	[_box, "low"] execVM "fillAmmo.sqf";
	_box spawn {_b = _this; while{{isPlayer _x} count (nearestObjects [(getPosATL _b),["Man","LandVehicle"],300]) != 0} do {sleep 15;};deleteVehicle _b;};
};