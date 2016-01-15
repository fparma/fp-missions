/*should be #include'd in all scripts. this will be "inserted" into those scripts*/

_UNIFORMS = ["rhs_uniform_m88_patchless"];
_VESTS = ["rhs_6sh92_vog","rhs_6sh92_radio","rhs_6sh92_digi_headset"];
_HEADGEARS = ["rhs_6b27m_ml","rhs_6b27m_ml_ess","rhs_6b27m_ess","rhs_6b27m"];

_STANDARD_ITEMS = ["ItemMap","ItemCompass","ItemWatch"];

_STANDARD_RIFLE = "rhs_weap_akms";
_STANDARD_RIFLE_C = "rhs_weap_ak103_1";
_STANDARD_RIFLE_GL = "rhs_weap_akm_gp25";
_STANDARD_RIFLE_ASS = "rhs_weap_akm";

_STANDARD_MAG = "rhs_30Rnd_762x39mm";
_STANDARD_MAG_T = "rhs_30Rnd_762x39mm";

// Given to AR and Asst AR BP
_STANDARD_AR = "hlc_rifle_rpk";
_STANDARD_AR_MAG = "hlc_75Rnd_762x39_m_rpk";
_STANDARD_AR_MAG_T = "hlc_75Rnd_762x39_m_rpk";

// Given to MAT and Asst MAT BP
_STANDARD_ROCKET_LAUNCHER = "rhs_weap_rpg7";
_STANDARD_ROCKET1 = "rhs_rpg7_PG7VL_mag";
_STANDARD_ROCKET2 = "rhs_rpg7_OG7V_mag";

// Must be arrays
_LEADER_ITEMS = ["ACE_MicroDagr", "ACE_MapTools"];

_GL_SMOKES = ["rhs_VG40OP_white","rhs_VG40OP_green","rhs_VG40OP_red"];
_GL_HE = "rhs_VOG25";

_GRENADE = "HandGrenade";
_STANDARD_SMOKE = "SmokeShellGreen";
_CHEMLIGHT = "Chemlight_blue";

_LR_RADIO = ["tf_anprc155_coyote","tf_mr3000","tf_anprc155", "tf_rt1523g"] select ([BLUFOR, OPFOR, independent, civilian] find side _unit);