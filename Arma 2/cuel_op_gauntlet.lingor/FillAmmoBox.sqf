_amountWeapon = 4;
_amountAmmo = 20;
_refreshTime = 600; // refill every 10 minutes

// dont break the box you FUCK
_this allowDamage false;


if (isServer) then {
while {true} do

{

// Clear box
clearWeaponCargoGlobal _this;
clearMagazineCargoGlobal _this;

// Fill box

_this addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _amountAmmo];
_this addWeaponCargoGlobal ["M14_EP1", _amountWeapon]; 
_this addMagazineCargoGlobal ["20Rnd_762x51_DMR", _amountAmmo];
_this addWeaponCargoGlobal ["M16A2", _amountWeapon];
_this addWeaponCargoGlobal ["M16A2GL", _amountWeapon]; 
_this addMagazineCargoGlobal ["1Rnd_HE_M203", _amountAmmo];
_this addMagazineCargoGlobal ["1Rnd_SmokeYellow_M203", _amountAmmo];
_this addWeaponCargoGlobal ["M4A1", _amountWeapon];
_this addWeaponCargoGlobal ["M4A3_CCO_EP1", _amountWeapon];
_this addWeaponCargoGlobal ["Mk_48_DES_EP1", _amountWeapon];
_this addWeaponCargoGlobal ["M24_des_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["5Rnd_762x51_M24", _amountAmmo];
_this addWeaponCargoGlobal ["Colt1911", _amountWeapon]; _this addMagazineCargoGlobal ["7Rnd_45ACP_1911", _amountAmmo];
_this addWeaponCargoGlobal ["M9", _amountWeapon]; _this addMagazineCargoGlobal ["15Rnd_9x19_M9", _amountAmmo];
_this addMagazineCargoGlobal ["15Rnd_9x19_M9SD", _amountAmmo];
_this addWeaponCargoGlobal ["M9SD", _amountWeapon];
_this addWeaponCargoGlobal ["M136", _amountWeapon-2]; _this addMagazineCargoGlobal ["M136", _amountAmmo];
_this addMagazineCargoGlobal ["HandGrenade_West", _amountAmmo];
_this addWeaponCargoGlobal ["UZI_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["30Rnd_9x19_UZI", _amountAmmo];
_this addWeaponCargoGlobal ["revolver_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["6Rnd_45ACP", _amountAmmo];
_this addMagazineCargoGlobal ["PipeBomb", _amountAmmo];
_this addMagazineCargoGlobal ["100Rnd_762x51_M240", _amountAmmo];
_this addWeaponCargoGlobal ["MP5A5", _amountWeapon+5]; 
_this addMagazineCargoGlobal ["30Rnd_9x19_MP5", _amountAmmo];


sleep _refreshTime;
};
};