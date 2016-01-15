// Everything defined in this file will be available to all scripts in this folder
// available variables are "_unit" and "_kit"

// ==================
// Commmon stuff
// ==================
_COMMON_UNIFORMS = ["Niko_USA_M81","Niko_USA_R_M81"];
_COMMON_VESTS = ["Niko_USA_PlateCarrierL_M81","Niko_USA_PlateCarrierH_M81"];
_COMMON_HEADGEARS = ["Niko_MICH_M81"];
_COMMON_NVG = "gen1"; // can be pvs14, pvs15, gen1, gen2, gen3, gen4, wide, blufor, opfor, indep

_COMMON_ITEMS = [["HandGrenade", 2], ["SmokeShellGreen", 2],
    "ItemMap","ItemCompass","ItemWatch", "ItemRadio", "ACE_fieldDressing","ACE_fieldDressing", "ACE_Morphine"];

_COMMON_RIFLE = "RH_m16a2";
_COMMON_RIFLE_ATTACHMENTS = [];
_COMMON_MAG = "30Rnd_556x45_Stanag";
_COMMON_MAG_T = "30Rnd_556x45_Stanag_Tracer_Red";

_COMMON_RIFLE_C = "hlc_rifle_Colt727";
_COMMON_RIFLE_C_ATTACHMENTS = _COMMON_RIFLE_ATTACHMENTS;
_COMMON_MAG_C = _COMMON_MAG;
_COMMON_MAG_C_T = _COMMON_MAG_T;

_COMMON_RIFLE_GL = "RH_m16a2gl";
_COMMON_RIFLE_GL_ATTACHMENTS = _COMMON_RIFLE_ATTACHMENTS;
_COMMON_GL_NADES = [["1Rnd_HE_Grenade_shell", 4],"1Rnd_SmokeOrange_Grenade_shell","1Rnd_SmokeRed_Grenade_shell", ["UGL_FlareRed_F", 3]];
_COMMON_MAG_GL = _COMMON_MAG;
_COMMON_MAG_GL_T = _COMMON_MAG_T;

_COMMON_AR = "rhs_weap_m249_pip";
_COMMON_AR_ATTACHMENTS = _COMMON_RIFLE_ATTACHMENTS;
_COMMON_AR_MAG = "rhsusf_100Rnd_556x45_soft_pouch";
_COMMON_AR_MAG_T = _COMMON_AR_MAG;

_COMMON_AT = "CUP_launch_MAAWS";
_COMMON_AT_MAG_HE = "CUP_MAAWS_HEDP_M";
_COMMON_AT_MAG_AP = "CUP_MAAWS_HEAT_M";

_COMMON_AT_RAT = "rhs_weap_M136"; // disposable // rhs_m136_mag

_COMMON_PISTOL = "RH_m9";
_COMMON_PISTOL_MAG = "RH_15Rnd_9x19_M9";

_COMMON_BP = "CUP_B_AlicePack_Khaki";

// ==================
// PLT AND SQL stuff
// ==================
_SQL_BINOC = "binoc"; // check fn_addOptic.sqf
_SQL_ATTACHMENTS = [];
_SQL_HEADGEAR = _COMMON_HEADGEARS;
_PLT_HEADGEAR = "H_Beret_red";
_SQL_VEST = _COMMON_VESTS;
_SQL_UNIFORM = _COMMON_UNIFORMS;
_SQL_ITEMS = ["ACE_microDAGR", "ACE_MapTools"];
_SQL_BP = ["tf_rt1523g_big_bwmod","tf_mr3000","tf_anprc155", "tf_rt1523g"] select ([BLUFOR, OPFOR, independent, civilian] find side _unit);

// ==================
// Medic stuff
// ==================
_MED_HEADGEAR = _COMMON_HEADGEARS;
_MED_VEST = _COMMON_VESTS;
_MED_BP = "CUP_B_AlicePack_Khaki";
_MED_BP_ITEMS = [
    ["ACE_fieldDressing",10],
    ["ACE_elasticBandage",6],
    ["ACE_morphine",12],
    ["ACE_epinephrine",12],
    ["ACE_bloodIV",4]
];

// ==================
// Crew stuff
// ==================
_CREW_HEADGEAR = "rhsusf_cvc_green_ess";
_CREW_UNIFORM = _COMMON_UNIFORMS;
_CREW_VEST = _COMMON_VESTS;
_CREW_WEAPON = _COMMON_RIFLE_C;
_CREW_MAGS = [_COMMON_MAG_C, 3];

// ==================
// Pilot stuff
// ==================
_PILOT_HEADGEAR = "H_PilotHelmetFighter_B";
_PILOT_UNIFORM = "U_B_PilotCoveralls";
_PILOT_VEST = _COMMON_VESTS;
_PILOT_WEAPON = _COMMON_RIFLE_C;
_PILOT_MAGS = [_COMMON_MAG_C, 2];

// ==================
// Engineer stuff
// ==================
_ENGI_BP = _COMMON_BP;
_ENGI_ITEMS = ["ACE_Clacker", "ACE_DefusalKit"];
_ENGI_BP_ITEMS = [["ToolKit", 1], ["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]];


// ==================
// Other stuff specific for this template
// ==================

// Given to MMG and MMG A-gunner
_STANDARD_MMG = "rhs_weap_m240B";
_STANDARD_MMG_MAG = "rhsusf_100Rnd_762x51";
// Given to HAT and Asst HAT BP
_STANDARD_ROCKET_LAUNCHER_HAT = "CUP_launch_M47";
_STANDARD_ROCKETHAT = "CUP_Dragon_EP1_M";

// Given to AA and Asst AA BP
_STANDARD_MANPADS = "rhs_weap_fim92";
_STANDARD_MANPADS_ROCKET = "rhs_fim92_mag";
