/*
null = [this, "M4"] execVM "loadout.sqf"
*/

_unit = _this select 0;
_strLoadout = _this select 1;

removeAllWeapons _unit;
removeAllitems _unit;
waitUntil {!(isNil "paramsArray")};
switch (_strLoadout) do
{   
    case "Mk17SD":
    {
        if ((paramsArray select 0) == 0) then {
            _unit addMagazine "20Rnd_762x51_SB_SCAR";
            _unit addWeapon "SCAR_H_CQC_CCO_SD";
            {_unit addMagazine "20Rnd_762x51_SB_SCAR";} forEach [1,2,3,4,5,6,7,8];
            {_unit addMagazine "15Rnd_9x19_M9SD";} forEach [1,2,3,4,5,6];
            _unit addWeapon "M9SD";
	_unit action ["NVGoggles", _unit];
        } else {
            _unit addMagazine "30Rnd_556x45_Stanag";
            _unit addWeapon "M4A3_CCO_EP1";
            {_unit addMagazine "30Rnd_556x45_Stanag";} forEach [1,2,3,4,5,6,7,8];
            {_unit addMagazine "15Rnd_9x19_M9";} forEach [1,2,3,4,5,6];
            _unit addWeapon "M9";
        };
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
        removeBackpack _unit;
        _unit addBackpack "US_Patrol_Pack_Specops_EP1";

    };
    case "Medic":
    {
        if ((paramsArray select 0) == 0) then {
            _unit addMagazine "30Rnd_556x45_StanagSD";
            _unit addWeapon "SCAR_L_CQC_CCO_SD";
            {_unit addMagazine "30Rnd_556x45_StanagSD";} forEach [1,2,3,4,5,6,7,8];
            {_unit addMagazine "15Rnd_9x19_M9SD";} forEach [1,2,3,4,5,6];
            _unit addWeapon "M9SD";
        } else {
            _unit addMagazine "30Rnd_556x45_Stanag";
            _unit addWeapon "M4A1";
            {_unit addMagazine "30Rnd_556x45_Stanag";} forEach [1,2,3,4,5,6,7,8];
            {_unit addMagazine "15Rnd_9x19_M9";} forEach [1,2,3,4,5,6];
            _unit addWeapon "M9";
        };
        _unit addMagazine "HandGrenade_West";
        _unit addMagazine "PipeBomb";
        _unit addMagazine "SmokeShellBlue";
        {_unit addMagazine "30Rnd_556x45_StanagSD";} forEach [1,2,3,4,5,6,7,8];
        {_unit addMagazine "15Rnd_9x19_M9SD";} forEach [1,2,3,4,5,6];
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