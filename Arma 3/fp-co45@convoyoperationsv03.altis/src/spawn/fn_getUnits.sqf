// special units have 5% chance to spawn per created unit (more units increase chance) and only ONCE per call to spawn.
// leaders are the first two positions


private  ["_specialUnits","_units","_type","_airdropUnit"] ;
_units = [];
_specialUnits = [];
_type = [_this,0,""] call BIS_fnc_param;
_air = [_this,1,false,[false]] call BIS_fnc_param;

switch (toUpper _type) do {
	case "CSAT": {
		_units = ["O_Soldier_SL_F","O_Soldier_TL_F","O_medic_F","O_Soldier_AR_F","O_Soldier_A_F","O_Soldier_GL_F","O_Soldier_F","O_Soldier_lite_F"];
		_specialUnits = ["O_Soldier_LAT_F"];
		_airdropUnit = "O_Heli_Light_02_F";
	};
	case "NATO":{
		_units = ["B_Soldier_TL_F","B_Soldier_SL_F","B_Soldier_A_F","B_soldier_AR_F","B_medic_F","B_Soldier_GL_F","B_Soldier_F","B_Soldier_lite_F"];
		_specialUnits = ["B_soldier_LAT_F"];
		_airdropUnit = "B_Heli_Transport_01_camo_F";
	};
	case "FIA":{
		_units = ["B_G_Soldier_SL_F","B_G_Soldier_TL_F","B_G_Soldier_A_F","B_G_Soldier_AR_F","B_G_medic_F","B_G_Soldier_GL_F","B_G_Soldier_F","B_G_Soldier_lite_F"];
		_specialUnits = ["B_G_Soldier_LAT_F"];
		_airdropUnit = "";
	};
	case "AAF":{
		_units = ["I_Soldier_TL_F","I_Soldier_SL_F","I_Soldier_lite_F","I_soldier_F","I_Soldier_GL_F","I_medic_F","I_Soldier_AR_F","I_Soldier_A_F"];
		_specialUnits = ["I_Soldier_LAT_F"];
		_airdropUnit = "I_Heli_Transport_02_F";
	};
	case "AAFD":{
		_units = ["AAF_D_Soldier_SL","AAF_D_Soldier_TL","AAF_D_Soldier_R","AAF_D_Soldier_MED","AAF_D_Soldier_AR","AAF_D_Soldier_AB","AAF_D_Soldier_GL","AAF_D_Soldier_RL"];
		_specialUnits = ["AAF_D_Soldier_LAT"];
		_airdropUnit = "AAF_D_VEH_Heli_Transport";
	};
	case "PIRATES":{
		_units = ["CAF_AG_AFR_P_AK74","CAF_AG_AFR_P_PKM","CAF_AG_AFR_P_RPK74","CAF_AG_AFR_P_AK47","CAF_AG_AFR_P_AK47","CAF_AG_AFR_P_AK47"];
		_specialUnits = ["CAF_AG_AFR_P_RPG","CAF_AG_AFR_P_GL"];
		_airdropUnit = "";
	};
	case "EUREBELS":{
		_units = ["CAF_AG_EEUR_R_AK74","CAF_AG_EEUR_R_PKM","CAF_AG_EEUR_R_RPK74","CAF_AG_EEUR_R_AK47","CAF_AG_EEUR_R_AK47","CAF_AG_EEUR_R_AK47"];
		_specialUnits = ["CAF_AG_EEUR_R_RPG","CAF_AG_EEUR_R_GL"];
		_airdropUnit = "";
	};
	case "TRIBAL":{
		_units = ["CAF_AG_ME_T_AK74","CAF_AG_ME_T_PKM","CAF_AG_ME_T_RPK74","CAF_AG_ME_T_AK47","CAF_AG_ME_T_AK47","CAF_AG_ME_T_AK47"];
		_specialUnits = ["CAF_AG_ME_T_RPG","CAF_AG_ME_T_GL"];
		_airdropUnit = "";
	};
	default {["fn_unitsArray: Tried to select non existing units: (%1)",_type] call BIS_fnc_error};
};
//return values
if (_air) exitWith {
	if (_airdropUnit == "") then {["fn_getUnits: Team (%1) are missing an air drop heli.",_type] call BIS_fnc_error};
	_airdropUnit
};

[_units,_specialUnits]

