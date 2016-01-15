// by cuel. useage in init: _nil = [this] execVM "loadout.sqf"



private ["_unit","_chance","_primaryWeapon","_muzzles"];
_unit = _this select 0;
_chance = floor(random 5);

removeAllWeapons _unit;
removeAllitems _unit;
removeBackpack _unit;

switch (_chance) do
{   
    case 0: {
        {_unit addMagazine "20Rnd_762x51_DMR";} forEach [1,2,3];
        {_unit addMagazine "7Rnd_45ACP_1911";} forEach [1,2,3,4,5];
        _unit addWeapon "M14_EP1";
        _unit addWeapon "Colt1911";
        
    };
    case 1: {
        {_unit addMagazine "8Rnd_B_Beneli_Pellets";} forEach [1,2,3,4,5];
        {_unit addMagazine "17Rnd_9x19_glock17";} forEach [1,2,3,4];
        _unit addWeapon "M1014";
        _unit addWeapon "glock17_EP1";
        
    };
    case 2: {
        {_unit addMagazine "8Rnd_B_Saiga12_Pellets";} forEach [1,2,3,4];
        {_unit addMagazine "15Rnd_9x19_M9";} forEach [1,2,3,4];
        _unit addWeapon "Saiga12K";
        _unit addWeapon "M9";
    };
    case 3: {
        {_unit addMagazine "30Rnd_762x39_SA58";} forEach [1,2,3];
        {_unit addMagazine "6Rnd_45ACP";} forEach [1,2,3,4,5,6];
        _unit addWeapon "Sa58P_EP1";
        _unit addWeapon "revolver_EP1";
    };
    case 4: {
        {_unit addMagazine "10x_303";} forEach [1,2,3,4,5];
        {_unit addMagazine "30Rnd_9x19_UZI";} forEach [1,2,3,4,5];
        _unit addWeapon "LeeEnfield";
        _unit addWeapon "UZI_EP1"; 
    };
	default{
		{_unit addMagazine "17Rnd_9x19_glock17";} forEach [1,2,3,4,5,6];
		_unit addWeapon "glock17_EP1";
	};
};
_unit addMagazine "HandGrenade_West";
_unit addMagazine "HandGrenade_West";
_unit addweapon "ItemMap";
_unit addweapon "ItemCompass";
_unit addweapon "ItemWatch";  


_primaryWeapon = primaryWeapon _unit;
_unit selectweapon _primaryWeapon;
// Fix for weapons with grenade launcher
_muzzles = getArray(configFile>>"cfgWeapons" >> _primaryWeapon >> "muzzles");
_unit selectWeapon (_muzzles select 0);