_playerloots = [];

[] spawn {
	player addRating 10000;
	while {true} do {
		waitUntil {sleep 0.5; (rating player) < 10000};
		player addRating -(rating player);
	};
};

while {true} do {
	call zombieTextureUpdate;
	sleep 0.1;
	if (!((vehicle player) isKindOf "Air")) then {call CUEL_spawnLoot;};
	sleep 1;
	call CUEL_checkLoot;
};