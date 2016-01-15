// _________________________________________________________________________________________________________________
// | Coop Essential Pack by -eutf-Myke                                                                             |
// |_______________________________________________________________________________________________________________|
// | Do not change this scrip!                                                                                     |
// |_______________________________________________________________________________________________________________|
// | cep initialization script                                                                                     |
// |_______________________________________________________________________________________________________________|
// Heavily modified by Wolffy.au
// Usage: _cep_init = [TriggerDistance] execVM "coop_essential\cep_init.sqf";


private ["_trigDist","_delay"];
if (!isServer) exitwith {};
_trigDist = 1000;
if(count _this > 0) then {
	_trigDist = _this select 0;
};
_delay = 0;
if(count _this > 1) then {
	_delay = _this select 1;
};
cep_cached_grps = [];
cep_unit_count = 0;
cep_tls = 0;

waitUntil{!isNil "bis_fnc_init"};
waitUntil{typeName allGroups == "ARRAY"};

[_trigDist, _delay] spawn {
	
private ["_disable","_str","_timex","_allunitsx","_trigDist","_delay"];
_trigDist = _this select 0;
	_delay = _this select 1;
	_str = "";
	while{count allGroups > 0} do {
		if(_delay > 0) then {sleep _delay;};
		{
			_disable = (group _x) getVariable "CEP_disableCache";
			_disable = if(isNil "_disable") then { false; } else {_disable;};
			if(!_disable) then {
				(group _x) setVariable ["CEP_disableCache", true];
				cep_cached_grps = cep_cached_grps - [group _x];
			};
		} forEach ([] call BIS_fnc_listPlayers);

		{
			_disable = _x getVariable "CEP_disableCache";
			_disable = if(isNil "_disable") then { false; } else {_disable;};
			if (!_disable && !(_x in cep_cached_grps)) then {
				cep_cached_grps = cep_cached_grps + [_x];
				[leader _x, _trigDist] execFSM "modules\CEP_caching\crB_AICaching.fsm";
			};
		} forEach allGroups;

		{
			if (!(_x in allGroups)) then {
				cep_cached_grps = cep_cached_grps - [_x];
			};
		} forEach cep_cached_grps;

		if(_str != format["%1/%2 Cached Groups %3/%4/%5 Active/Suspended/Cached Units", count cep_cached_grps, count allGroups, (count allUnits) - cep_tls, cep_tls, cep_unit_count]) then {
			_str = format["%1/%2 Cached Groups %3/%4/%5 Active/Suspended/Cached Units", count cep_cached_grps, count allGroups, (count allUnits) - cep_tls, cep_tls, cep_unit_count];
			diag_log format["MSO-%1 CEP Caching # %2", time, _str];
			hint format["MSO-%1 CEP Caching # %2", time, _str];;
		};
		_timex = time + 30;
		_allunitsx = count allUnits;
		waitUntil{(count allUnits > (_allunitsx * 1.1)) || time > _timex};
	};
};
