if (isDedicated) exitWith{};
	
while {true} do {
	waitUntil {sleep 0.5; vehicle player isKindOf "Air" && ((driver vehicle player == player) || (gunner vehicle player == player))};
	setViewDistance 8000;
	setObjectViewDistance 5000;
	waitUntil {sleep 0.5; (!(vehicle player isKindOf "Air") || ((driver vehicle player != player) && (gunner vehicle player != player)) || !alive player)};
	setViewDistance 2500;
	setObjectViewDistance 2000;
};