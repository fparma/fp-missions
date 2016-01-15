private ["_unit", "_kit"];
_unit = _this select 0;
_kit = _this select 1;

// ==================
// Defines below. First, commmon stuff
// ==================
_COMMON_UNIFORMS = ["rhs_uniform_m88_patchless"];
_COMMON_VESTS = ["V_mas_gue_alice_webb2"];
_COMMON_HEADGEARS = ["H_mas_gue_HelmetO"];
_COMMON_BP = "rhs_sidor";

_COMMON_NVG = ""; // can be: pvs14, pvs15, gen1, gen2, gen3, gen4, wide, blufor, opfor, indep. check fn_addNVG.sqf
_COMMON_ITEMS = [["HandGrenade", 1], "ItemMap","ItemCompass","ItemWatch", "ACE_fieldDressing"];

_COMMON_RIFLE = "CUP_srifle_LeeEnfield";
_COMMON_RIFLE_ATTACHMENTS = [];
_COMMON_MAG = "CUP_10x_303_M";
_COMMON_MAG_T = "CUP_10x_303_M";

_COMMON_RIFLE_C = "sfp_kpistm45";
_COMMON_RIFLE_C_ATTACHMENTS = _COMMON_RIFLE_ATTACHMENTS;
_COMMON_MAG_C = "sfp_36Rnd_9mm_kpistm45";
_COMMON_MAG_C_T = "sfp_36Rnd_9mm_kpistm45";

_COMMON_RIFLE_GL = ["CUP_arifle_Sa58P","CUP_arifle_Sa58V"];
_COMMON_RIFLE_GL_ATTACHMENTS = _COMMON_RIFLE_ATTACHMENTS;
_COMMON_GL_NADES = [];
_COMMON_MAG_GL = "CUP_30Rnd_Sa58_M";
_COMMON_MAG_GL_T = "CUP_30Rnd_Sa58_M_TracerG";

_COMMON_AR = "CUP_lmg_UK59";
_COMMON_AR_ATTACHMENTS = _COMMON_RIFLE_ATTACHMENTS;
_COMMON_AR_MAG = "CUP_50Rnd_UK59_762x54R_Tracer";
_COMMON_AR_MAG_T = "CUP_50Rnd_UK59_762x54R_Tracer";

_COMMON_AT = "";
_COMMON_AT_MAG_HE = "";
_COMMON_AT_MAG_AP = "";
_COMMON_AT_RAT = ""; // assumed disposable

_COMMON_PISTOL = "RH_tt33";
_COMMON_PISTOL_MAG = "RH_8Rnd_762_tt33";

// ==================
// PLT AND SQL stuff
// ==================
_SQL_BINOC = "binoc"; // can be binoc, soflam, lerca_b (black), lerca_t (tan), laser, laser_blufor, laser_opfor, laser_indep. check fn_addOptic.sqf
_SQL_ATTACHMENTS = [];
_SQL_HEADGEAR = "";
_PLT_HEADGEAR = "";
_SQL_VEST = "";
_SQL_UNIFORM = _COMMON_UNIFORMS;
_SQL_ITEMS = ["ACE_MapTools"];
_SQL_BP = ["tf_rt1523g","tf_bussole","tf_anprc155", "tf_rt1523g"] select ([BLUFOR, OPFOR, independent, civilian] find side _unit);

// ==================
// Medic stuff
// ==================
_MED_HEADGEAR = _COMMON_HEADGEARS;
_MED_VEST = _COMMON_VESTS;
_MED_BP = _COMMON_BP;
_MED_BP_ITEMS = [
    ["ACE_fieldDressing",16],
    ["ACE_morphine",12],
    ["ACE_epinephrine",12],
    ["ACE_bloodIV",4]
];

// ==================
// Crew stuff
// ==================
_CREW_HEADGEAR = _COMMON_HEADGEARS;
_CREW_UNIFORM = _COMMON_UNIFORMS;
_CREW_VEST = _COMMON_VESTS;
_CREW_WEAPON = _COMMON_RIFLE_C;
_CREW_MAGS = [_COMMON_MAG_C, 3];

// ==================
// Pilot stuff
// ==================
_PILOT_HEADGEAR = _COMMON_HEADGEARS;
_PILOT_UNIFORM = _COMMON_UNIFORMS;
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
// Assign the stuff
// ==================
switch _kit do {

    case "PLT":
	{

        [_unit, [_SQL_UNIFORM, "rhs_vest_commander", "FP_Beret_Maroon","tf_mr6000l"]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_PISTOL_MAG, 3], [_COMMON_PISTOL_MAG, 1]]] call FP_fnc_addToContainers;
		[_unit, [_COMMON_PISTOL]] call FP_fnc_addWeapon;

        [_unit, _SQL_BINOC] call FP_fnc_addOptic;
        [_unit, _SQL_ITEMS] call FP_fnc_addToContainers;

    };
	
    case "SQL":
    {

		_SQL_RIF = _COMMON_RIFLE_GL call bis_fnc_selectRandom; 
		
        [_unit, [_SQL_UNIFORM, _COMMON_VESTS, _COMMON_HEADGEARS,"tf_mr6000l"]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG_GL, 3], [_COMMON_MAG_GL_T, 1]]] call FP_fnc_addToContainers;
        [_unit, [_SQL_RIF]] call FP_fnc_addWeapon;

        [_unit, _SQL_BINOC] call FP_fnc_addOptic;
        [_unit, _SQL_ITEMS] call FP_fnc_addToContainers;

    };
	
    case "RTO":
    {
        private "_h";

        [_unit, [_SQL_UNIFORM, "V_mas_gue_alice_webb2", _MED_HEADGEAR, "rhs_sidor"]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 3], [_COMMON_MAG_GL, 1], ["FP_HandGrenade_No73", 3], ["CUP_Mine_M", 1]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE]] call FP_fnc_addWeapon;

        [_unit, _SQL_ITEMS] call FP_fnc_addToContainers;

    };

    case "MEDIC":
    {
        [_unit, [_COMMON_UNIFORMS, "V_mas_gue_ind_webb", _MED_HEADGEAR, _MED_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG_C, 3], [_COMMON_MAG_C_T, 1]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE_C, _COMMON_RIFLE_C_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, _MED_BP_ITEMS, "backpack"] call FP_fnc_addToContainers;

    };
    case "RIFLEMAN":
    {
        [_unit, [_COMMON_UNIFORMS, "V_mas_gue_alice_webb2", _MED_HEADGEAR, _MED_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 3], [_COMMON_MAG_T, 1]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;
    };

    case "AR":
    {
        [_unit, [_COMMON_UNIFORMS, "V_mas_gue_ind_webbmg", _COMMON_HEADGEARS, "LOP_Carryall_KHK_mg"]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_AR_MAG, 2], [_COMMON_AR_MAG_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_AR, _COMMON_AR_ATTACHMENTS]] call FP_fnc_addWeapon;

    };

    case "ARASS":
    {
        [_unit, [_COMMON_UNIFORMS, "V_mas_gue_ind_webbmg", _COMMON_HEADGEARS, "LOP_Carryall_KHK_mg"]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 2], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, [[_COMMON_AR_MAG, 2], [_COMMON_AR_MAG_T, 2]], "backpack"] call FP_fnc_addToContainers;

    };
	
    case "CREWMAN":
    {
        [_unit, [_CREW_UNIFORM, _CREW_VEST, _CREW_HEADGEAR]] call FP_fnc_addContainers;
        [_unit, _CREW_MAGS] call FP_fnc_addToContainers;
        [_unit, _CREW_WEAPON] call FP_fnc_addWeapon;
    };

    default {if (!isNil "FP_gear_errs") then {FP_gear_errs pushBack format ["%1 - NOT FOUND KIT: %2", str _unit, _kit]}};
};

// ==================
// Runs for everyone
// ==================
[_unit, _COMMON_ITEMS] call FP_fnc_addToContainers;


