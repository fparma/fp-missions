if (!isServer) exitWith {};
private ["_amountWeapon","_amountAmmo"];
_amountWeapon = 4;
_amountAmmo = 10;

// Clear box
clearWeaponCargoGlobal _this;
clearMagazineCargoGlobal _this;

// Fill box

// US Army Weapons & Ammo
_this addWeaponCargoGlobal ["M14_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["20Rnd_762x51_DMR",  50];
_this addWeaponCargoGlobal ["M16A2", _amountWeapon];
_this addWeaponCargoGlobal ["M16A2GL", _amountWeapon]; _this addMagazineCargoGlobal ["1Rnd_HE_M203", _amountAmmo];
_this addMagazineCargoGlobal ["FlareWhite_M203", _amountAmmo];
_this addMagazineCargoGlobal ["FlareGreen_M203", _amountAmmo];
_this addMagazineCargoGlobal ["FlareRed_M203", _amountAmmo];
_this addMagazineCargoGlobal ["FlareYellow_M203", _amountAmmo];
_this addMagazineCargoGlobal ["1Rnd_Smoke_M203", _amountAmmo];
_this addMagazineCargoGlobal ["1Rnd_SmokeRed_M203", _amountAmmo];
_this addMagazineCargoGlobal ["1Rnd_SmokeGreen_M203", _amountAmmo];
_this addMagazineCargoGlobal ["1Rnd_SmokeYellow_M203", _amountAmmo];

_this addWeaponCargoGlobal ["M4A1", _amountWeapon];
_this addWeaponCargoGlobal ["M4A3_RCO_GL_EP1", _amountWeapon];
_this addWeaponCargoGlobal ["M4A3_CCO_EP1", _amountWeapon];
_this addWeaponCargoGlobal ["SCAR_L_CQC_CCO_SD", _amountWeapon];
_this addWeaponCargoGlobal ["SCAR_L_CQC", _amountWeapon];
_this addWeaponCargoGlobal ["SCAR_L_CQC_Holo", _amountWeapon];
_this addWeaponCargoGlobal ["SCAR_L_CQC_EGLM_Holo", _amountWeapon];
_this addWeaponCargoGlobal ["SCAR_L_STD_EGLM_RCO", _amountWeapon];
_this addWeaponCargoGlobal ["SCAR_L_STD_HOLO", _amountWeapon];
_this addWeaponCargoGlobal ["SCAR_L_STD_Mk4CQT", _amountWeapon];
_this addWeaponCargoGlobal ["SCAR_H_CQC_CCO", _amountWeapon]; _this addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR", 50];
_this addWeaponCargoGlobal ["SCAR_H_CQC_CCO_SD", _amountWeapon]; _this addMagazineCargoGlobal ["20Rnd_762x51_SB_SCAR", 50];
_this addWeaponCargoGlobal ["SCAR_H_STD_EGLM_Spect", _amountWeapon];
_this addWeaponCargoGlobal ["SCAR_H_LNG_Sniper", _amountWeapon];
_this addWeaponCargoGlobal ["SCAR_H_LNG_Sniper_SD", _amountWeapon];

_this addWeaponCargoGlobal ["m240_scoped_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["100Rnd_762x51_M240", _amountAmmo];
_this addWeaponCargoGlobal ["M249_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["200Rnd_556x45_M249", _amountAmmo];
_this addMagazineCargoGlobal ["100Rnd_556x45_M249", _amountAmmo];

_this addWeaponCargoGlobal ["M249_m145_EP1", _amountWeapon];
_this addWeaponCargoGlobal ["M60A4_EP1", _amountWeapon];
_this addWeaponCargoGlobal ["Mk_48_DES_EP1", _amountWeapon];

_this addWeaponCargoGlobal ["m107", 1]; _this addMagazineCargoGlobal ["10Rnd_127x99_m107", _amountAmmo];
_this addWeaponCargoGlobal ["M24_des_EP1", 1]; _this addMagazineCargoGlobal ["5Rnd_762x51_M24", _amountAmmo];

_this addWeaponCargoGlobal ["Colt1911", _amountWeapon]; _this addMagazineCargoGlobal ["7Rnd_45ACP_1911", _amountAmmo];
_this addWeaponCargoGlobal ["M9", _amountWeapon]; _this addMagazineCargoGlobal ["15Rnd_9x19_M9", _amountAmmo];
_this addMagazineCargoGlobal ["15Rnd_9x19_M9SD", _amountAmmo];
_this addWeaponCargoGlobal ["M9SD", _amountWeapon];

_this addWeaponCargoGlobal ["M136", 1]; _this addMagazineCargoGlobal ["M136", _amountAmmo];
_this addWeaponCargoGlobal ["MAAWS", 1]; _this addMagazineCargoGlobal ["MAAWS_HEAT", _amountAmmo];
 _this addMagazineCargoGlobal ["MAAWS_HEDP", _amountAmmo];


_this addMagazineCargoGlobal ["HandGrenade_West", _amountAmmo];

// German Weapons
_this addWeaponCargoGlobal ["G36A_camo", _amountWeapon]; _this addMagazineCargoGlobal ["30Rnd_556x45_G36", _amountAmmo];
_this addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag", _amountAmmo];
_this addMagazineCargoGlobal ["30Rnd_556x45_G36SD", _amountAmmo];
_this addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _amountAmmo];
_this addMagazineCargoGlobal ["30Rnd_556x45_StanagSD", _amountAmmo];
_this addMagazineCargoGlobal ["20Rnd_556x45_Stanag", _amountAmmo];

_this addWeaponCargoGlobal ["G36C_camo", _amountWeapon];
_this addWeaponCargoGlobal ["G36_C_SD_camo", _amountWeapon];
_this addWeaponCargoGlobal ["G36K_camo", _amountWeapon];

_this addWeaponCargoGlobal ["MG36_camo", _amountWeapon];

_this addWeaponCargoGlobal ["glock17_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["17Rnd_9x19_glock17", _amountAmmo];

// Czeck Weapons
_this addWeaponCargoGlobal ["Sa58P_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["30Rnd_762x39_SA58", _amountAmmo];
_this addWeaponCargoGlobal ["Sa58V_EP1", _amountWeapon];
_this addWeaponCargoGlobal ["Sa58V_RCO_EP1", _amountWeapon];
_this addWeaponCargoGlobal ["Sa58V_CCO_EP1", _amountWeapon];

_this addWeaponCargoGlobal ["Sa61_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["20Rnd_B_765x17_Ball", _amountAmmo];

// Other Weapons
_this addWeaponCargoGlobal ["UZI_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["30Rnd_9x19_UZI", _amountAmmo];
_this addWeaponCargoGlobal ["UZI_SD_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["30Rnd_9x19_UZI_SD", _amountAmmo];

_this addMagazineCargoGlobal ["SmokeShell", _amountAmmo];
_this addMagazineCargoGlobal ["SmokeShellRed", _amountAmmo];
_this addMagazineCargoGlobal ["SmokeShellGreen", _amountAmmo];
_this addMagazineCargoGlobal ["SmokeShellYellow", _amountAmmo];
_this addMagazineCargoGlobal ["SmokeShellOrange", _amountAmmo];
_this addMagazineCargoGlobal ["SmokeShellPurple", _amountAmmo];
_this addMagazineCargoGlobal ["SmokeShellBlue", _amountAmmo];
_this addMagazineCargoGlobal ["TimeBomb", _amountAmmo];
_this addMagazineCargoGlobal ["PipeBomb", _amountAmmo];

_this addWeaponCargoGlobal ["Binocular_Vector", _amountWeapon];
_this addWeaponCargoGlobal ["Binocular", _amountWeapon];