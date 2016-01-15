//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 2.1 - 2009    //
//--------------------------//
//    DAC_Config_Units      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_TypNumber","_TempArray","_Unit_Pool_S","_Unit_Pool_V","_Unit_Pool_T","_Unit_Pool_A"];
_TypNumber = _this select 0;_TempArray = [];

switch (_TypNumber) do
{
//-------------------------------------------------------------------------------------------------
// Russians
  case 0:
  {
    _Unit_Pool_S = ["RU_Soldier_Crew","RU_Soldier_Pilot","RU_Soldier_SL","RU_Soldier","RU_Soldier_GL","RU_Soldier_MG","RU_Soldier","RU_Soldier_AT","RU_Soldier_Medic","RU_Soldier","RU_Soldier_AR","RU_Soldier_LAT","RU_Soldier","RU_Soldier_Marksman","RU_Soldier_HAT","RUS_Soldier","RU_Soldier_AA"];
    _Unit_Pool_V = ["UAZ_RU","Kamaz","KamazOpen","UAZ_AGS30_RU","GAZ_Vodnik","GAZ_Vodnik_HMG"];
    _Unit_Pool_T = ["BTR90","BMP3","T72_RU","T90","2S6M_Tunguska"];
    _Unit_Pool_A = ["Mi17_rockets_RU","Mi24_V","Mi24_P","Ka52","Ka52Black"];
  };
//-------------------------------------------------------------------------------------------------
// USMC
  case 1:
  {
    _Unit_Pool_S = ["USMC_Soldier_Crew","USMC_Soldier_Pilot","USMC_Soldier_SL","USMC_Soldier","USMC_Soldier_GL","USMC_Soldier_AR","USMC_Soldier","USMC_Soldier_LAT","USMC_Soldier_MG","USMC_Soldier","USMC_Soldier_AA","USMC_Soldier_HAT","USMC_Soldier","USMC_SoldierM_Marksman","USMC_Soldier_AR","USMC_Soldier_GL","USMC_Soldier"];
    _Unit_Pool_V = ["HMMWV","HMMWV_M2","HMMWV_Armored","HMMWV_MK19","HMMWV_TOW","HMMWV_Avenger","MTVR","M1030"];
    _Unit_Pool_T = ["LAV25","AAV","M1A1","M1A2_TUSK_MG"];
    _Unit_Pool_A = ["MH60S","UH1Y","AH1Z","MV22"];
  };
//-------------------------------------------------------------------------------------------------
// Insurgents
  case 2:
  {
    _Unit_Pool_S = ["Ins_Soldier_Crew","Ins_Soldier_Pilot","Ins_Soldier_CO","Ins_Soldier_1","Ins_Soldier_GL","Ins_Soldier_MG","Ins_Soldier_1","Ins_Soldier_AT","Ins_Soldier_Medic","Ins_Soldier_2","Ins_Soldier_AR",["Ins_Soldier_1",6],"Ins_Soldier_1","Ins_Soldier_2","Ins_Soldier_AT"];
    _Unit_Pool_V = ["UAZ_INS","UAZ_MG_INS","UAZ_SPG9_INS","Offroad_DSHKM_INS","Pickup_PK_INS","Ural_INS","UralOpen_INS"];
    _Unit_Pool_T = ["BRDM2_INS","BRDM2_ATGM_INS","BMP2_INS","T72_INS","ZSU_INS"];
    _Unit_Pool_A = ["Mi17_Ins"];
  };
//-------------------------------------------------------------------------------------------------
// Civilians
  case 3:
  {
    _Unit_Pool_S = ["Assistant","Citizen1","Citizen2","Citizen3","Citizen4","Doctor","Functionary1","Functionary2","Priest","Profiteer1","Profiteer2","Profiteer3","Profiteer4","SchoolTeacher","Villager1","Villager2","Villager3","Villager4","Woodlander1","Woodlander2","Woodlander3","Woodlander4","Worker1","Worker2","Worker3","Worker4","Damsel1","Damsel2","Damsel3","Damsel4","Damsel5","Farmwife1","Farmwife2","Farmwife3","Farmwife4","Farmwife5","Hooker1","Hooker2","Hooker3","Hooker4","Hooker5","HouseWife1","HouseWife2","HouseWife3","HouseWife4","HouseWife5","Madam1","Madam2","Madam3","Madam4","Madam5","Secretary1","Secretary2","Secretary3","Secretary4","Secretary5","Sportswoman1","Sportswoman2","Sportswoman3","Sportswoman4","Sportswoman5","WorkWoman1","WorkWoman2","WorkWoman3","WorkWoman4","WorkWoman5"];
    _Unit_Pool_V = ["Skoda","SkodaBlue","SkodaGreen","SkodaRed","hilux1_civil_1_open","hilux1_civil_2_covered","hilux1_civil_3_open","datsun1_civil_1_open","datsun1_civil_2_covered","datsun1_civil_3_open","car_sedan","UralCivil","UralCivil2","Lada_base","Lada1","Lada","VWGolf","V3S_Civ","Ikarus"];
    _Unit_Pool_T = ["Tractor","UralCivil","UralCivil2","V3S_Civ"];
    _Unit_Pool_A = ["Mi17_Civilian"];
  };
//-------------------------------------------------------------------------------------------------
// FR
  case 4:
  {
    _Unit_Pool_S = ["USMC_Soldier_Crew","USMC_Soldier_Pilot","FR_TL","FR_Assault_R","FR_Assault_GL","FR_AR","FR_Assault_R","FR_Marksman","FR_AR","FR_Sapper","FR_Assault_R","FR_Assault_GL"];
    _Unit_Pool_V = ["HMMWV","HMMWV_M2","HMMWV_Armored","HMMWV_MK19","HMMWV_TOW","HMMWV_Avenger","MTVR","M1030"];
    _Unit_Pool_T = ["LAV25","AAV"];
    _Unit_Pool_A = ["UH1Y","MH60S"];
  };
//-------------------------------------------------------------------------------------------------
// CDF
  case 5:
  {
    _Unit_Pool_S = ["CDF_Soldier_Crew","CDF_Soldier_Pilot","CDF_Soldier_TL","CDF_Soldier","CDF_Soldier_GL","CDF_Soldier_MG","CDF_Soldier","CDF_Soldier_AR","CDF_Soldier_RPG","CDF_Soldier","CDF_Soldier_Strela","CDF_Soldier_Engineer","CDF_Soldier","CDF_Soldier_Marksman"];
    _Unit_Pool_V = ["UAZ_CDF","UAZ_MG_CDF","UAZ_AGS30_CDF","Ural_CDF","UralOpen_CDF","Ural_ZU23_CDF"];
    _Unit_Pool_T = ["BRDM2_CDF","BRDM2_ATGM_CDF","BMP2_CDF","T72_CDF","ZSU_CDF"];
    _Unit_Pool_A = ["Mi17_CDF","Mi24_D"];
  };
//-------------------------------------------------------------------------------------------------
// NAPA
  case 6:
  {
    _Unit_Pool_S = ["GUE_Soldier_Crew","GUE_Soldier_Pilot","GUE_Soldier_CO","GUE_Soldier_2","GUE_Soldier_3","GUE_Soldier_1","GUE_Soldier_MG","GUE_Soldier_GL","GUE_Soldier_AT","GUE_Soldier_2","GUE_Soldier_AT","GUE_Soldier_AA",["GUE_Soldier_1",6],"GUE_Soldier_1","GUE_Soldier_Medic","GUE_Soldier_3"];
    _Unit_Pool_V = ["hilux1_civil_1_open","hilux1_civil_2_covered","hilux1_civil_3_open","V3S_Gue","Offroad_DSHKM_Gue","Pickup_PK_GUE","Offroad_SPG9_Gue","Ural_ZU23_Gue"];
    _Unit_Pool_T = ["BRDM2_Gue","BMP2_Gue","T34","T72_Gue"];
    _Unit_Pool_A = [];
  };
//-------------------------------------------------------------------------------------------------
// MVD
  case 7:
  {
    _Unit_Pool_S = ["RU_Soldier_Crew","RU_Soldier_Pilot","MVD_Soldier_TL","MVD_Soldier","MVD_Soldier_GL","MVD_Soldier_MG","MVD_Soldier","MVD_Soldier_AT","MVD_Soldier_Marksman","MVD_Soldier"];
    _Unit_Pool_V = ["UAZ_RU","Kamaz","KamazOpen","UAZ_AGS30_RU","GAZ_Vodnik","GAZ_Vodnik_HMG"];
    _Unit_Pool_T = ["BTR90","BMP3"];
    _Unit_Pool_A = ["Mi17_rockets_RU","Mi24_V","Mi24_P"];
  };
//-------------------------------------------------------------------------------------------------
// Spetsnaz with custom gear
  case 8:
  {
    _Unit_Pool_S = ["RU_Soldier_Crew","RU_Soldier_Pilot",["RUS_Soldier_TL",1],["RUS_Soldier1",2],["RUS_Soldier1",3],["RUS_Soldier1",5],["RUS_Soldier1",2],["RUS_Soldier1",4],"RUS_Soldier_Marksman"];
    _Unit_Pool_V = ["UAZ_RU","Kamaz","KamazOpen","UAZ_AGS30_RU","GAZ_Vodnik","GAZ_Vodnik_HMG"];
    _Unit_Pool_T = ["BTR90","BMP3"];
    _Unit_Pool_A = ["Mi17_rockets_RU","Mi24_V","Mi24_P"];
  };
//-------------------------------------------------------------------------------------------------
// Takistani Army
  case 9:
  {
    _Unit_Pool_S = ["TK_Soldier_Crew_EP1","TK_Soldier_Pilot_EP1","TK_Soldier_SL_EP1","TK_Soldier_EP1","TK_Soldier_GL_EP1","TK_Soldier_MG_EP1","TK_Soldier_AMG_EP1","TK_Soldier_AT_EP1","TK_Soldier_Medic_EP1","TK_Soldier_EP1","TK_Soldier_AR_EP1","TK_Soldier_LAT_EP1","TK_Soldier_EP1",["TK_Soldier_EP1",6],"TK_Soldier_B_EP1","TK_Soldier_HAT_EP1","TK_Soldier_EP1","TK_Soldier_AA_EP1"];
    _Unit_Pool_V = ["UAZ_MG_TK_EP1","UAZ_AGS30_TK_EP1","LandRover_MG_TK_EP1","LandRover_SPG9_TK_EP1"];
    _Unit_Pool_T = ["BMP2_TK_EP1","BRDM2_TK_EP1","BRDM2_ATGM_TK_EP1","M113_TK_EP1","T34_TK_EP1","T55_TK_EP1","ZSU_TK_EP1"];
    _Unit_Pool_A = ["Mi24_D_TK_EP1","Mi17_TK_EP1","UH1H_TK_EP1"];
  };
//-------------------------------------------------------------------------------------------------
// Takistani Militia
  case 10:
  {
    _Unit_Pool_S = ["TK_INS_Soldier_EP1","TK_INS_Soldier_EP1","TK_INS_Soldier_TL_EP1","TK_INS_Soldier_EP1","TK_INS_Soldier_2_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_4_EP1","TK_INS_Soldier_3_EP1","TK_INS_Bonesetter_EP1","TK_INS_Soldier_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_AAT_EP1","TK_INS_Soldier_4_EP1","TK_INS_Soldier_3_EP1"];
    _Unit_Pool_V = ["LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1"];
    _Unit_Pool_T = ["BTR40_MG_TK_INS_EP1","BRDM2_TK_EP1","BMP2_TK_EP1","M113_TK_EP1"];
    _Unit_Pool_A = ["UH1H_TK_GUE_EP1"];
  };
//-------------------------------------------------------------------------------------------------
// Takistani Locals
  case 11:
  {
    _Unit_Pool_S = ["TK_GUE_Soldier_2_EP1","TK_GUE_Soldier_2_EP1","TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_2_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_AAT_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Bonesetter_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_2_EP1","TK_GUE_Soldier_5_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_AA_EP1"];
    _Unit_Pool_V = ["V3S_TK_GUE_EP1","Offroad_DSHKM_TK_GUE_EP1","Offroad_SPG9_TK_GUE_EP1","Pickup_PK_TK_GUE_EP1"];
    _Unit_Pool_T = ["BRDM2_TK_GUE_EP1","BTR40_TK_GUE_EP1","BTR40_MG_TK_GUE_EP1","T34_TK_GUE_EP1","T55_TK_GUE_EP1"];
    _Unit_Pool_A = ["UH1H_TK_GUE_EP1"];
  };
//-------------------------------------------------------------------------------------------------
// US Army
  case 12:
  {
    _Unit_Pool_S = ["US_Soldier_Crew_EP1","US_Soldier_Pilot_EP1","US_Soldier_SL_EP1","US_Soldier_TL_EP1","US_Soldier_AR_EP1","US_Soldier_LAT_EP1","US_Soldier_EP1","US_Soldier_GL_EP1","US_Soldier_MG_EP1","US_Soldier_AMG_EP1","US_Soldier_EP1","US_Soldier_AT_EP1","US_Soldier_AAT_EP1","US_Soldier_Marksman_EP1","US_Soldier_Medic_EP1","US_Soldier_AA_EP1","US_Soldier_EP1","US_Soldier_Engineer_EP1","US_Soldier_B_EP1"];
    _Unit_Pool_V = ["HMMWV_DES_EP1","HMMWV_M1151_M2_DES_EP1","HMMWV_MK19_DES_EP1","HMMWV_M998_crows_M2_DES_EP1","HMMWV_M998_crows_MK19_DES_EP1","HMMWV_M1035_DES_EP1"];
    _Unit_Pool_T = ["M1A1_US_DES_EP1","M1A2_US_TUSK_MG_EP1","M2A2_EP1","M2A3_EP1","M1126_ICV_M2_EP1","M1129_MC_EP1","M1128_MGS_EP1"];
    _Unit_Pool_A = ["AH64D_EP1","AH6J_EP1","MH6J_EP1","UH60M_EP1","CH_47F_EP1"];
  };
//-------------------------------------------------------------------------------------------------
// US Delta Force
  case 13:
  {
    _Unit_Pool_S = ["US_Soldier_Crew_EP1","US_Soldier_Pilot_EP1","US_Delta_Force_TL_EP1","US_Delta_Force_MG_EP1","US_Delta_Force_Assault_EP1","US_Delta_Force_EP1","US_Delta_Force_AR_EP1","US_Delta_Force_M14_EP1","US_Delta_Force_Medic_EP1","US_Delta_Force_Marksman_EP1","US_Delta_Force_EP1"];
    _Unit_Pool_V = ["HMMWV_M998A2_SOV_DES_EP1","ATV_US_EP1","HMMWV_DES_EP1","MTVR_DES_EP1","HMMWV_M1151_M2_DES_EP1","HMMWV_MK19_DES_EP1","HMMWV_M998_crows_M2_DES_EP1","HMMWV_M998_crows_MK19_DES_EP1","HMMWV_Terminal_EP1","HMMWV_M1035_DES_EP1"];
    _Unit_Pool_T = ["M1A1_US_DES_EP1","M1A2_US_TUSK_MG_EP1","M2A2_EP1","M2A3_EP1","M1126_ICV_M2_EP1","M1126_ICV_mk19_EP1","M1130_CV_EP1","M1129_MC_EP1","M1128_MGS_EP1","M6_EP1"];
    _Unit_Pool_A = ["AH64D_EP1","AH6J_EP1","MH6J_EP1","UH60M_EP1","CH_47F_EP1"];
  };
//-------------------------------------------------------------------------------------------------
// Czech Army
  case 14:
  {
    _Unit_Pool_S = ["CZ_Soldier_DES_EP1","CZ_Soldier_Pilot_EP1","CZ_Soldier_SL_DES_EP1","CZ_Soldier_MG_DES_EP1","CZ_Soldier_AMG_DES_EP1","CZ_Soldier_DES_EP1","CZ_Soldier_AT_DES_EP1","CZ_Soldier_B_DES_EP1","CZ_Soldier_DES_EP1"];
    _Unit_Pool_V = ["LandRover_CZ_EP1","HMMWV_M1151_M2_CZ_DES_EP1","HMMWV_Ambulance_CZ_DES_EP1"];
    _Unit_Pool_T = [];
    _Unit_Pool_A = ["Mi171Sh_CZ_EP1","Mi171Sh_rockets_CZ_EP1"];
  };
//-------------------------------------------------------------------------------------------------
// German KSK
  case 15:
  {
    _Unit_Pool_S = ["GER_Soldier_EP1","GER_Soldier_EP1","GER_Soldier_TL_EP1","GER_Soldier_MG_EP1","GER_Soldier_EP1","GER_Soldier_Scout_EP1","GER_Soldier_Medic_EP1","GER_Soldier_EP1","GER_Soldier_MG_EP1"];
    _Unit_Pool_V = ["ATV_CZ_EP1"];
    _Unit_Pool_T = [];
    _Unit_Pool_A = [];
  };
//-------------------------------------------------------------------------------------------------
// OA Civilians
  case 16:
  {
    _Unit_Pool_S = ["TK_CIV_Takistani01_EP1","TK_CIV_Takistani02_EP1","TK_CIV_Takistani03_EP1","TK_CIV_Takistani04_EP1","TK_CIV_Takistani05_EP1","TK_CIV_Takistani06_EP1","TK_CIV_Woman01_EP1","TK_CIV_Woman02_EP1","TK_CIV_Woman03_EP1"];
    _Unit_Pool_V = ["Lada1_TK_CIV_EP1","Lada2_TK_CIV_EP1","LandRover_TK_CIV_EP1","TT650_TK_CIV_EP1","Old_bike_TK_CIV_EP1","Old_moto_TK_Civ_EP1","hilux1_civil_3_open_EP1","S1203_TK_CIV_EP1","SUV_TK_CIV_EP1","UAZ_Unarmed_TK_CIV_EP1","Ural_TK_CIV_EP1","V3S_Open_TK_CIV_EP1","Volha_1_TK_CIV_EP1","Volha_2_TK_CIV_EP1","VolhaLimo_TK_CIV_EP1","S1203_ambulance_EP1"];
    _Unit_Pool_T = [];
    _Unit_Pool_A = [];
  };
//-------------------------------------------------------------------------------------------------
  Default
  {
    if(DAC_Basic_Value != 5) then
    {
      DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
      hintc "Error: DAC_Config_Units > No valid config number";
    };
    if(true) exitwith {};
  };
};

if(count _this == 2) then
{
  _TempArray = _TempArray + [_Unit_Pool_S,_Unit_Pool_V,_Unit_Pool_T,_Unit_Pool_A];
}
else
{
  _TempArray = _Unit_Pool_V + _Unit_Pool_T + _Unit_Pool_A;
};
_TempArray