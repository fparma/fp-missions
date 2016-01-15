// by cuel. useage in init: _nil = [this, "escort"] execVM "loadout.sqf"


private ["_unit","_loadout","_primaryWeapon","_muzzles"];
_unit = _this select 0;
_loadout = _this select 1;
removeAllWeapons _unit;
removeAllitems _unit;

switch (_loadout) do {
 case "escort": {
	 {_unit addMagazine "30Rnd_556x45_Stanag";} forEach [1,2,3,4,5,6];
	 _unit addWeapon "M4A1";
	{_unit addMagazine "17Rnd_9x19_glock17";} forEach [1,2,3,4];
	_unit addWeapon "glock17_EP1";
	_unit addMagazine "HandGrenade_West";
	_unit addweapon "ItemMap";
	_unit addweapon "ItemCompass";
	_unit addweapon "ItemWatch";  
	};
case "assassin": {
	 {_unit addMagazine "30Rnd_545x39_AK";} forEach [1,2,3,4,5,6];
	 _unit addWeapon "AK_74";
	{_unit addMagazine "8Rnd_9x18_Makarov";} forEach [1,2,3,4];
	_unit addWeapon "Makarov";
	_unit addMagazine "HandGrenade_East";
	_unit addWeapon "ItemGPS";
	_unit addweapon "ItemMap";
	_unit addweapon "ItemCompass";
	_unit addweapon "ItemWatch";  
	};
	default {
		 {_unit addMagazine "30Rnd_9x19_MP5";} forEach [1,2,3,4,5,6];
	 _unit addWeapon "MP5A5";
	{_unit addMagazine "17Rnd_9x19_glock17";} forEach [1,2,3,4];
	_unit addWeapon "glock17_EP1";
	_unit addMagazine "HandGrenade_West";
	_unit addweapon "ItemMap";
	_unit addweapon "ItemCompass";
	_unit addweapon "ItemWatch";  
	};
};


_primaryWeapon = primaryWeapon _unit;
_unit selectweapon _primaryWeapon;
// Fix for weapons with grenade launcher
_muzzles = getArray(configFile>>"cfgWeapons" >> _primaryWeapon >> "muzzles");
_unit selectWeapon (_muzzles select 0);