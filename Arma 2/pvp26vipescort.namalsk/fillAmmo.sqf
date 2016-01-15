if (!isServer) exitWith {};
private ["_amountWeapon","_amountAmmo"];
_amountWeapon = 4;
_amountAmmo = 10;

// Clear box
clearWeaponCargoGlobal _this;
clearMagazineCargoGlobal _this;

// Fill box

_this addWeaponCargoGlobal ["AK_74", _amountWeapon]; _this addMagazineCargoGlobal ["30Rnd_545x39_AK", _amountAmmo+60];
_this addWeaponCargoGlobal ["AK_74_GL", _amountWeapon+2]; _this addMagazineCargoGlobal ["1Rnd_HE_GP25", _amountAmmo+20];
_this addMagazineCargoGlobal ["FlareWhite_GP25", _amountAmmo];
_this addMagazineCargoGlobal ["1Rnd_Smoke_GP25", _amountAmmo];
_this addMagazineCargoGlobal ["1Rnd_SmokeRed_GP25", _amountAmmo];
_this addWeaponCargoGlobal ["AK_74_GL_kobra", _amountWeapon];
_this addWeaponCargoGlobal ["AK_47_M", _amountWeapon]; _this addMagazineCargoGlobal ["30Rnd_762x39_AK47", _amountAmmo+20];
_this addWeaponCargoGlobal ["AK_47_S", _amountWeapon];
_this addWeaponCargoGlobal ["AKS_74", _amountWeapon];
_this addWeaponCargoGlobal ["AKS_74_kobra", _amountWeapon];
_this addWeaponCargoGlobal ["AKS_74_pso", _amountWeapon];
_this addWeaponCargoGlobal ["AKS_74_U", _amountWeapon];
_this addWeaponCargoGlobal ["FN_FAL", _amountWeapon]; _this addMagazineCargoGlobal ["20Rnd_762x51_FNFAL", _amountAmmo];
_this addWeaponCargoGlobal ["LeeEnfield", _amountWeapon]; _this addMagazineCargoGlobal ["10x_303", _amountAmmo];
_this addMagazineCargoGlobal ["SmokeShellRed", _amountAmmo];
_this addWeaponCargoGlobal ["PK", _amountWeapon-2]; _this addMagazineCargoGlobal ["100Rnd_762x54_PK", _amountAmmo];
_this addWeaponCargoGlobal ["RPK_74", _amountWeapon-2]; _this addMagazineCargoGlobal ["75Rnd_545x39_RPK", _amountAmmo];
_this addMagazineCargoGlobal ["30Rnd_545x39_AKSD", _amountAmmo];
_this addWeaponCargoGlobal ["SVD", _amountWeapon-2]; _this addMagazineCargoGlobal ["10Rnd_762x54_SVD", _amountAmmo];
_this addWeaponCargoGlobal ["Makarov", _amountWeapon]; _this addMagazineCargoGlobal ["8Rnd_9x18_Makarov", _amountAmmo];
_this addWeaponCargoGlobal ["MakarovSD", _amountWeapon]; _this addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD", _amountAmmo];
_this addWeaponCargoGlobal ["revolver_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["6Rnd_45ACP", _amountAmmo];
_this addWeaponCargoGlobal ["revolver_gold_EP1", _amountWeapon];
_this addWeaponCargoGlobal ["RPG7V", _amountWeapon-3]; _this addMagazineCargoGlobal ["PG7V", _amountAmmo-8];
_this addWeaponCargoGlobal ["UZI_SD_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["30Rnd_9x19_UZI_SD", _amountAmmo];
