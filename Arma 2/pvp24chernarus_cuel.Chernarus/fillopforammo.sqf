if (!isServer) exitWith {};
private ["_amountWeapon","_amountAmmo"];
_amountWeapon = 4;
_amountAmmo = 10;

// Clear box
clearWeaponCargoGlobal _this;
clearMagazineCargoGlobal _this;

// Fill box

// US Army Weapons & Ammo
_this addWeaponCargoGlobal ["AK_74", _amountWeapon]; _this addMagazineCargoGlobal ["30Rnd_545x39_AK", 50];

_this addWeaponCargoGlobal ["AK_74_GL", _amountWeapon]; _this addMagazineCargoGlobal ["1Rnd_HE_GP25", _amountAmmo];
_this addMagazineCargoGlobal ["FlareWhite_GP25", _amountAmmo];
_this addMagazineCargoGlobal ["FlareGreen_GP25", _amountAmmo];
_this addMagazineCargoGlobal ["FlareRed_GP25", _amountAmmo];
_this addMagazineCargoGlobal ["FlareYellow_GP25", _amountAmmo];
_this addMagazineCargoGlobal ["1Rnd_Smoke_GP25", _amountAmmo];
_this addMagazineCargoGlobal ["1Rnd_SmokeRed_GP25", _amountAmmo];
_this addMagazineCargoGlobal ["1Rnd_SmokeGreen_GP25", _amountAmmo];
_this addMagazineCargoGlobal ["1Rnd_SmokeYellow_GP25", _amountAmmo];

_this addWeaponCargoGlobal ["AK_74_GL_kobra", _amountWeapon];
_this addWeaponCargoGlobal ["AK_47_M", _amountWeapon]; _this addMagazineCargoGlobal ["30Rnd_762x39_AK47", 50];
_this addWeaponCargoGlobal ["AK_47_S", _amountWeapon];
_this addWeaponCargoGlobal ["AKS_74", _amountWeapon];
_this addWeaponCargoGlobal ["AKS_74_kobra", _amountWeapon];
_this addWeaponCargoGlobal ["AKS_74_pso", _amountWeapon];
_this addWeaponCargoGlobal ["AKS_74_U", _amountWeapon];
_this addWeaponCargoGlobal ["FN_FAL", _amountWeapon]; _this addMagazineCargoGlobal ["20Rnd_762x51_FNFAL", 50]; 

_this addWeaponCargoGlobal ["LeeEnfield", _amountWeapon]; _this addMagazineCargoGlobal ["10x_303", _amountAmmo];

_this addWeaponCargoGlobal ["PK", _amountWeapon]; _this addMagazineCargoGlobal ["100Rnd_762x54_PK", _amountAmmo];
_this addWeaponCargoGlobal ["RPK_74", _amountWeapon]; _this addMagazineCargoGlobal ["75Rnd_545x39_RPK", _amountAmmo];
_this addMagazineCargoGlobal ["30Rnd_545x39_AKSD", _amountAmmo];

_this addWeaponCargoGlobal ["KSVK",1]; _this addMagazineCargoGlobal ["5Rnd_127x108_KSVK", _amountAmmo];
_this addWeaponCargoGlobal ["SVD", 1];
_this addWeaponCargoGlobal ["UZI_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["30Rnd_9x19_UZI", _amountAmmo];
_this addWeaponCargoGlobal ["UZI_SD_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["30Rnd_9x19_UZI_SD", _amountAmmo];
_this addWeaponCargoGlobal ["Makarov", _amountWeapon]; _this addMagazineCargoGlobal ["8Rnd_9x18_Makarov", _amountAmmo];
_this addWeaponCargoGlobal ["MakarovSD", _amountWeapon]; _this addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD", _amountAmmo];
_this addWeaponCargoGlobal ["revolver_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["6Rnd_45ACP", _amountAmmo];
_this addWeaponCargoGlobal ["revolver_gold_EP1", _amountWeapon];

_this addWeaponCargoGlobal ["RPG7V", 1]; _this addMagazineCargoGlobal ["PG7V", _amountAmmo];
_this addMagazineCargoGlobal ["PG7VL", _amountAmmo];
_this addMagazineCargoGlobal ["PG7VR", _amountAmmo];
_this addMagazineCargoGlobal ["OG7", _amountAmmo];
_this addWeaponCargoGlobal ["MetisLauncher", 1]; _this addMagazineCargoGlobal ["AT13", _amountAmmo];

_this addMagazineCargoGlobal ["HandGrenade", _amountAmmo];
_this addMagazineCargoGlobal ["HandGrenade_East", _amountAmmo];

_this addWeaponCargoGlobal ["Binocular_Vector", _amountWeapon];
_this addWeaponCargoGlobal ["Binocular", _amountWeapon];