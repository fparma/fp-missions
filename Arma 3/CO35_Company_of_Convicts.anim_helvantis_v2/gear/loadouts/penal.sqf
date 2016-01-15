params ["_unit", "_kit"];

// ==================
// Defines below. First, commmon stuff
// ==================
_COMMON_UNIFORMS = ["FP_Uniform_klmk"];
_COMMON_VESTS = ["V_mas_gue_ind_webb"];
_COMMON_HEADGEARS = ["H_mas_gue_cap_I", "H_Bandanna_gry","H_Cap_blk", "rds_Woodlander_cap3"];
_COMMON_BP = "CUP_B_AlicePack_Khaki";

_COMMON_ITEMS = ["ItemMap","ItemCompass","ItemWatch", "ACE_fieldDressing","ACE_fieldDressing", "ACE_fieldDressing"];
_UNCOMMON_ITEMS = ["ItemMap","ItemCompass","ItemWatch", "ACE_microDAGR", "ACE_MapTools", "ACRE_PRC148", "ACE_fieldDressing","ACE_fieldDressing", "ACE_fieldDressing", "SmokeShell", "ACE_morphine"];

_COMMON_RIFLE = "hlc_rifle_ak47";
_COMMON_MAG = "hlc_30Rnd_762x39_b_ak";

_COMMON_RIFLE_C = "hlc_rifle_aks74u";
_COMMON_MAG_C = "hlc_30Rnd_545x39_B_AK";
_COMMON_MAG_C_T = "hlc_30Rnd_545x39_t_ak";

_COMMON_MG = "CUP_lmg_PKM";
_COMMON_MG_MAG = "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";

// _MGASS_RIFLE = "";
_MG_RIFLE = "";

_COMMON_PISTOL = "RH_mak";
_COMMON_PISTOL_MAG = "RH_8Rnd_9x18_Mak";

// ==================
// PLT AND SQL stuff
// ==================
_SQL_BINOC = "Binocular"; // check fn_addOptic.sqf
_SQL_WEAPON = "RH_python";
_SQL_MAG = "RH_6Rnd_357_Mag";
_SQL_HEADGEAR = "H_Beret_blk";
_PLT_HEADGEAR = "H_Beret_Colonel";
_SQL_VEST = _COMMON_VESTS;
_SQL_UNIFORM = "FP_Uniform_klmk";
_PLT_UNIFORM = "FP_Uniform_kmsh";
_SQL_ITEMS = _UNCOMMON_ITEMS;
_SQL_FLARES = "ACE_HandFlare_Red";
_SQL_BP = "B_AssaultPack_rgr";

// ==================
// AT stuff
// ==================
_AT_HEADGEAR = _COMMON_HEADGEARS;
_AT_ATTACHMENTS = "CUP_optic_PGO7V";
_AT_BP = "CUP_B_RPGPack_Khaki";
_AT_MAG_AP = "CUP_PG7V_M";
_AT_WEAPON = "CUP_launch_RPG7V";
_AT_SECOND = "RH_vz61";
_AT_SECOND_MAG = "RH_20Rnd_32cal_vz61";

// ==================
// COM stuff
// ==================
_COM_HEADGEAR = "FP_Beret_Maroon";
_COM_UNIFORM = "FP_Uniform_kmsh";
_COM_VEST = _COMMON_VESTS;
_COM_WEAPON = "RH_Deagles";
_COM_MAGS = ["RH_7Rnd_50_AE", 9];
_COM_BINOC = _SQL_BINOC;
_COM_ITEMS = _UNCOMMON_ITEMS;

// ==================
// Grenadier stuff
// ==================
_GREN_HEADGEAR = _COMMON_HEADGEARS;
_GREN_UNIFORM = _COMMON_UNIFORMS;
_GREN_VEST = _COMMON_VESTS;
_GREN_WEAPON = _COMMON_PISTOL;
_GREN_MAGS = [_COMMON_PISTOL_MAG, 5];
_GREN_GRENS = [["CUP_HandGrenade_RGD5", 10], ["SmokeShell", 2]];


// ==================
// Assign the stuff
// ==================

switch _kit do {

    case "PLT"; // fall through to SQL
	{
        [_unit, [_SQL_UNIFORM, _SQL_VEST, _PLT_HEADGEAR, _SQL_BP]] call FP_fnc_addContainers;
        [_unit, [_COMMON_MAG_C, 9]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE_C]] call FP_fnc_addWeapon;

        [_unit, _SQL_BINOC] call FP_fnc_addOptic;
        [_unit, _SQL_ITEMS] call FP_fnc_addToContainers;

    };
    case "SQL":
    {
        [_unit, [_SQL_UNIFORM, _SQL_VEST, _SQL_HEADGEAR]] call FP_fnc_addContainers;
        [_unit, [[_SQL_MAG, 7], [_SQL_FLARES, 3]]] call FP_fnc_addToContainers;
        [_unit, [_SQL_WEAPON]] call FP_fnc_addWeapon;

        [_unit, _SQL_BINOC] call FP_fnc_addOptic;
        [_unit, _SQL_ITEMS] call FP_fnc_addToContainers;

    };

    case "RIFLEMAN":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 9]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;
		[_unit, _COMMON_ITEMS]  call FP_fnc_addToContainers;
    };

    case "MG":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MG_MAG, 1]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_MG]] call FP_fnc_addWeapon;

		[_unit, _COMMON_ITEMS]  call FP_fnc_addToContainers;
    };

     case "MGASS":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_HEADGEARS, _COMMON_BP]] call FP_fnc_addContainers;

        [_unit, [[_COMMON_MG_MAG, 5]], "backpack"] call FP_fnc_addToContainers;

		[_unit, _COMMON_ITEMS]  call FP_fnc_addToContainers;

    };


    case "AT":
    {
        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS, _AT_BP]] call FP_fnc_addContainers;
         [_unit, [[_AT_MAG_AP, 3], [_AT_ATTACHMENTS]], "backpack"] call FP_fnc_addToContainers;

        [_unit, [_AT_SECOND_MAG, 3]] call FP_fnc_addToContainers;
        [_unit, [_AT_SECOND]] call FP_fnc_addWeapon;
        [_unit, _AT_WEAPON] call FP_fnc_addWeapon;

		[_unit, _COMMON_ITEMS]  call FP_fnc_addToContainers;
    };

    case "RAT":
    {

        [_unit, [_COMMON_UNIFORMS, _COMMON_VESTS, _COMMON_HEADGEARS]] call FP_fnc_addContainers;
        [_unit, [[_COMMON_MAG, 6], [_COMMON_MAG_T, 2]]] call FP_fnc_addToContainers;
        [_unit, [_COMMON_RIFLE, _COMMON_RIFLE_ATTACHMENTS]] call FP_fnc_addWeapon;

        [_unit, _COMMON_AT_RAT] call FP_fnc_addWeapon;

    };


    case "GREN":
    {
        [_unit, [_GREN_UNIFORM, _GREN_VEST, _GREN_HEADGEAR]] call FP_fnc_addContainers;
        [_unit, _GREN_MAGS] call FP_fnc_addToContainers;
        [_unit, _GREN_WEAPON] call FP_fnc_addWeapon;
		[_unit, _GREN_GRENS] call FP_fnc_addToContainers;

		[_unit, _COMMON_ITEMS]  call FP_fnc_addToContainers;

    };
    case "COM":
    {
        [_unit, [_COM_UNIFORM, _COM_VEST, _COM_HEADGEAR]] call FP_fnc_addContainers;
        [_unit, _COM_MAGS] call FP_fnc_addToContainers;
        [_unit, _COM_WEAPON] call FP_fnc_addWeapon;

		[_unit, _COM_BINOC] call FP_fnc_addOptic;
		[_unit, _COM_ITEMS] call FP_fnc_addToContainers;
    };

    default {if (!isNil "FP_gear_errs") then {FP_gear_errs pushBack format ["%1 - NOT FOUND KIT: %2", str _unit, _kit]}};
};
