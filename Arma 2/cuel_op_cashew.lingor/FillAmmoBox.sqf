_amountWeapon = 4;
_amountAmmo = 20;
_refreshTime = 600; // refill every 10 minutes

// dont break the box you FUCK
_this allowDamage false;



if (isServer) then {
    waitUntil {!(isNil "paramsArray")};
    while {true} do

    {

        // Clear box
        clearWeaponCargoGlobal _this;
        clearMagazineCargoGlobal _this;
        // standard
        _this addWeaponCargoGlobal ["M136", _amountWeapon-2]; 
        _this addMagazineCargoGlobal ["M136", _amountAmmo];
        _this addMagazineCargoGlobal ["PipeBomb", _amountAmmo];
        _this addMagazineCargo ["HandGrenade_West", _amountAmmo];
        // Fill box
        if ((paramsArray select 0) == 0) then {
            _this addMagazineCargoGlobal ["30Rnd_556x45_StanagSD", _amountAmmo];
            _this addWeaponCargoGlobal ["m8_holo_sd", _amountWeapon]; 
            _this addMagazineCargoGlobal ["30Rnd_556x45_G36SD", _amountAmmo];
            _this addWeaponCargoGlobal ["SCAR_H_CQC_CCO_SD", _amountWeapon]; 
            _this addMagazineCargoGlobal ["20Rnd_762x51_SB_SCAR", _amountAmmo];
            _this addWeaponCargoGlobal ["SCAR_L_CQC_CCO_SD", _amountWeapon];
            _this addWeaponCargoGlobal ["M4A1_AIM_SD_camo", _amountWeapon+5];
            _this addWeaponCargoGlobal ["G36_C_SD_eotech", _amountWeapon];
            _this addWeaponCargoGlobal ["M4A1_HWS_GL_SD_Camo", _amountWeapon];
            _this addWeaponCargoGlobal ["M9SD", _amountWeapon];
            _this addMagazineCargoGlobal ["15Rnd_9x19_M9SD", _amountAmmo];
            _this addWeaponCargoGlobal ["MP5SD", _amountWeapon+5]; 
            _this addMagazineCargoGlobal ["30Rnd_9x19_MP5SD", _amountAmmo];
        } else {
            _this addWeaponCargoGlobal ["M14_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["20Rnd_762x51_DMR", _amountAmmo];
            _this addWeaponCargoGlobal ["M16A2GL", _amountWeapon]; _this addMagazineCargoGlobal ["1Rnd_HE_M203", _amountAmmo];
            _this addMagazineCargoGlobal ["FlareYellow_M203", _amountAmmo];
            _this addMagazineCargoGlobal ["1Rnd_Smoke_M203", _amountAmmo];
            _this addWeaponCargoGlobal ["M4A3_RCO_GL_EP1", _amountWeapon];
            _this addWeaponCargoGlobal ["M4A3_CCO_EP1", _amountWeapon];
            _this addWeaponCargoGlobal ["SCAR_L_CQC_Holo", _amountWeapon];
            _this addWeaponCargoGlobal ["SCAR_L_CQC_EGLM_Holo", _amountWeapon];
            _this addWeaponCargoGlobal ["SCAR_L_STD_HOLO", _amountWeapon];
            _this addWeaponCargoGlobal ["SCAR_L_STD_Mk4CQT", _amountWeapon];
            _this addWeaponCargoGlobal ["SCAR_H_CQC_CCO", _amountWeapon]; 
            _this addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR", _amountAmmo];
            _this addWeaponCargoGlobal ["SCAR_H_LNG_Sniper", _amountWeapon];
            //mg
            _this addWeaponCargoGlobal ["m240_scoped_EP1", _amountWeapon-2]; _this addMagazineCargoGlobal ["100Rnd_762x51_M240", _amountAmmo];
            _this addWeaponCargoGlobal ["M249_EP1", _amountWeapon-2]; _this addMagazineCargoGlobal ["200Rnd_556x45_M249", _amountAmmo];
            _this addMagazineCargoGlobal ["100Rnd_556x45_M249", _amountAmmo];

            _this addWeaponCargoGlobal ["M249_m145_EP1", _amountWeapon-2];
            _this addWeaponCargoGlobal ["Mk_48_DES_EP1", _amountWeapon-2];
            //snipors
            _this addWeaponCargoGlobal ["m107", _amountWeapon-3]; _this addMagazineCargoGlobal ["10Rnd_127x99_m107", _amountAmmo];
            _this addWeaponCargoGlobal ["M24_des_EP1", _amountWeapon-2]; _this addMagazineCargoGlobal ["5Rnd_762x51_M24", _amountAmmo];

            _this addWeaponCargoGlobal ["Colt1911", _amountWeapon]; _this addMagazineCargoGlobal ["7Rnd_45ACP_1911", _amountAmmo];
            _this addWeaponCargoGlobal ["M9", _amountWeapon]; _this addMagazineCargoGlobal ["15Rnd_9x19_M9", _amountAmmo];
            _this addMagazineCargoGlobal ["15Rnd_9x19_M9SD", _amountAmmo];
            // german weaps
            _this addWeaponCargoGlobal ["G36A_camo", _amountWeapon]; _this addMagazineCargoGlobal ["30Rnd_556x45_G36", _amountAmmo];
            _this addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag", _amountAmmo];
            _this addMagazineCargoGlobal ["30Rnd_556x45_G36SD", _amountAmmo];
            _this addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _amountAmmo];
            _this addMagazineCargoGlobal ["20Rnd_556x45_Stanag", _amountAmmo];
            _this addWeaponCargoGlobal ["G36C_camo", _amountWeapon];
            _this addWeaponCargoGlobal ["G36K_camo", _amountWeapon];
            _this addWeaponCargoGlobal ["MG36_camo", _amountWeapon-2];
            _this addWeaponCargoGlobal ["glock17_EP1", _amountWeapon]; _this addMagazineCargoGlobal ["17Rnd_9x19_glock17", _amountAmmo];

        };

        sleep _refreshTime;
    };
};