//by bon inf, edited by cuel.


player addEventHandler ["Killed",{
	player spawn {
		_unit = _this;
		_curGrp = group player;
	   [player] joinSilent grpNull;
		private ['_magazines','_weapons'];
		_weapons = weapons _unit;
		_magazines = magazines _unit;
		WaitUntil{alive player};
		

		removeAllWeapons player;
		removeAllItems player;
		{player addMagazine _x} foreach _magazines;
		{player addWeapon _x} foreach _weapons;
		if (primaryWeapon player != "") then {
       			player selectWeapon (primaryWeapon player);
	        	_muzzles = getArray(configFile>>"cfgWeapons" >> primaryWeapon player >> "muzzles"); // Fix for weapons with grenade launcher
		        player selectWeapon (_muzzles select 0);
		};
	[player] joinSilent _curGrp;
	_spawned = false;
    _pos =  [];
	_lead = leader(group player);
	if (alive _lead && player != _lead) then {
			_pos = (getPos  _lead) findEmptyPosition [15, 50, typeOf (vehicle player)];
			if (count _pos != 0) exitWith {_spawned=true; if (vehicle _lead == _lead) then {player setPos (getPos _lead);} else {player moveInCargo vehicle _lead;};};
		};
		{
			if (player != _x && alive _x  && !_spawned ) then {
				_char = _x;
				_pos = (getPos _char) findEmptyPosition [15, 50, typeOf (vehicle player)];
				if ((count _pos) != 0) exitWith  {_spawned=true; if (vehicle _char ==  _char) then {player setPos (getPos _char);} else {player moveInCargo (vehicle _char);};};
			};
		} forEach units (group player);
		if (!_spawned) then {
				{
					if (alive _x && _x != player && vehicle _x == _x) exitWith {player setPos (getPos _x)};
				}forEach playableUnits;
			};
		};
}];