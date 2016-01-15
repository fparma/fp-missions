// by cuel. useage in init: _nil = [this] execVM "loadout.sqf"
private ["_unit","_chance","_primaryWeapon","_muzzles"];
_unit = _this select 0;
_type = _this select 1;

removeAllWeapons _unit;
removeAllitems _unit;
//removeBackpack _unit;

switch (_type) do
{   
    case "at": {
	removeBackpack _unit;
        {_unit addMagazine "cwr2_30Rnd_9x19_MP5_SD";} forEach [1,2,3,4,5,6];
        _unit addWeapon "cwr2_MP5SD6";
		{_unit addMagazine "cwr2_CarlGustavRocket";} forEach [1];
        _unit addWeapon "cwr2_CarlGustav";
		};
		case "atass": {
		removeBackpack _unit;
		_unit addBackpack "cwr2_BackpackAmmo_US";
		_bp = unitBackpack _unit;
		clearMagazineCargoGlobal _bp;
		_bp addMagazineCargoGlobal ["cwr2_CarlGustavRocket",2];
        {_unit addMagazine "cwr2_30Rnd_9x19_MP5_SD";} forEach [1,2,3,4,5,6];
        _unit addWeapon "cwr2_MP5SD6";	
		};
		case "fac": {
		_bp = unitBackpack _unit;
		clearMagazineCargoGlobal _bp;
		_bp addMagazineCargoGlobal ["cwr2_30Rnd_9x19_MP5_SD",2];
		_bp addMagazineCargoGlobal ["SmokeShellGreen",2];
		_bp addMagazineCargoGlobal ["Laserbatteries",1];
        {_unit addMagazine "cwr2_30Rnd_9x19_MP5_SD";} forEach [1,2,3,4,5,6];
		_unit addMagazine "Laserbatteries";
		_unit addWeapon "Laserdesignator";
        _unit addWeapon "cwr2_MP5SD6";
	};
			case "sapper": {
		_bp = unitBackpack _unit;
		clearMagazineCargoGlobal _bp;
		_bp addMagazineCargoGlobal ["PipeBomb",2];
        {_unit addMagazine "cwr2_30Rnd_9x19_MP5_SD";} forEach [1,2,3,4,5,6];
        _unit addWeapon "cwr2_MP5SD6";
		_unit addMagazine "PipeBomb";
        _unit addWeapon "cwr2_MP5SD6";
		};
	    case "officer": {
		_bp = unitBackpack _unit;
		clearMagazineCargoGlobal _bp;
		_bp addMagazineCargoGlobal ["cwr2_30Rnd_9x19_MP5_SD",2];
		_bp addMagazineCargoGlobal ["SmokeShellGreen",2];
				_bp addMagazineCargoGlobal ["PipeBomb",2];
        {_unit addMagazine "cwr2_30Rnd_9x19_MP5_SD";} forEach [1,2,3,4,5,6];
        _unit addWeapon "cwr2_MP5SD6";
		};
		default{
				_bp = unitBackpack _unit;
		clearMagazineCargoGlobal _bp;
		_bp addMagazineCargoGlobal ["cwr2_30Rnd_9x19_MP5_SD",2];
		_bp addMagazineCargoGlobal ["SmokeShellGreen",2];
		_bp addMagazineCargoGlobal ["Handgrenade_West",2];
        {_unit addMagazine "cwr2_30Rnd_9x19_MP5_SD";} forEach [1,2,3,4,5,6];
        _unit addWeapon "cwr2_MP5SD6";
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