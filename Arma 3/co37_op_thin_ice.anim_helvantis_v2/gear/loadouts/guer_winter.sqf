private ["_unit", "_kit"];
_unit = _this select 0;
_kit = _this select 1;

// ==================
// Defines below. First, commmon stuff
// ==================
_COMMON_UNIFORMS = ["FP_Uniform_m81","FP_Uniform_kmsh","FP_Uniform_vsr","FP_Uniform_GRY","FP_Uniform_grn"];
_COMMON_VESTS = ["V_mas_gue_alice_webb_she","V_mas_gue_alice_webb","V_mas_gue_ind_webb","V_mas_gue_ind_webb_she","V_mas_gue_ind_webbmg","V_mas_gue_ind_webbmg_she"];
_COMMON_HEADGEARS = ["rhs_beanie_green","rhs_fieldcap_ml","rhs_Booniehat_flora","H_Bandanna_khk","H_Bandanna_gry","LOP_H_SSh68Helmet_OLV","LOP_H_SSh68Helmet_BLK","rhsusf_lwh_helmet_M1942"];
_COMMON_BP = "B_TacticalPack_blk";

_COMMON_ITEMS = [["HandGrenade", 2], ["SmokeShellGreen", 2], "ItemMap","ItemCompass","ItemWatch", "ItemRadio", "ACE_fieldDressing","ACE_fieldDressing", "ACE_Morphine"];

_COMMON_RIFLE = "RH_M16a1";
_COMMON_RIFLE_ATTACHMENTS = [];
_COMMON_MAG = "RH_20Rnd_556x45_M855A1";
_COMMON_MAG_T = "RH_20Rnd_556x45_M855A1";

_COMMON_RIFLE_C = "RH_ar10";
_COMMON_RIFLE_C_ATTACHMENTS = [];
_COMMON_MAG_C = "RH_20Rnd_762x51_AR10";
_COMMON_MAG_C_T = "RH_20Rnd_762x51_AR10";

_COMMON_RIFLE_GL = "RH_M16A1gl";
_COMMON_RIFLE_GL_ATTACHMENTS = _COMMON_RIFLE_ATTACHMENTS;
_COMMON_GL_NADES = [["1Rnd_HE_Grenade_shell", 4], ["1Rnd_Smoke_Grenade_shell", 2]];
_COMMON_MAG_GL = _COMMON_MAG;
_COMMON_MAG_GL_T = _COMMON_MAG_T;

_COMMON_AR = "rhs_weap_pkm";
_COMMON_AR_ATTACHMENTS = _COMMON_RIFLE_ATTACHMENTS;
_COMMON_AR_MAG = "rhs_100Rnd_762x54mmR";
_COMMON_AR_MAG_T = "rhs_100Rnd_762x54mmR_green";

_COMMON_AT_RAT = "rhs_weap_rpg26"; // assumed disposable. otherwise also add a rocket

_COMMON_PISTOL = "RH_tt33";
_COMMON_PISTOL_MAG = "RH_8Rnd_762_tt33";

// ==================
// PLT AND SQL stuff
// ==================
_SQL_BINOC = "binoc"; // check fn_addOptic.sqf
_SQL_ATTACHMENTS = ["acc_pointer_IR","optic_Arco"];
_SQL_HEADGEAR = _COMMON_HEADGEARS;
_PLT_HEADGEAR = "H_mas_gue_cow_O";
_SQL_VEST = _COMMON_VESTS;
_SQL_UNIFORM = _COMMON_UNIFORMS;
_SQL_ITEMS = ["ACE_microDAGR", "ACE_MapTools", "ACE_CableTie"];
_SQL_BP = ["tf_rt1523g","tf_mr3000","tf_anarc210", "tf_rt1523g"] select ([BLUFOR, OPFOR, independent, civilian] find side _unit);

// ==================
// Medic stuff
// ==================
_MED_HEADGEAR = _COMMON_HEADGEARS;
_MED_VEST = "rhs_6b23_medic";
_MED_BP = "CUP_B_MedicPack_ACU";
_MED_BP_ITEMS = [
    ["ACE_fieldDressing",16],
    ["ACE_morphine",12],
    ["ACE_epinephrine",12],
    ["ACE_bloodIV",4]
];

// ==================
// Crew stuff
// ==================
_CREW_HEADGEAR = "H_HelmetCrew_B";
_CREW_UNIFORM = _COMMON_UNIFORMS;
_CREW_VEST = "V_BandollierB_rgr";
_CREW_WEAPON = "sfp_kpistm45";
_CREW_MAGS = ["sfp_36Rnd_9mm_kpistm45", 3];

// ==================
// Pilot stuff
// ==================
_PILOT_HEADGEAR = "H_PilotHelmetFighter_B";
_PILOT_UNIFORM = "U_B_PilotCoveralls";
_PILOT_VEST = "V_TacVest_blk";
_PILOT_WEAPON = _COMMON_RIFLE_C;
_PILOT_MAGS = [_COMMON_MAG_C, 2];

// ==================
// Engineer stuff
// ==================
_ENGI_BP = "CUP_B_AlicePack_Khaki";
_ENGI_ITEMS = ["ACE_Clacker", "ACE_DefusalKit"];
_ENGI_BP_ITEMS = [["SatchelCharge_Remote_Mag", 2], ["IEDUrbanSmall_Remote_Mag", 2]];

// ==================
// Assign the stuff
// ==================

switch _kit do {

    case "PLT"; // fall through to SQL
    case "SQL":
    {
        private "_h";
        if (str _unit in ["gm", "debugger"]) then {
            _h =  "LOP_H_SLA_beret";
            _unit addGoggles "G_Bandanna_aviator";
        } else {
            _h = [_SQL_HEADGEAR, _PLT_HEADGEAR] select (["SQL", "PLT"] find _kit);
        };

        [_unit, [_SQL_UNIFORM, _SQL_VEST, _h, _SQL_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG_GL, 7], [_COMMON_MAG_GL_T, 4], _COMMON_GL_NADES]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE_GL, _SQL_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, _SQL_BINOC] call FP_fnc_addOptic;
        [_unit, _SQL_ITEMS] call FP_fnc_addToContainers;

    };
    case "FTL":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, _SQL_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 4]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;
        [_unit, _SQL_BINOC] call FP_fnc_addOptic;
    };

    case "MEDIC":
    {
        [_unit, [_COMMON_UNIFORMS, _MED_VEST, _MED_HEADGEAR, _MED_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG_C, 6], [_COMMON_MAG_C_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE_C, _COMMON_RIFLE_C_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, _MED_BP_ITEMS, "backpack"] call FP_fnc_addToContainers;

    };
    case "RIFLEMAN":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 4]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;
    };

    case "AR":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_AR_MAG, 1], [_COMMON_AR_MAG_T, 1]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_AR, _COMMON_AR_ATTACHMENTS]] call FP_fnc_addWeapon;

    };

    case "ARASS":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, _COMMON_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 2], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, [[_COMMON_AR_MAG, 2], [_COMMON_AR_MAG_T, 2]], "backpack"] call FP_fnc_addToContainers;

    };

    case "RAT":
    {

        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, _COMMON_AT_RAT] call FP_fnc_addWeapon;

    };

    case "ENGINEER":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, _ENGI_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, _ENGI_ITEMS]  call FP_fnc_addToContainers;
        [_unit, _ENGI_BP_ITEMS, "backpack"]  call FP_fnc_addToContainers;
    };

    default {if (!isNil "FP_gear_errs") then {FP_gear_errs pushBack format ["%1 - NOT FOUND KIT: %2", str _unit, _kit]}};
};

// ==================
// Runs for everyone
// ==================
[_unit, [_COMMON_ITEMS, "G_Balaclava_blk", "ACE_Flashlight_XL50"]] call FP_fnc_addToContainers;

[_unit, [_COMMON_PISTOL_MAG, 2]] call FP_fnc_addToContainers;
[_unit, _COMMON_PISTOL] call FP_fnc_addWeapon;

// [_unit, _COMMON_NVG] call FP_fnc_addNVG;
