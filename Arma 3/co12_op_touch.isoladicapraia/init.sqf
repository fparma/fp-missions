if (hasInterface) then {
	["FP_black", false] call BIS_fnc_blackOut;
};

asr_ai3_main_joinlast = 0;
[] execvm "xtra\civ\main.sqf";
