//functions, written by Celery, edited by cuel.
//Random zombie
CLY_randomzombie={
	private ["_zombie"];
	_zombie=CLY_zombieclasses select floor random count CLY_zombieclasses;
	while {typeName _zombie=="ARRAY"} do {
		_zombie=_zombie select floor random count _zombie;
	};
	_zombie;
};

//Random armored zombie classname
CLY_randomarmoredzombie={
	private ["_zombie"];
	_zombie=CLY_armoredzombieclasses select floor random count CLY_armoredzombieclasses;
	while {typeName _zombie=="ARRAY"} do {
		_zombie=_zombie select floor random count _zombie;
	};
	_zombie;
};

//Zombie damage handling
CLY_zombiehandledamage={
	private ["_zombie","_armored"];
	_zombie=_this;
	_zombie removeAllEventhandlers "handleDamage";
	sleep 0.1;
	_armored=_zombie getVariable "zombietype" in ["armored","slow armored"] or typeOf _zombie in CLY_armoredzombieclasses;
	if (!_armored) then {
		_zombie addEventHandler [
			"HandleDamage",
			{
				_unit=_this select 0;
				if (!alive _unit) exitWith {_unit removeAllEventHandlers "HandleDamage"};
				_damage=_this select 2;
				_cal = getNumber(configFile >> "CfgAmmo" >> (_this select 4) >> "caliber");
				_p = if (_cal <0.45) then {1.1}else{1};
				if (isNil {_unit getVariable "gethit"}) then {_unit setVariable ["gethit",[0,0,0,0]]};
				_gethit=_unit getVariable "gethit";
				switch (_this select 1) do {
					case "":{_damage=damage _unit+_damage*0.1};
					case "head_hit":{_damage=(_gethit select 0)+(_damage-(_gethit select 0))*2;_gethit set [0,_damage]};
					case "body":{_damage=(_gethit select 1)+(_damage-(_gethit select 1))*0.30*_p;_gethit set [1,_damage]};
					case "legs":{_damage=(_gethit select 3)+(_damage-(_gethit select 3))*0.25*_p;_gethit set [3,_damage]};
				};
				if (_this select 3!=_unit) then {
					if (!(_unit getVariable ["incombat",false])) then {
						_unit setVariable ["victim",vehicle(_this select 3)];
						_unit doMove (getPosATL (_this select 3));
					};
				};
				_damage;
			}
		];
	} else {
		_zombie addEventHandler [
			"HandleDamage",
			{
				_unit=_this select 0;
				if (!alive _unit) exitWith {_unit removeAllEventHandlers "handleDamage"};
				_damage=_this select 2;
				if (isNil {_unit getVariable "gethit"}) then {_unit setVariable ["gethit",[0,0,0,0]]};
				_gethit=_unit getVariable "gethit";
				switch (_this select 1) do {
					case "":{_damage=damage _unit+_damage*0.05};
					case "head_hit":{_damage=(_gethit select 0)+(_damage-(_gethit select 0))*0.1;_gethit set [0,_damage]};
					case "body":{_damage=(_gethit select 1)+(_damage-(_gethit select 1))*0.1;_gethit set [1,_damage]};
					case "legs":{_damage=0};
				};
				if (_this select 3!=_unit) then {
					if (!(_unit getVariable ["incombat",false])) then {
						_unit setVariable ["victim",vehicle(_this select 3)];
						_unit doMove (getPosATL (_this select 3));
					};
				};
				_damage;
			}
		];
	};
};