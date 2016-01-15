/*
null = [this, "M4"] execVM "loadout.sqf"
*/

_unit = _this select 0;
_strLoadout = _this select 1;

removeAllWeapons _unit;
removeAllitems _unit;

switch (_strLoadout) do
{   
	case "M4":
	{
		_unit addMagazine "30Rnd_556x45_Stanag";
		_unit addWeapon "M4A1_Aim";
		_unit addMagazine "HandGrenade_West";
		_unit addWeapon "M9";
		_unit addMagazine "PipeBomb";
		_unit addMagazine "SmokeShellBlue";
		{_unit addMagazine "30Rnd_556x45_Stanag";} forEach [1,2,3,4,5,6,7,8];
		{_unit addMagazine "15Rnd_9x19_M9";} forEach [1,2,3,4,5,6];
		_unit addweapon "Binocular";
		_unit addweapon "NVGoggles";
		_unit addweapon "ItemMap";
		_unit addweapon "ItemGPS";
		_unit addweapon "ItemCompass";
		_unit addweapon "ItemWatch";
		_unit addweapon "ItemRadio";

	};
	case "MGun":
	{
		_unit addMagazine "100Rnd_762x51_M240";
		_unit addWeapon "Mk_48";
		_unit addMagazine "HandGrenade_West";
		_unit addWeapon "M9";
		_unit addMagazine "PipeBomb";
		_unit addMagazine "SmokeShellBlue";
		{_unit addMagazine "100Rnd_762x51_M240";} forEach [1,2,3,4];
		{_unit addMagazine "15Rnd_9x19_M9";} forEach [1,2,3,4,5,6];
		_unit addweapon "Binocular";
		_unit addweapon "NVGoggles";
		_unit addweapon "ItemMap";
		_unit addweapon "ItemGPS";
		_unit addweapon "ItemCompass";
		_unit addweapon "ItemWatch";
		_unit addweapon "ItemRadio";

	};
   
};


_primaryWeapon = primaryWeapon _unit;
_unit selectweapon _primaryWeapon;
// Fix for weapons with grenade launcher
_muzzles = getArray(configFile>>"cfgWeapons" >> _primaryWeapon >> "muzzles");
_unit selectWeapon (_muzzles select 0);