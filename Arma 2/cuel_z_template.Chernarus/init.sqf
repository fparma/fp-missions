enableSaving [false,false];

if (isNil "paramsArray") then {
    if (isClass (missionConfigFile/"Params")) then {
        for "_i" from 0 to (count (missionConfigFile/"Params") - 1) do {
            _paramName = configName ((missionConfigFile >> "Params") select _i);
			missionNamespace setVariable [_paramName, getNumber (missionConfigFile >> "Params" >> _paramName >> "default")];
			
        };
    };
} else {
    for "_i" from 0 to (count paramsArray - 1) do {
        missionNamespace setVariable [configName ((missionConfigFile >> "Params") select _i), paramsArray select _i];
    };
};

if (isNil "BIS_functions_mainscope") then {
	createCenter sideLogic;
	_group = createGroup sideLogic;
	_group createUnit ["FunctionsManager", [0,0,0], [], 0, "NONE"];
};
waitUntil {!isnil "bis_fnc_init"};

CLY_debug= if (param_debug != 1) then {true}else{false};

if (local player) then {call compile preProcessFileLineNumbers "initplayer.sqf";};
if (isServer) then {call compile preProcessFileLineNumbers "initserver.sqf";};