player setVariable ["BIS_enableRandomization", false];
fnc_gear = {
  params ["_unit"];
  removeHeadgear _unit;
  removeAllContainers _unit;
  removeAllItems _unit;
  removeAllWeapons _unit;
  removeAllAssignedItems _unit;

  _unit linkItem "ItemMap";
  _unit linkItem "ItemCompass";
  _unit linkItem "ItemWatch";

  switch (toLower (typeof _unit)) do {
    case "c_man_p_fugitive_f": {
      _unit forceAddUniform "LOP_U_Civ_06";
      for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
      _unit addItemToUniform "ACE_epinephrine";
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
      _unit addVest "CUP_V_CDF_6B3_1_Green";
      for "_i" from 1 to 10 do {_unit addItemToVest "7pul_drob";};
      _unit addHeadgear "CUP_H_FR_BandanaGreen";
      _unit addGoggles "G_Aviator";
      _unit addWeapon "str_mp133";
    };

    case "c_man_p_beggar_f": {
      _unit forceAddUniform "LOP_U_Civ_02";
      for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
      _unit addItemToUniform "ACE_epinephrine";
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
      _unit addVest "CUP_V_I_Guerilla_Jacket";
      for "_i" from 1 to 18 do {_unit addItemToVest "2pul_drob";};
      for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
      _unit addHeadgear "CUP_H_SLA_Beret";
      _unit addWeapon "str_ij_obr";
    };

    case "c_man_shorts_1_f": {
      _unit forceAddUniform "CUP_U_C_Labcoat_01";
      _unit addBackpack "B_TacticalPack_blk";
      for "_i" from 1 to 40 do {_unit addItemToBackpack "ACE_fieldDressing";};
      for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_bloodIV";};
      for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_bloodIV_500";};
      for "_i" from 1 to 26 do {_unit addItemToBackpack "ACE_epinephrine";};
      for "_i" from 1 to 40 do {_unit addItemToBackpack "ACE_morphine";};
      _unit addHeadgear "H_Booniehat_tan";
    };

    default {
      _unit forceAddUniform (selectRandom [
        "U_I_C_Soldier_Para_4_F",
        "CUP_U_C_Mechanic_03",
        "CUP_O_TKI_Khet_Partug_04",
        "CUP_O_TKI_Khet_Jeans_02",
        "CUP_U_C_Citizen_02",
        "CUP_U_C_Rocker_01",
        "U_I_C_Soldier_Bandit_3_F",
        "U_I_C_Soldier_Bandit_5_F",
        "LOP_U_Civ_06",
        "LOP_U_Civ_03",
        "LOP_U_Civ_01",
        "CUP_U_I_GUE_Flecktarn2",
        "LOP_U_Civ_06"
      ]);

      for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
      _unit addItemToUniform "ACE_epinephrine";
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};

      if (random 1 > 0.3) then {
        _unit addHeadgear  selectRandom ([
          "CUP_H_TKI_SkullCap_01",
          "CUP_H_TKI_SkullCap_05",
          "CUP_H_TKI_SkullCap_02",
          "CUP_H_TKI_Pakol_2_05",
          "CUP_H_TKI_Lungee_04",
          "H_Cap_blk",
          "CUP_H_TKI_Lungee_Open_03",
          "H_Hat_blue",
          "CUP_H_TKI_Lungee_Open_04",
          "H_Bandanna_sgg"
        ]);
      };

      if (!isNil "fp_gunz") then {
        _unit addVest "V_TacVest_gen_F";
        _unit addHeadgear "CUP_H_TK_Helmet";
        _unit addItem "ACRE_PRC148";
        _unit addMagazines ["hlc_30Rnd_9x19_B_MP5", 5];
        _unit addWeapon "hlc_smg_MP5N";
      } else {
        if (random 1 > 0.75) then {
          _unit addVest "V_mas_gue_alice_webb_she";
          _unit addMagazines ["RH_17Rnd_9x19_g17", 4];
          _unit addWeapon "RH_g17";
          _unit addHandgunItem "RH_M6X";
        };
      };
    };
  };
};

if (isMultiplayer) then {
  [player] call fnc_gear;
} else {
  {[_x] call fnc_gear} forEach switchableUnits;
};
