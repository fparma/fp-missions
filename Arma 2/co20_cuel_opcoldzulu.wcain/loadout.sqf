// by cuel. useage in init: _nil = [this] execVM "loadout.sqf"
private ["_unit","_chance","_primaryWeapon","_muzzles"];
_unit = _this select 0;
_type = _this select 1;

removeAllWeapons _unit;
removeAllitems _unit;
removeBackpack _unit;

switch (_type) do
{   
    case "m21": {
        {_unit addMagazine "cwr2_20Rnd_762x51_NoTracer";} forEach [1,2,3,4,5,6];
        _unit addWeapon "cwr2_M21";
		};
    case "at": {
        {_unit addMagazine "cwr2_30Rnd_556x45_NATO";} forEach [1,2,3,4,5,6];
        _unit addWeapon "cwr2_XMS";
		{_unit addMagazine "cwr2_CarlGustavRocket";} forEach [1];
        _unit addWeapon "cwr2_CarlGustav";
		};
	    case "med": {
		_unit addBackpack "cwr2_BackpackMedic_US";
		_bp = unitBackpack _unit;
		clearMagazineCargoGlobal _bp;
		_bp addMagazineCargoGlobal ["cwr2_30Rnd_556x45_NATO",2];
		_bp addMagazineCargoGlobal ["SmokeShellGreen",2];
				_bp addMagazineCargoGlobal ["Handgrenade_West",2];
        {_unit addMagazine "cwr2_30Rnd_556x45_NATO";} forEach [1,2,3,4,5,6];
        _unit addWeapon "cwr2_XMS";
		};
		case "atass": {
		_unit addBackpack "cwr2_BackpackAmmo_US";
		_bp = unitBackpack _unit;
		clearMagazineCargoGlobal _bp;
		_bp addMagazineCargoGlobal ["cwr2_CarlGustavRocket",2];
		{_unit addMagazine "cwr2_30Rnd_556x45_NATO";} forEach [1,2,3,4,5,6];
        _unit addWeapon "cwr2_XMS";
	};
			case "sapper": {
			_unit addBackpack "cwr2_BackpackSpecop_US";
		_bp = unitBackpack _unit;
		clearMagazineCargoGlobal _bp;
		_bp addMagazineCargoGlobal ["PipeBomb",2];
		{_unit addMagazine "cwr2_30Rnd_556x45_NATO";} forEach [1,2,3,4,5,6];
		_unit addMagazine "PipeBomb";
        _unit addWeapon "cwr2_XMS";
		};
	    case "officer": {
				_unit addBackpack "cwr2_BackpackSpecop_US";
		_bp = unitBackpack _unit;
		clearMagazineCargoGlobal _bp;
		_bp addMagazineCargoGlobal ["cwr2_30Rnd_556x45_NATO",2];
		_bp addMagazineCargoGlobal ["SmokeShellGreen",2];
				_bp addMagazineCargoGlobal ["Handgrenade_West",2];
		{_unit addMagazine "cwr2_30Rnd_556x45_NATO";} forEach [1,2,3,4,5,6];
        _unit addWeapon "cwr2_G36";
		};
		default{
		{_unit addMagazine "cwr2_30Rnd_556x45_NATO";} forEach [1,2,3,4,5,6];
        _unit addWeapon "cwr2_XMS";
		};
};

if (_type != "at") then {
	{_unit addMagazine "SmokeShellGreen";} forEach [1,2];
	{_unit addMagazine "HandGrenade_West";} forEach [1,2];
};
{_unit addMagazine "cwr2_17Rnd_9x19_Para_SD";} forEach [1,2,3,4,5,6];
_unit addWeapon "cwr2_Glock_SD";
_unit addweapon "ItemMap";
_unit addweapon "ItemCompass";
_unit addweapon "ItemWatch";
_unit addweapon "ItemRadio";  
_unit addweapon "NVGoggles";



_primaryWeapon = primaryWeapon _unit;
_unit selectweapon _primaryWeapon;
// Fix for weapons with grenade launcher
_muzzles = getArray(configFile>>"cfgWeapons" >> _primaryWeapon >> "muzzles");
_unit selectWeapon (_muzzles select 0);