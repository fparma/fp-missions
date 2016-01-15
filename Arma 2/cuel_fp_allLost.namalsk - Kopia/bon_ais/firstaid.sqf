_healer = _this select 1;
_injuredperson = _this select 3;

_behaviour = behaviour _healer;
_timenow = time;
if(not (isPlayer _healer) && _healer distance _injuredperson > 4) then {
	_healer setBehaviour "AWARE";
	_healer doMove position _injuredperson;
	WaitUntil{	_healer distance _injuredperson <= 4		 ||
			not alive _injuredperson			 ||
			not (_injuredperson getVariable "bon_ais_agony") ||
			not alive _healer				 ||
			_healer getVariable "bon_ais_agony"		 ||
			time - _timenow > 120
	};
};

if(_healer distance _injuredperson > 4) exitWith{_healer setBehaviour _behaviour};

_injuredperson setVariable ["healer",_healer,true];

_healer selectWeapon primaryWeapon _healer; sleep 2;
_healer playAction "medicStart";

_offset = [0,0,0]; _dir = 0;
_relpos = _injuredperson worldToModel position _healer;
if((_relpos select 0) < 0) then{_offset=[-0.8,0.2,0]; _dir=90} else{_offset=[0.8,0.2,0]; _dir=270};

_healer attachTo [_injuredperson,_offset];
_healer setDir _dir;

if(not isPlayer _healer) then {
	_healer stop true;
	_healder disableAI "MOVE";
	_healder disableAI "TARGET";
	_healder disableAI "AUTOTARGET";
};
sleep 5;

_time = time;
_damage = (damage _injuredperson * 75);


WaitUntil{
	time - _time > _damage
	|| (animationState _healer != "AinvPknlMstpSnonWrflDnon_medic0s" &&
	   animationState _healer != "AinvPknlMstpSnonWrflDnon_medic"	&&
	   animationState _healer != "AinvPknlMstpSnonWrflDnon_medic0"	&&
	   animationState _healer != "AinvPknlMstpSnonWrflDnon_medic1"	&&
	   animationState _healer != "AinvPknlMstpSnonWrflDnon_medic2"	&&
	   animationState _healer != "AinvPknlMstpSnonWrflDnon_medic3"	&&
	   animationState _healer != "AinvPknlMstpSnonWrflDnon_medic4"	&&
	   animationState _healer != "AinvPknlMstpSnonWrflDnon_medic5"	&&
	   animationState _healer != "AinvPknlMstpSnonWrflDnon_medicend")
	|| not alive _healer
	|| (_healer distance _injuredperson) > 2
	|| not alive _injuredperson
};

detach _healer;

if(not isPlayer _healer) then {
	_healer stop false;
	_healder enableAI "MOVE";
	_healder enableAI "TARGET";
	_healder enableAI "AUTOTARGET";
};
_injuredperson setVariable ["healer",ObjNull,true];

_healer playAction "medicStop";
_healer setBehaviour _behaviour;

if(time - _time > _damage) then {
	_injuredperson setVariable ["bon_ais_agony",false,true];
};