removeAllWeapons player;
removeAllItems player;

//time to add weapons. credits to Celery
_gun= C_WEAPONS select (floor(random(count C_WEAPONS)));
_guntype=getNumber (configFile/"CfgWeapons"/_gun/"type");
_muzzles=getArray (configFile/"CfgWeapons"/_gun/"muzzles");
_magcount= 4+round(ceil(random(8)));

_mag = _gun call CUEL_getAmmo;
for "_x" from 1 to _magcount do {player addMagazine _mag};

//Add weapon and select it if the unit doesn't already have one
player addWeapon _gun;
_muzzle=if !("this" in _muzzles) then {_muzzles select 0} else {_gun};
_currentweapontype=getNumber (configFile/"CfgWeapons"/(currentWeapon player)/"type");

if (!(_currentweapontype in [1,2,4,5]) and _guntype in [1,2,4,5]) then {
	player selectWeapon _muzzle;
};

//pistols 
if (random 1 < 0.5) then {
	_gun = C_PISTOLS select (floor(random(count C_PISTOLS)));
	_magcount= 2+round(ceil(random(4)));
	_mag = _gun call CUEL_getAmmo;
	for "_x" from 1 to _magcount do {player addMagazine _mag};
	player addWeapon  _gun;
};

if (param_ace_meditems != 0) then {
		switch param_ace_meditems do {
			case 1:{[player,0,0,0,true] call ACE_fnc_PackIFAK;};
			case 2:{[player,0,2,0,true] call ACE_fnc_PackIFAK;};
			case 3:{[player,2,2,0,true] call ACE_fnc_PackIFAK;};
			case 4:{[player,2,2,2,true] call ACE_fnc_PackIFAK; player addMagazine "ACE_Medkit";};
		};
}else{
	[player,2,2,2,true] call ACE_fnc_PackIFAK;
};

//ACRE automatically converts radio to PRC-343
{player addWeapon _x}forEach ["ItemWatch","ItemCompass","ItemMap","ACE_Earplugs","ItemRadio"];

if (param_acre == 1) then {player addWeapon "ACRE_PRC148_UHF"};

if (param_nvg == 1) then {player addWeapon "NVGoggles"};