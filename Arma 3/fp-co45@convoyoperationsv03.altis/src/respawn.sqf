_unit = _this select 0;
_corpse = _this select 1;
_type = _corpse getVariable ["FP_kit_type",""]; 
if (_type != "") then {
	[_unit,_type] call FP_fnc_getKit;
};

// Time before the teleport flag can be used again, to prevent people from just teleporting after dying.
// The flag is for JiPs not deaths. 3 min default
FP_timeout = time + 180;