// by Bon_Inf*


private ['_agony','_unit','_bodypart','_damage','_returndamage'];

_unit 		= _this select 0;
_bodypart	= _this select 1;
_damage		= _this select 2;


_return = _damage / (bon_ais_rambofactor max 1);
_revive_factor = (bon_ais_rambofactor max 1) * 1.5;

_agony = false;

switch _bodypart do {
	case "" : {
		_damage = damage vehicle _unit + _return; //(_unit getVariable "bon_ais_overall") + _return;
		_unit setVariable ["bon_ais_overall",_damage,false];
		if(_damage >= 0.9) then {
			_agony = true;
			if(_damage >= _revive_factor) then {_unit setVariable ["bon_ais_unit_died",true,false]};
		} else{_unit setDamage _damage};
	};
	case "body" : {
		_damage = (_unit getVariable "bon_ais_bodyhit") + _return;
		_unit setVariable ["bon_ais_bodyhit",_damage,false];
		if(_damage >= 0.9) then {
			_agony = true;
			if(_damage >= _revive_factor) then {_unit setVariable ["bon_ais_unit_died",true,false]}
		} else{_unit setHit ["body",_damage]};
	};
	case "head_hit" : {
		_damage = (_unit getVariable "bon_ais_headhit") + _return;
		_unit setVariable ["bon_ais_headhit",_damage,false];
		if(_damage >= 0.9) then {
			_agony = true;
			if(_damage >= _revive_factor) then {_unit setVariable ["bon_ais_unit_died",true,false]}
		} else{_unit setHit ["head_hit",_damage]};
	};
	case "legs" : {
		_unit setHit ["legs",_return];
	};
	case "hands" : {
		_unit setHit ["hands",_return];
	};
	default {};
};

if(_agony && not (_unit getVariable "bon_ais_agony")) then{
	_unit setVariable ["bon_ais_agony",true,false];
};


_return = 0;
_return