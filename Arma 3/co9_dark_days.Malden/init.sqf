enableSaving [false, false];

// Start FPZ
[] call fpz_api_fnc_init;

0 setfog 0.73;
setViewDistance 800;
setObjectViewDistance 600;

if (isServer) then {
  forceWeatherChange;

  {
    clearWeaponCargoGlobal _x;
    clearMagazineCargoGlobal _x;
    clearItemCargoGlobal _x;
  } forEach [gbox, pistolbox, ammobox];

  gbox addWeaponCargoGlobal ["str_pul_DP",1];
  gbox addMagazineCargoGlobal ["47rnd_dpbar", 4];
  gbox addMagazineCargoGlobal ["47rnd_dpbar_trs", 2];

  gbox addWeaponCargoGlobal ["hlc_smg_MP5N",2];   
  gbox addMagazineCargoGlobal ["hlc_30Rnd_9x19_B_MP5", 14];

  gbox addWeaponCargoGlobal ["sfp_kpistm45",2];
  gbox addMagazineCargoGlobal ["sfp_36Rnd_9mm_kpistm45", 12];

  gbox addWeaponCargoGlobal ["CUP_srifle_LeeEnfield", 1];
  gbox addMagazineCargoGlobal ["CUP_10x_303_M", 10];

  gbox addWeaponCargoGlobal ["str_sks_old", 1];
  gbox addMagazineCargoGlobal ["10rnd_sks_mag", 10];

  gbox addWeaponCargoGlobal ["CUP_srifle_CZ550", 1];
  gbox addMagazineCargoGlobal ["CUP_5x_22_LR_17_HMR_M", 6];

  gbox addMagazineCargoGlobal ["7pul_drob", 10];
  gbox addMagazineCargoGlobal ["2pul_drob", 20];

  pistolbox addWeaponCargoGlobal ["RH_m1911", 10];
  pistolbox addMagazineCargoGlobal ["RH_7Rnd_45cal_m1911", 40];

  pistolbox addMagazineCargoGlobal ["RH_17Rnd_9x19_g17", 12];

  pistolbox addWeaponCargoGlobal ["RH_mk2", 4];
  pistolbox addMagazineCargoGlobal ["RH_10Rnd_22LR_mk2", 16];
  
  pistolbox addWeaponCargoGlobal ["RH_muzi", 2];
  pistolbox addMagazineCargoGlobal ["RH_30Rnd_9x19_UZI", 10];

  ammobox addMagazineCargoGlobal ["47rnd_dpbar_trs", 3];
  ammobox addMagazineCargoGlobal ["hlc_30Rnd_9x19_B_MP5", 6];
  ammobox addMagazineCargoGlobal ["sfp_36Rnd_9mm_kpistm45", 7];
  ammobox addMagazineCargoGlobal ["CUP_10x_303_M", 4];
  ammobox addMagazineCargoGlobal ["10rnd_sks_mag", 5];
  ammobox addMagazineCargoGlobal ["CUP_5x_22_LR_17_HMR_M", 3];
  ammobox addMagazineCargoGlobal ["2pul_drob", 10];
  ammobox addMagazineCargoGlobal ["7pul_drob", 7];
  ammobox addMagazineCargoGlobal ["RH_7Rnd_45cal_m1911", 21];
  ammobox addMagazineCargoGlobal ["RH_17Rnd_9x19_g17", 23];

  ammobox2 addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 32];
  ammobox2 addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 40];
  ammobox2 addMagazineCargoGlobal ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 4];
  ammobox2 addMagazineCargoGlobal ["hlc_20Rnd_762x51_B_M14", 16];
  ammobox2 addMagazineCargoGlobal ["hlc_20Rnd_762x51_T_M14", 16];

  fnc_attack1 = {
    [] spawn {
      private _pos = getPosATL truck1;
      "M_AT" createVehicle _pos;
      sleep 1.2;

      "SmallSecondary" createVehicle _pos;
      sleep 1;
      [trig1, 12] call fpz_api_fnc_spawnHorde;;

      sleep 5;
      "M_AT" createVehicle _pos;
      sleep 0.6;
      "SmallSecondary" createVehicle _pos;
      sleep 1.2;
      "SmallSecondary" createVehicle _pos;
      sleep 1.4;
      [trig2, 10] call fpz_api_fnc_spawnHorde;
    };
  };

  [] spawn {
    sleep 10;
    "fp_amb" remoteExec ["playSound", 0];
  };
};
