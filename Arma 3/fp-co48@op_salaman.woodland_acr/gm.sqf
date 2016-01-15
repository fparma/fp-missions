
setViewDistance 5000;
setObjectViewDistance 4000;

player addAction ["<t color='#ffff00'>[ Radio: FA18 on station ]</t>", {
	_sendTo = [];
	{
		if (!isNull (missionNamespace getVariable [_x, objNull])) then {
			_sendTo pushBack (missionNamespace getVariable _x);
		}
	}foreach ["actual", "a0", "b1", "c1", "d0", "f1", "bb1", "bb2", "bb3", "b4"];

    [_sendTo, "fp_onstation"] call CBA_fnc_globalSay;

    sleep 1;
    [{eagleone sideChat "Actual, this is Eagle One and Two, heard you guys needed some help. We are on station."},"BIS_fnc_spawn", true] call bis_fnc_mp;
	if (isNil "gm") then {gm = objNull};
	if (isNil "gm2") then {gm2 = objNull};
    [[[_this select 2], {player removeAction (_this select 0)}],"BIS_fnc_spawn", [gm, gm2]] call bis_fnc_mp;
}, nil, 0, false, true];


player addAction ["<t color='#ffff00'>[ Radio: FA18 leaving ]</t>", {
	_sendTo = [];
	{
		if (!isNull (missionNamespace getVariable [_x, objNull])) then {
			_sendTo pushBack (missionNamespace getVariable _x);
		}
	}foreach ["actual", "a0", "b1", "c1", "d0", "f1", "bb1", "bb2", "bb3", "b4"];

    [_sendTo, "fp_onstation"] call CBA_fnc_globalSay;
	sleep 1;
    [{eagleone sideChat "Actual, this is Eagle One and Two, we are RTB due to damage. Good luck."},"BIS_fnc_spawn", true] call bis_fnc_mp;
	
	if (isNil "gm") then {gm = objNull};
	if (isNil "gm2") then {gm2 = objNull};
    [[[_this select 2], {player removeAction (_this select 0)}],"BIS_fnc_spawn", [gm, gm2]] call bis_fnc_mp;
}, nil, 0, false, true];
