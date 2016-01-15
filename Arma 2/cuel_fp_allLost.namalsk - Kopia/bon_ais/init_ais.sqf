_unit = _this select 0;

//if(not isServer && not isPlayer _unit) exitWith{};	// no ai unit controlled on a client
if(isDedicated && isPlayer _unit) exitWith{};		// no player unit controlled on a dedicated server

//diag_log text format["initializing AIS for unit %1",name _unit];

BON_AIS_PATH = "bon_ais\";


// Damage Tolerance: 1-2=>Low, 3=>Normal, 5=>High, 8=>Very High
bon_ais_rambofactor = 3;


"bon_ais_in_agony" addPublicVariableEventHandler {
	_unit = (_this select 1) select 0;
	_in_agony = (_this select 1) select 1;
	_side = _unit getVariable "bon_ais_side";
	if(playerSide == _side) then{
		if(_in_agony) then{
			[_side,"HQ"] sideChat format["%1 is down and needs help",name _unit];
			_fa_action = _unit addAction [format["<t color='#F00000'>First Aid to %1</t>",name _unit],(BON_AIS_PATH+"firstaid.sqf"),_unit,10,false,true,"",
				"{not isNull (_target getVariable _x)} count ['healer','dragger'] == 0 && alive _target && vehicle _target == _target
			"];
			_drag_action = _unit addAction [format["<t color='#FFFFFF'>Drag %1</t>",name _unit],(BON_AIS_PATH+"drag.sqf"),_unit,10,false,true,"",
				"{not isNull (_target getVariable _x)} count ['healer','dragger'] == 0 && alive _target && vehicle _target == _target
			"];
			_unit setVariable ["fa_action",_fa_action,false];
			_unit setVariable ["drag_action",_drag_action,false];
			[_unit] execFSM (BON_AIS_PATH+"fsm\ais_marker.fsm");
		} else {
			_unit removeAction (_unit getVariable "fa_action");
			_unit removeAction (_unit getVariable "drag_action");
			_unit setVariable ["fa_action",nil,false];
			_unit setVariable ["drag_action",nil,false];
		};
	};
};


_unit setVariable ["bon_ais_headhit",0,false];
_unit setVariable ["bon_ais_bodyhit",0,false];
_unit setVariable ["bon_ais_overall",0,false];
_unit setVariable ["bon_ais_unit_died",false,false];

_unit setVariable ["ais_handledamage",compile (preprocessFileLineNumbers (BON_AIS_PATH+"func_handleDamage.sqf")),false];
sleep 0.1; // precompilation time
_handledamage = _unit addEventHandler ["HandleDamage",{_this call ((_this select 0) getVariable "ais_handleDamage")}];


[_unit] execFSM (BON_AIS_PATH+"fsm\ais.fsm");