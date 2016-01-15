
if (!isServer) exitWith {};
fp_exc = true; publicVariable "fp_exc";

_alpha = objNull;
_bravo = objNull;
{
	if (toLower groupid _x == "alpha") then {_alpha = _x};
	if (toLower groupid _x == "bravo") then {_bravo = _x};
}forEach allGroups;

if (!isNull _alpha && {{alive _x && simulationEnabled _x} count (units _alpha) > 0}) then {
	["B_Heli_Light_01_F", "h11", "h12", "h13", units _alpha, 100, "h14", "h15"] call FP_fnc_spawnHeliExtraction;
};

if (!isNull _bravo && {{{alive _x && simulationEnabled _x} count (units _bravo) > 0}) then {
	["B_Heli_Light_01_F", "h21", "h22", "h23", units _bravo, 100, "h24", "h25"] call FP_fnc_spawnHeliExtraction;
};
