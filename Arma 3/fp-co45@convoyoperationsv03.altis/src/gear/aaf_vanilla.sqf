/*
You can change the loadout in fn_assignKit.sqf
---------------- AAF ---------------
	VANILLA weapons
*/

_UNIFORMS = ["U_I_CombatUniform_shortsleeve","U_I_CombatUniform","U_I_CombatUniform_tshirt"];
// first in vests = sql / FTL
_VESTS = ["V_PlateCarrierSpec_rgr","V_PlateCarrierIA1_dgtl","V_PlateCarrierIA2_dgtl","V_PlateCarrierIAGL_dgtl"];
_CREW_AND_PILOT_VEST = "V_BandollierB_rgr";

_STANDARD_ITEMS = ["ItemMap","ItemCompass","ItemWatch","rhsusf_ANPVS_15","ItemRadio"];
_STANDARD_RIFLE = "hlc_rifle_auga3";
_STANDARD_RIFLE_C = "hlc_rifle_auga2";
_STANDARD_RIFLE_ASS = _STANDARD_RIFLE;
_STANDARD_MAG = "hlc_30Rnd_556x45_B_AUG";
_STANDARD_MAG_T = "hlc_30Rnd_556x45_T_AUG";
_STANDARD_ATTACHMENTS = ["RH_peq15b","RH_LTdocterl"];  

_STANDARD_PISTOL = "RH_fn57_g";
_STANDARD_PISTOL_MAG = "RH_20Rnd_57x28_FN";
_PIST_LAM = "RH_X2";

_CREW_SMG = "RH_sbr9_wdl";
_CREW_MAG = "RH_32Rnd_9mm_M822";
_CREW_ATTACHMENTS = ["RH_peq15b","RH_LTdocterl"];

_STANDARD_MG_MAG = "rhsusf_100Rnd_556x45_soft_pouch";
_STANDARD_MG_MAG_T = "150Rnd_762x51_Box_Tracer";

_GRENADE = "HandGrenade";
_STANDARD_SMOKE = "SmokeShellGreen";
_GPS = "ItemGPS";
_GL_HE = "1Rnd_HE_Grenade_shell";
_GL_SMOKES = ["1Rnd_SmokeOrange_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell"];
_CHEM = "Chemlight_green";

// specific loadouts
_PLT_RIFLE = "hlc_rifle_auga3_GL";
_PLT_CAP = "H_MilCap_dgtl";
_PLT_ATTACHMENTS = ["RH_peq15b","RH_eothhs1"];

_SQL_RIFLE = "hlc_rifle_auga3_GL";
_SQL_CAP = "rhs_6b28_green";
_SQL_ATTACHMENTS = ["RH_peq15b","RH_eothhs1"];

_MED_RIFLE = _STANDARD_RIFLE_C;
_MED_BP = "B_Kitbag_rgr";
_MED_CAP = "rhs_6b28_green";
_MED_ATTACHMENTS =_STANDARD_ATTACHMENTS;

_MG_RIFLE = "rhs_weap_m249_pip";
_MG_ATTACHMENTS = ["RH_LTdocter","RH_peq15b"];
_MG_CAP = "rhs_6b28_green";

_MG_ASS_RIFLE = _STANDARD_RIFLE_ASS;
_MG_ASS_ATTACHMENTS = _STANDARD_ATTACHMENTS;
_MG_ASS_BP = "B_AssaultPack_dgtl";
_MG_ASS_CAP = "rhs_6b28_green";

_AT_RIFLE = _STANDARD_RIFLE;
_AT_ATTACMENTS = _STANDARD_ATTACHMENTS;
_AT_ROCKET_LAUNCHER = "CUP_launch_Mk153Mod0";
_AT_SCOPE = "CUP_optic_SMAW_Scope";
_AT_BP = "B_AssaultPack_rgr_LAT";
_AT_CAP = "rhs_6b28_green";
_AT_ROCKET1 = "CUP_SMAW_HEAA_M";
_AT_ROCKET2 = "CUP_SMAW_HEDP_M";

_AT_ASS_RIFLE = _STANDARD_RIFLE_ASS;
_AT_ASS_BP = "B_AssaultPack_dgtl";
_AT_ASS_ATTACHMENTS = _STANDARD_ATTACHMENTS;
_AT_ASS_CAP = "rhs_6b28_green";
_AT_ASS_ROCKET1 = _AT_ROCKET1;
_AT_ASS_ROCKET2 = _AT_ROCKET2;

_MARKSMAN_RIFLE = _STANDARD_RIFLE;
_MARKSMAN_BP = "B_AssaultPack_dgtl";
_MARKSMAN_ATTACHMENTS = ["optic_DMS"];
_MARKSMAN_NVG_ATTACHMENT = "optic_NVS";
_MARKSMAN_MAG = _STANDARD_MAG;
_MARKSMAN_MAG_T = _STANDARD_MAG_T;
_MARKSMAN_CAP = "rhs_6b28_green";
_MARKSMAN_SECONDARY = "launch_NLAW_F";

_ENGI_RIFLE = _STANDARD_RIFLE;
_ENGI_ATTACHMENTS = _STANDARD_ATTACHMENTS;
_ENGI_BP = "B_Carryall_oli";
_ENGI_CAP = "H_Cap_headphones";
_ENGI_EXPL1 = "SatchelCharge_Remote_Mag";
_ENGI_EXPL2 = "DemoCharge_Remote_Mag";

_CREW_RIFLE = _STANDARD_RIFLE_C;
_CREW_UNIFORM = "U_I_pilotCoveralls";
_CREW_CAP = "H_HelmetCrew_I";

_HELI_PILOT_RIFLE = _STANDARD_RIFLE_C;
_HELI_PILOT_UNIFORM = "U_I_pilotCoveralls";
_HELI_PILOT_CAP = "H_CrewHelmetHeli_I";
