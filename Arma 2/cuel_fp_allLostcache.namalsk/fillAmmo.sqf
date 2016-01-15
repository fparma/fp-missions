//by cuel
// exec in ammo cache init, 
//null = [this, "low"] execVM "fillAmmo.sqf"
// replace low with the loadouts (example: "medium", "high")

//only server should do this
if (!isServer) exitWith {};
private ["_amountAmmo","_chance","_box","_type"];

//assign the parameters given from box's init field so we know which one to fill
_box = _this select 0;
_type = _this select 1;

//clear the boxes
clearWeaponCargoGlobal _box;

clearMagazineCargoGlobal _box;

switch (_type) do
{   
    case "low":
    {
	_amountAmmo = 2;
    _box addMagazineCargoGlobal ["20Rnd_762x51_DMR", _amountAmmo];
    _box addMagazineCargoGlobal ["7Rnd_45ACP_1911", _amountAmmo];
	_box addMagazineCargoGlobal ["8Rnd_B_Beneli_Pellets", _amountAmmo];
	_box addMagazineCargoGlobal ["17Rnd_9x19_glock17", _amountAmmo];
	_box addMagazineCargoGlobal ["8Rnd_B_Saiga12_Pellets", _amountAmmo];
	_box addMagazineCargoGlobal ["15Rnd_9x19_M9", _amountAmmo];
	_box addMagazineCargoGlobal ["30Rnd_762x39_SA58", _amountAmmo];
	_box addMagazineCargoGlobal ["6Rnd_45ACP", _amountAmmo];
	_box addMagazineCargoGlobal ["10x_303", _amountAmmo];
	_box addMagazineCargoGlobal ["30Rnd_9x19_UZI", _amountAmmo];


    };
    case "medium":
    {
    _amountAmmo = 4;
    _box addMagazineCargoGlobal ["20Rnd_762x51_DMR", _amountAmmo];
    _box addMagazineCargoGlobal ["7Rnd_45ACP_1911", _amountAmmo];
	_box addMagazineCargoGlobal ["8Rnd_B_Beneli_Pellets", _amountAmmo];
	_box addMagazineCargoGlobal ["17Rnd_9x19_glock17", _amountAmmo];
	_box addMagazineCargoGlobal ["8Rnd_B_Saiga12_Pellets", _amountAmmo];
	_box addMagazineCargoGlobal ["15Rnd_9x19_M9", _amountAmmo];
	_box addMagazineCargoGlobal ["30Rnd_762x39_SA58", _amountAmmo];
	_box addMagazineCargoGlobal ["6Rnd_45ACP", _amountAmmo];
	_box addMagazineCargoGlobal ["10x_303", _amountAmmo];
	_box addMagazineCargoGlobal ["30Rnd_9x19_UZI", _amountAmmo];

	_chance = floor(random 3);
	switch (_chance) do
	{
		case 0: {
			_box addWeaponCargoGlobal ["M4A3_CCO_EP1", 1];
 			_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _amountAmmo];
		};
		case 1: {
			_box addWeaponCargoGlobal ["SCAR_H_CQC_CCO", 1];
 			_box addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR", _amountAmmo];
		};
		case 2: {
			_box addWeaponCargoGlobal ["AK_107_GL_kobra", 1];
 			_box addMagazineCargoGlobal ["30Rnd_545x39_AK", _amountAmmo];
			_box addMagazineCargoGlobal ["1Rnd_HE_GP25", 4];
		};
	};
    };
    case "high":
    {
	_amountAmmo = 6;
    _box addMagazineCargoGlobal ["20Rnd_762x51_DMR", _amountAmmo];
    _box addMagazineCargoGlobal ["7Rnd_45ACP_1911", _amountAmmo];
	_box addMagazineCargoGlobal ["8Rnd_B_Beneli_Pellets", _amountAmmo];
	_box addMagazineCargoGlobal ["17Rnd_9x19_glock17", _amountAmmo];
	_box addMagazineCargoGlobal ["8Rnd_B_Saiga12_Pellets", _amountAmmo];
	_box addMagazineCargoGlobal ["15Rnd_9x19_M9", _amountAmmo];
	_box addMagazineCargoGlobal ["30Rnd_762x39_SA58", _amountAmmo];
	_box addMagazineCargoGlobal ["6Rnd_45ACP", _amountAmmo];
	_box addMagazineCargoGlobal ["10x_303", _amountAmmo];
	_box addMagazineCargoGlobal ["30Rnd_9x19_UZI", _amountAmmo];
	
	_chance = floor(random 3);
	switch (_chance) do
		{
			case 0: {
				_box addWeaponCargoGlobal ["M60A4_EP1", 1];
				_box addMagazineCargoGlobal ["100Rnd_762x51_M240", _amountAmmo-3];
			};
			case 1: {
				_box addWeaponCargoGlobal ["RPK_74", 1];
				_box addMagazineCargoGlobal ["75Rnd_545x39_RPK", _amountAmmo-3];
			};
			case 2: {
				_box addWeaponCargoGlobal ["M249", 1];
				_box addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag", _amountAmmo-3];
			};
		};
    };
   
};