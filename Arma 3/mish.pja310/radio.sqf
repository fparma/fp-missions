_guys = [];
if (!isNil "a0" && {alive a0 && a0 distance [0,0,0] > 100}) then {_guys pushBack a0};
if (!isNil "b0" && {alive b0 && b0 distance [0,0,0] > 100}) then {_guys pushBack b0};

[[["HQ, this is Alpha/Bravo. Ready for evac from Al Hwayz."], {[WEST, "HQ"] sideChat (_this select 0)}],"BIS_fnc_spawn",true] call BIS_fnc_MP;
[_guys, "fp_msg1"] call CBA_fnc_globalSay;

sleep 6;

[[["This is crossroads. Copy. Evac en route."], {[WEST, "HQ"] sideChat (_this select 0)}],"BIS_fnc_spawn",true] call BIS_fnc_MP;
[_guys, "fp_msg2"] call CBA_fnc_globalSay;

sleep 10;

_rescue = [];

{
	if (alive _x && (_x distance (markerpos "hwayz")) < 300) then {
		_rescue pushBack _x;
	};
}foreach ([] call CBA_fnc_players);
if (alive h1) then {_rescue pushBack h1};
if (alive h2) then {_rescue pushBack h2};
	
systemChat str _rescue;

_he = ["RHS_UH60M_d", "hspawn", "hmove1", "hland", _rescue, 150, "hmove2", "hend"] call FP_fnc_spawnHeliExtraction;
