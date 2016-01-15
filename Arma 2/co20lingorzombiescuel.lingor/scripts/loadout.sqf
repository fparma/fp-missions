// by cuel. useage in init: _nil = [this] execVM "loadout.sqf"

private ["_unit","_chance","_primaryWeapon","_muzzles"];
_unit = _this select 0;


removeAllWeapons _unit;
removeAllitems _unit;
removeBackpack _unit;
if  ((typeof _unit) == "ibr_cop1") then {
        {_unit addMagazine "20Rnd_762x51_B_SCAR";} forEach [1,2,3,4,5,6];
        _unit addWeapon "SCAR_H_CQC_CCO";
} else {
	_chance = floor(random 5);
	switch (_chance) do
	{   
		case 0: {
			{_unit addMagazine "20Rnd_762x51_DMR";} forEach [1,2,3,4];
			_unit addWeapon "M14_EP1";
		};
		case 1: {
			{_unit addMagazine "8Rnd_B_Beneli_Pellets";} forEach [1,2,3,4,5];
			_unit addWeapon "M1014";
		};
		case 2: {
			{_unit addMagazine "20Rnd_762x51_FNFAL";} forEach [1,2,3,4];
			_unit addWeapon "FN_FAL";
		};
		case 3: {
			{_unit addMagazine "8Rnd_B_Saiga12_Pellets";} forEach [1,2,3,4];
			_unit addWeapon "Saiga12K";
		};
		case 4: {
			{_unit addMagazine "10x_303";} forEach [1,2,3,4,5,6];
			_unit addWeapon "LeeEnfield";
		};
		default{
		hint "BUG";
		};
	};
};
if ((random 2) < 1) then {
        {_unit addMagazine "17Rnd_9x19_glock17";} forEach [1,2,3,4];
        _unit addWeapon "glock17_EP1";
} else {
        {_unit addMagazine "7Rnd_45ACP_1911";} forEach [1,2,3,4,5];
        _unit addWeapon "Colt1911";
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