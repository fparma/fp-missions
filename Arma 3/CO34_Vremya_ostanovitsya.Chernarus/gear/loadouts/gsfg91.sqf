private ["_unit", "_kit"];
_unit = _this select 0;
_kit = _this select 1;

// ==================
// Defines below. First, commmon stuff
// ==================
_COMMON_UNIFORMS = ["FP_Uniform_KLMKM88"];
_COMMON_VESTS = ["rhs_6b23_6sh92"];
_COMMON_HEADGEARS = ["FP_Helmet_VSRSSH68","LOP_H_SSh68Helmet_OLV"];

_COMMON_ITEMS = [["rhs_mag_rgd5", 2], ["rhs_mag_rdg2_black", 2],
    "ItemMap","ItemCompass","ItemWatch", "ItemRadio", ["ACE_fieldDressing",2], "ACE_Morphine"];

_COMMON_RIFLE = "hlc_rifle_ak74";
_COMMON_RIFLE_ATTACHMENTS = [];
_COMMON_MAG = "hlc_30Rnd_545x39_B_AK";
_COMMON_MAG_T = "hlc_30Rnd_545x39_t_ak";

_COMMON_RIFLE_C = "hlc_rifle_aks74u";
_COMMON_RIFLE_C_ATTACHMENTS = [];
_COMMON_MAG_C = _COMMON_MAG;
_COMMON_MAG_C_T = _COMMON_MAG_T;

_COMMON_RIFLE_GL = "hlc_rifle_aks74_GL";
_COMMON_GL_NADES = [["hlc_VOG25_AK", 8]];
_COMMON_MAG_GL = _COMMON_MAG;
_COMMON_MAG_GL_T = _COMMON_MAG_T;

_COMMON_AR = "hlc_rifle_rpk74n";
_COMMON_AR_ATTACHMENTS = [];
_COMMON_AR_MAG = "hlc_45Rnd_545x39_t_rpk";
_COMMON_AR_MAG_T = _COMMON_AR_MAG;

_COMMON_AT = "rhs_weap_rpg7";
_COMMON_AT_MAG_HE = "rhs_rpg7_TBG7V_mag";
_COMMON_AT_MAG_AP = "rhs_rpg7_PG7VL_mag";

_COMMON_AT_RAT = "rhs_weap_M136"; // disposable // rhs_m136_mag

_COMMON_PISTOL = "RH_mak";
_COMMON_PISTOL_MAG = "RH_8Rnd_9x18_Mak";

_COMMON_BP = "rhs_sidor";


// ==================
// PLT AND SQL stuff
// ==================
_SQL_BINOC = "binoc"; // check fn_addOptic.sqf
_SQL_ATTACHMENTS = [];
_SQL_HEADGEAR = _COMMON_HEADGEARS;
_PLT_HEADGEAR = "FP_Boonie_Auscam";
_SQL_VEST = _COMMON_VESTS;
_SQL_UNIFORM = _COMMON_UNIFORMS;
_SQL_ITEMS = [ "ACE_MapTools"];
_SQL_BP = ["tf_rt1523g_rhs","tf_mr3000_rhs","tf_anprc155", "tf_rt1523g"] select ([BLUFOR, OPFOR, independent, civilian] find side _unit);

// ==================
// Medic stuff
// ==================
_MED_HEADGEAR = _COMMON_HEADGEARS;
_MED_VEST = _COMMON_VESTS;
_MED_BP = "rhs_sidor";
_MED_BP_ITEMS = [
    ["ACE_fieldDressing",50],
    ["ACE_morphine",12],
    ["ACE_epinephrine",12],
    ["ACE_bloodIV",4]
];

// ==================
// Crew stuff
// ==================
_CREW_HEADGEAR = "rhs_tsh4";
_CREW_UNIFORM = _COMMON_UNIFORMS;
_CREW_VEST = _COMMON_VESTS;
_CREW_WEAPON = _COMMON_RIFLE_C;
_CREW_MAGS = [_COMMON_MAG_C, 3];

// ==================
// Pilot stuff
// ==================
_PILOT_HEADGEAR = "H_PilotHelmetHeli_B";
_PILOT_UNIFORM = "FP_Uniform_Auscam";
_PILOT_VEST = _COMMON_VESTS;
_PILOT_WEAPON = "hlc_rifle_auga2para_t";
_PILOT_MAGS = ["hlc_25Rnd_9x19mm_M882_AUG", 4];

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


// ==================
// Assign the stuff
// ==================
switch _kit do {

    case "PLT"; // fall through to SQL
    case "SQL":
    {
        private "_h";
        _h = [_SQL_HEADGEAR, _PLT_HEADGEAR] select ((["SQL", "PLT"] find _kit) min 0);

        [_unit, [_SQL_UNIFORM, _SQL_VEST, _h, _SQL_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG_GL, 8], [_COMMON_MAG_GL_T, 4]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, _SQL_BINOC] call FP_fnc_addOptic;
        [_unit, _SQL_ITEMS] call FP_fnc_addToContainers;

    };

    case "MEDIC":
    {
        [_unit, [_COMMON_UNIFORMS, _MED_VEST, _MED_HEADGEAR, _MED_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE_C, _COMMON_RIFLE_C_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, _MED_BP_ITEMS, "backpack"] call FP_fnc_addToContainers;
    };
    case "RIFLEMAN":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 1]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;
    };

    case "AR":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_AR_MAG, 1]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_AR, _COMMON_AR_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, [[_COMMON_AR_MAG,2]]] call FP_fnc_addToContainers;

    };

    case "ARASS":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, _COMMON_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 4]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, [[_COMMON_AR_MAG,2]]] call FP_fnc_addToContainers;

    };

    case "AT":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, "rhs_rpg_empty"]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, [_COMMON_AT_MAG_HE, _COMMON_AT_MAG_AP], "backpack"] call FP_fnc_addToContainers;
        [_unit, _COMMON_AT] call FP_fnc_addWeapon;
    };

    case "ATASS":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, "rhs_rpg_empty"]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 4]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, [_COMMON_AT_MAG_HE, _COMMON_AT_MAG_AP], "backpack"] call FP_fnc_addToContainers;
    };

    case "RAT":
    {

        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 4], [_COMMON_MAG_T, 4]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, _COMMON_AT_RAT] call FP_fnc_addWeapon;

    };

    case "AA":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, _COMMON_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, _STANDARD_MANPADS_ROCKET] call FP_fnc_addToContainers;
        [_unit, _STANDARD_MANPADS] call FP_fnc_addWeapon;
        [_unit, [_STANDARD_MANPADS_ROCKET, 2], "backpack"] call FP_fnc_addToContainers;

    };

    case "AAASS":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, _COMMON_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 4]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, [_STANDARD_MANPADS_ROCKET, 2]] call FP_fnc_addToContainers;

    };

    case "ENGINEER":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, _ENGI_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, _ENGI_BP_ITEMS]  call FP_fnc_addToContainers;
    };

    case "PILOT":
    {
        [_unit, [_PILOT_UNIFORM, _PILOT_VEST, _PILOT_HEADGEAR]] call FP_fnc_addContainers;
        [_unit, _PILOT_MAGS] call FP_fnc_addToContainers;
        [_unit, _PILOT_WEAPON] call FP_fnc_addWeapon;

    };
    case "CREWMAN":
    {
        [_unit, [_CREW_UNIFORM, _CREW_VEST, _CREW_HEADGEAR]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG_C, 4], [_COMMON_MAG_C_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE_C, _COMMON_RIFLE_C_ATTACHMENTS]] call FP_fnc_addWeapon;
    };

    case "CREWMANREPAIR":
    {
        [_unit, [_CREW_UNIFORM, _CREW_VEST, _CREW_HEADGEAR, _COMMON_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG_C, 4], [_COMMON_MAG_C_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, "ToolKit", "backpack"] call FP_fnc_addToContainers;

    };

    case "ENGINEERDEMINE":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, _SQL_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, ["ACE_DefusalKit"]] call FP_fnc_addToContainers;
        [_unit, ["MineDetector", "ToolKit"],  "backpack"] call FP_fnc_addToContainers;

    };

    case "ENGINEEREXPLOSIVES":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, _COMMON_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, ["ACE_DefusalKit", "ACE_M26_Clacker"]] call FP_fnc_addToContainers;
        [_unit, [["SatchelCharge_Remote_Mag", 3]], "backpack"] call FP_fnc_addToContainers;

    };
	
	case "ENGINEEREXPLOSIVES2":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, _SQL_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, ["ACE_DefusalKit", "ACE_M26_Clacker"]] call FP_fnc_addToContainers;
        [_unit, [["DemoCharge_Remote_Mag", 2]], "backpack"] call FP_fnc_addToContainers;

    };

    case "ENGINEERREPAIR":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, _COMMON_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, "ToolKit", "backpack"] call FP_fnc_addToContainers;

    };

    case "HAT":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, "B_Carryall_cbr"]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, _STANDARD_ROCKETHAT, "backpack"] call FP_fnc_addToContainers;
        [_unit, _STANDARD_ROCKET_LAUNCHER_HAT] call FP_fnc_addWeapon;

    };

    case "HATASS":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, "B_Carryall_cbr"]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 4]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, _STANDARD_ROCKETHAT] call FP_fnc_addToContainers;

    };

    case "MMGGUNNER":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS]] call FP_fnc_addContainers;
        [_unit, [_STANDARD_MMG_MAG, 4]] call FP_fnc_addToContainers;
        [_unit, _STANDARD_MMG] call FP_fnc_addWeapon;

    };

    case "MMGAGUNNER":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, _COMMON_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 4]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, [_STANDARD_MMG_MAG, 6]] call FP_fnc_addToContainers;

    };

    default {if (!isNil "FP_gear_errs") then {FP_gear_errs pushBack format ["%1 - NOT FOUND KIT: %2", str _unit, _kit]}};
};

// ==================
// Runs for everyone
// ==================

if (_kit != "AR") then {
    [_unit, [_COMMON_PISTOL_MAG, 2]] call FP_fnc_addToContainers;
    [_unit, _COMMON_PISTOL] call FP_fnc_addWeapon;
};


if (!(_kit in ["SNIPER","SPOTTER"])) then {
    [_unit, _COMMON_ITEMS] call FP_fnc_addToContainers;
};
