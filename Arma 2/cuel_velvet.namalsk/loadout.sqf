/*
null = [this, "Basic"] execVM "loadout.sqf"
*/

_unit = _this select 0;
_strLoadout = _this select 1;
_chance = round(random 4);

removeAllWeapons _unit;
removeAllitems _unit;
removeBackpack _unit;

switch (_strLoadout) do
{   
    case "Basic":
    {
	if (_chance == 0) then {
		_unit addWeapon "M14_EP1";
		_unit addMagazineCargo "20Rnd_762x51_DMR";
		_unit addWeaponCargo "Colt1911";
		_unit addMagazineCargo "7Rnd_45ACP_1911";
} else if (_chance == 1) then {
M1014
8Rnd_B_Beneli_Pellets 
_unit addWeapon "glock17_EP1";
_unit addMagazine "17Rnd_9x19_glock17";

} else if (_chance == 2) then {
_this addWeaponCargo ["M9", _amountWeapon];
 _this addMagazineCargo ["15Rnd_9x19_M9", _amountAmmo];

} else if (_chance == 3) then {
_this addWeaponCargo ["Sa58P_EP1", _amountWeapon]; _this addMagazineCargo ["30Rnd_762x39_SA58", _amountAmmo];
_this addWeaponCargo ["revolver_EP1", _amountWeapon]; _this 
addMagazineCargo ["6Rnd_45ACP", _amountAmmo];

} else if (_chance == 4) then {
_this addWeaponCargo ["LeeEnfield", _amountWeapon]; _this addMagazineCargo ["10x_303", _amountAmmo];
_this addWeaponCargo ["UZI_EP1", _amountWeapon]; _this addMagazineCargo ["30Rnd_9x19_UZI", _amountAmmo];
};
            _unit addMagazine "20Rnd_762x51_SB_SCAR";
            _unit addWeapon "SCAR_H_CQC_CCO_SD";
            {_unit addMagazine "20Rnd_762x51_SB_SCAR";} forEach [1,2,3,4,5,6,7,8];
            {_unit addMagazine "15Rnd_9x19_M9SD";} forEach [1,2,3,4,5,6];
            _unit addWeapon "M9SD";
	_unit action ["NVGoggles", _unit];
        _unit addMagazine "HandGrenade_West";
        _unit addMagazine "PipeBomb";
        _unit addMagazine "SmokeShellBlue";
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