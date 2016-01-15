//Player states script
//Saves player damage and loadout

if (!isServer) exitWith {};

sleep 10;

while {true} do {
	_changed=false;
	//Add new players
	{
		_unit=_x;
		if ({typeOf _unit in _x} count CLY_playerstates==0 and isPlayer _unit and alive _unit and !isNil {_unit getVariable "CLY_playerstates"}) then {
			CLY_playerstates set [count CLY_playerstates,[_unit,typeOf _unit,damage _unit,if (!isNil {_unit getVariable "CLY_healings"}) then {_unit getVariable "CLY_healings"} else {0},magazines _unit,weapons _unit-items _unit,items _unit]];
			publicVariable "CLY_playerstates";
		};
	} forEach CLY_players;
	//Update player state
	{
		if (count _x>0) then {
			_index=_forEachIndex;
			_unit=_x select 0;
			_left=_x select 1;
			_damage=_x select 2;
			_bandages=_x select 3;
			_magazines=_x select 4;
			_weapons=_x select 5;
			_items=_x select 6;
			_array=_x;
			_arraychanged=false;
			if (!isNull _unit and alive _unit) then {
				//Damage
				if (damage _unit!=_damage) then {
					_array set [2,damage _unit];
					_arraychanged=true;
				};
				//Bandages
				if (!isNil {_unit getVariable "CLY_healings"}) then {
					if (_unit getVariable "CLY_healings"!=_bandages) then {
						_array set [3,_unit getVariable "CLY_healings"];
						_arraychanged=true;
					};
				};
				//Magazines
				_magazineschanged=false;
				if (count magazines _unit==count _magazines) then {
					{if (_x!=(magazines _unit select _forEachIndex)) then {_magazineschanged=true}} forEach _magazines;
				} else {
					_magazineschanged=true;
				};
				if (_magazineschanged) then {
					_array set [4,magazines _unit];
					_arraychanged=true;
				};
				//Weapons
				_weaponschanged=false;
				if (count (weapons _unit-items _unit)==count _weapons) then {
					{if (_x!=((weapons _unit-items _unit) select _forEachIndex)) then {_weaponschanged=true}} forEach _weapons;
				} else {
					_weaponschanged=true;
				};
				if (_weaponschanged) then {
					_array set [5,weapons _unit-items _unit];
					_arraychanged=true;
				};
				//Items
				_itemschanged=false;
				if (count items _unit==count _items) then {
					{if (_x!=(items _unit select _forEachIndex)) then {_itemschanged=true}} forEach _items;
				} else {
					_itemschanged=true;
				};
				if (_itemschanged) then {
					_array set [6,items _unit];
					_arraychanged=true;
				};
			};
			//Update array
			if (_arraychanged) then {
				CLY_playerstates set [_index,_array];
				_changed=true;
			};
		};
	} forEach CLY_playerstates;
	if (_changed) then {publicVariable "CLY_playerstates"};
	sleep 1;
};