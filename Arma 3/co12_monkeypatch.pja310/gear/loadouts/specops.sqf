private ["_unit", "_kit"];
_unit = _this select 0;
_kit = _this select 1;

// ==================
// Defines below. First, commmon stuff
// ==================
_COMMON_UNIFORMS = ["Niko_USA_TyphonBlack"];
_COMMON_VESTS = ["Niko_USA_PlateCarrierL_Black"];
_COMMON_HEADGEARS = ["H_HelmetSpecB_blk"];
_COMMON_BP = "B_AssaultPack_blk";

_COMMON_NVG = "wide"; // can be: pvs14, pvs15, gen1, gen2, gen3, gen4, wide, blufor, opfor, indep. check fn_addNVG.sqf
_COMMON_ITEMS = ["RH_qdss_nt4", "optic_NVS", ["HandGrenade", 2], ["SmokeShellGreen", 2], "ItemMap","ItemCompass","ItemWatch", "ItemRadio", ["ACE_fieldDressing", 2], "ACE_Morphine"];

if (!(_kit in ["SQL", "PLT", "AR"])) then {
  _COMMON_ITEMS pushBack "RH_TD_ACB_b";
};
if (_kit == "AR") then {
  _COMMON_ITEMS = _COMMON_ITEMS - ["RH_qdss_nt4"];
};

// RH_barska_rds
_COMMON_RIFLE = "RH_M27IAR";
_COMMON_RIFLE_ATTACHMENTS = ["RH_barska_rds","RH_peq15b"];
_COMMON_MAG = "30Rnd_556x45_Stanag";
_COMMON_MAG_T = "30Rnd_556x45_Stanag_Tracer_Red";

_COMMON_RIFLE_C = _COMMON_RIFLE;
_COMMON_RIFLE_C_ATTACHMENTS = _COMMON_RIFLE_ATTACHMENTS;
_COMMON_MAG_C = _COMMON_MAG;
_COMMON_MAG_C_T = _COMMON_MAG_T;

_COMMON_RIFLE_GL = "RH_M4A1_ris_M203s";
_COMMON_RIFLE_GL_ATTACHMENTS = _COMMON_RIFLE_ATTACHMENTS;
_COMMON_GL_NADES = [["1Rnd_HE_Grenade_shell", 6],["UGL_FlareCIR_F", 2],["1Rnd_SmokeRed_Grenade_shell", 2], ["1Rnd_SmokeYellow_Grenade_shell", 2]];
_COMMON_MAG_GL = _COMMON_MAG;
_COMMON_MAG_GL_T = _COMMON_MAG_T;

_COMMON_AR = "rhs_weap_m249_pip_S_para";
_COMMON_AR_ATTACHMENTS = _COMMON_RIFLE_ATTACHMENTS;
_COMMON_AR_MAG = "rhs_200rnd_556x45_M_SAW";
_COMMON_AR_MAG_T = "rhs_200rnd_556x45_M_SAW";

_COMMON_AT = "";
_COMMON_AT_MAG_HE = "";
_COMMON_AT_MAG_AP = "";
_COMMON_AT_RAT = "rhs_weap_M136_hedp"; // assumed disposable

_COMMON_PISTOL = "RH_g19";
_COMMON_PISTOL_MAG = "RH_19Rnd_9x19_g18";

// ==================
// PLT AND SQL stuff
// ==================
_SQL_BINOC = "laser"; // can be binoc, soflam, lerca_b (black), lerca_t (tan), laser, laser_blufor, laser_opfor, laser_indep. check fn_addOptic.sqf
_SQL_ATTACHMENTS = ["RH_t1", "RH_peq15b"];
_SQL_HEADGEAR = "H_Beret_Colonel";
_SQL_VEST = _COMMON_VESTS;
_SQL_UNIFORM = _COMMON_UNIFORMS;
_SQL_ITEMS = ["ACE_microDAGR", "ACE_MapTools"];
_SQL_BP = ["tf_rt1523g","tf_mr3000","tf_anprc155", "tf_rt1523g"] select ([BLUFOR, OPFOR, independent, civilian] find side _unit);

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

    case "PLT"; // fall through to SQL
    case "SQL":
    {
        private "_h";
        _h = [_SQL_HEADGEAR, _PLT_HEADGEAR] select ((["SQL", "PLT"] find _kit) min 0);

        [_unit, [_SQL_UNIFORM, _SQL_VEST, _h, _SQL_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG_GL, 7], [_COMMON_MAG_GL_T, 4], _COMMON_GL_NADES]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE_GL, _SQL_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, _SQL_BINOC] call FP_fnc_addOptic;
        [_unit, _SQL_ITEMS] call FP_fnc_addToContainers;

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
        [_unit, [_COMMON_UNIFORMS, _MED_VEST, _MED_HEADGEAR, _MED_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 4]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;
    };

    case "AR":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS]] call FP_fnc_addContainers;
        [_unit, [_COMMON_AR_MAG, 2]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_AR, _COMMON_AR_ATTACHMENTS]] call FP_fnc_addWeapon;

    };

    case "ARASS":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, _COMMON_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 4]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, [_COMMON_AR_MAG, 2], "backpack"] call FP_fnc_addToContainers;

    };

    case "AT":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, _COMMON_BP]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_AT_MAG_HE, 1], [_COMMON_AT_MAG_AP, 2]], "backpack"]  call FP_fnc_addToContainers;

        [_unit, [[_COMMON_MAG, 8], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;
        [_unit, _COMMON_AT] call FP_fnc_addWeapon;

    };

    case "ATASS":
    {

      [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS]] call FP_fnc_addContainers;
      [_unit, [_COMMON_MAG, 2]] call FP_fnc_addToContainers;
      [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

      [_unit, _COMMON_AT_RAT] call FP_fnc_addWeapon;
    };

    case "RAT":
    {

        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 4]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, _COMMON_AT_RAT] call FP_fnc_addWeapon;

    };

    case "GL":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG_GL, 9], [_COMMON_MAG_GL_T, 2], _COMMON_GL_NADES]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE_GL, _COMMON_RIFLE_GL_ATTACHMENTS]] call FP_fnc_addWeapon;

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
        [_unit, _CREW_MAGS] call FP_fnc_addToContainers;
        [_unit, _CREW_WEAPON] call FP_fnc_addWeapon;
    };

    default {if (!isNil "FP_gear_errs") then {FP_gear_errs pushBack format ["%1 - NOT FOUND KIT: %2", str _unit, _kit]}};
};

if (random 1 > 0.6 && !(_kit == "SQL")) then {
  _unit addGoggles "G_Balaclava_blk";
};

// ==================
// Runs for everyone
// ==================
[_unit, _COMMON_ITEMS] call FP_fnc_addToContainers;

[_unit, [_COMMON_PISTOL_MAG, 2]] call FP_fnc_addToContainers;
[_unit, _COMMON_PISTOL] call FP_fnc_addWeapon;

[_unit, _COMMON_NVG] call FP_fnc_addNVG;