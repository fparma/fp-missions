/*should be #include'd in all scripts. this will be "inserted" into those scripts*/

_UNIFORMS = ["Niko_USA_M81","Niko_USA_R_M81"];
_VESTS = ["Niko_USA_PlateCarrierL_M81","Niko_USA_PlateCarrierH_M81"];
_HEADGEARS = ["Niko_MICH_M81"];

_STANDARD_ITEMS = ["ItemMap","ItemCompass","ItemWatch","NVGoggles","ItemRadio"];

_STANDARD_RIFLE = "RH_m16a2";
_STANDARD_RIFLE_C = "hlc_rifle_Colt727";
_STANDARD_RIFLE_GL = "RH_m16a2gl";
_STANDARD_RIFLE_ASS = "RH_m16a1";

_STANDARD_MAG = "30Rnd_556x45_Stanag";
_STANDARD_MAG_T = "30Rnd_556x45_Stanag_Tracer_Red";


// Given to SQLs and PLT; mostly headgear
_PLT_HEADGEAR = "H_Beret_red";
_SQL_HEADGEAR = "Niko_MICH_M81";

// Given to AR and Asst AR BP
_STANDARD_AR = "rhs_weap_m249_pip";
_STANDARD_AR_MAG = "rhsusf_100Rnd_556x45_soft_pouch";
_STANDARD_AR_MAG_T = _STANDARD_AR_MAG;

// Given to MMG and MMG A-gunner
_STANDARD_MMG = "rhs_weap_m240B";
_STANDARD_MMG_MAG = "rhsusf_100Rnd_762x51";

// Given to MAT and Asst MAT BP
_STANDARD_ROCKET_LAUNCHER = "CUP_launch_MAAWS";
_STANDARD_ROCKET1 = "CUP_MAAWS_HEAT_M";
_STANDARD_ROCKET2 = "CUP_MAAWS_HEDP_M";

// Given to HAT and Asst HAT BP
_STANDARD_ROCKET_LAUNCHER_HAT = "CUP_launch_M47";
_STANDARD_ROCKETHAT = "CUP_Dragon_EP1_M";

// Given to AA and Asst AA BP
_STANDARD_MANPADS = "rhs_weap_fim92";
_STANDARD_MANPADS_ROCKET = "rhs_fim92_mag";


// Must be arrays
_STANDARD_ATTACHMENTS = [];
_STANDARD_ATTACHMENTS_ALT = [];
_STANDARD_ATTACHMENTS_AR = [];
_LEADER_ATTACHMENTS =  [];
_LEADER_ITEMS = ["AGM_MapTools"];

_GL_SMOKES = ["1Rnd_SmokeOrange_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","UGL_FlareRed_F","UGL_FlareRed_F","UGL_FlareRed_F"];
_GL_HE = "1Rnd_HE_Grenade_shell";

_STANDARD_PISTOL = "RH_m9";
_STANDARD_PISTOL_MAG = "RH_15Rnd_9x19_M9";

_GRENADE = "HandGrenade";
_STANDARD_SMOKE = "SmokeShellGreen";
_CHEMLIGHT = "Chemlight_green";

_LR_RADIO = ["tf_rt1523g_big_bwmod","tf_mr3000","tf_anprc155", "tf_rt1523g"] select ([BLUFOR, OPFOR, independent, civilian] find side _unit);
