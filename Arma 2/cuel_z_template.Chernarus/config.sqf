if (!isServer) exitWith {};

CLY_defaultdensity=param_density;
CLY_minspawndist=param_minspawn;
CLY_maxspawndist=param_maxspawn;
CLY_zombiemagazinechance= switch (param_magazine) do {case -1:{0.06};case 0:{0};default{param_magazine / 10};};
CLY_zombiebandagechance= switch (param_normalmed) do {case -1:{0.05};case 0:{0};default{param_magazine / 10};};
CUEL_mZombiesmedchance=(param_militarymed / 4);
CLY_minaggroradius=40;
CLY_maxaggroradius=120;
CLY_despawndist=CLY_maxspawndist+50;
CLY_chasegiveupdist=300;
CLY_randomvictimradius=0.333;
CLY_vehicleaggromultiplier=2;
CLY_unarmedaggromultiplier=0.2;
CLY_hordereservedgroups=80;

//random magazines in some zombies, first value will be most common, otherwise random value in 2nd array. Can have more arrays.
CLY_zombiemagazines=["17Rnd_9x19_glock17",["30Rnd_9x19_MP5SD","30Rnd_556x45_StanagSD","30Rnd_545x39_AKSD","64Rnd_9x19_SD_Bizon","30Rnd_545x39_AK","8Rnd_B_Beneli_Pellets","30Rnd_556x45_Stanag","20Rnd_762x51_B_SCAR"]];

// *********** ACE  ************ //
ace_sys_wounds_leftdam  = (param_ace_leftdam / 10); publicVariable "ace_sys_wounds_leftdam";
ace_wounds_prevtime = param_ace_pmr; publicVariable "ace_wounds_prevtime";
ace_sys_wounds_all_medics = if (param_ace_medic == 1) then {true} else {false}; publicVariable "ace_sys_wounds_all_medics";
ace_sys_wounds_no_rpunish = true; publicVariable "ace_sys_wounds_no_rpunish";
ACE_NoStaminaEffects = if (param_ace_stamina == 1) then {true} else {false}; publicVariable "ACE_NoStaminaEffects";
// *********** ACE  ************ //

if (param_rndhorde == 1) then {
	CLY_randomhordemininterval=300;
	CLY_randomhordemaxinterval=600;
	if (param_rndhordeinterval != 0) then {
		switch param_rndhordeinterval do {
			case 1:{CLY_randomhordemininterval=30;CLY_randomhordemaxinterval=60;};
			case 2:{CLY_randomhordemininterval=60;CLY_randomhordemaxinterval=120;};
			case 3:{CLY_randomhordemininterval=240;CLY_randomhordemaxinterval=480;};
			case 4:{CLY_randomhordemininterval=600;CLY_randomhordemaxinterval=1000;};
		};
	};
	CLY_randomhordeminspawndist=250;
	CLY_randomhordemaxspawndist=400;
	CLY_randomhordeminamount=param_rndhordemin;
	CLY_randomhordemaxamount=param_rndhordemax;
	if (CLY_randomhordeminamount >= CLY_randomhordemaxamount) then {CLY_randomhordeminamount=4};
	[] execVM "zombie_scripts\cly_z_randomhorde.sqf";
};

// % zombie types, must be total 100
CLY_zombietypes=[["normal",45],["surprise",30],["passive",0],["crawler",6],["passive crawler",0],["sneaker",6],["ambusher",4],["armored",4],["slow armored",5]];
//

//sound config //
CLY_noises_idle=["idle1","idle2","idle3","idle4","idle5","idle6","idle7","idle8"];
CLY_noises_chase=["chase1","chase2","chase3","chase4","chase5","chase6","chase7","chase8"];
CLY_noises_attack=["attack1","attack2","attack3","attack4"];
CLY_noises_die=["die1","die2"];
CLY_noises_scream=["scream1","scream2","scream3"];
//sound config //

//zombie classes
CLY_zombieclasses=[["Citizen1","Citizen2","Citizen3","Citizen4"],["Profiteer1","Profiteer2","Profiteer3","Profiteer4"],["Rocker1","Rocker2","Rocker3","Rocker4"],["Ins_Villager3","Ins_Villager4"],["Ins_Woodlander1","Ins_Woodlander2","Ins_Woodlander3"],["Ins_Worker2"],["Ins_Lopotev","Assistant","Doctor","Pilot_EP1","Policeman","Priest","SchoolTeacher","TK_CIV_Worker01_EP1","TK_CIV_Worker02_EP1",["Functionary1","Functionary2"]],["Ins_Soldier_1","Ins_Soldier_CO","Ins_Bardak",["Ins_Soldier_Crew","Ins_Lopotev"]],["CDF_Soldier","CDF_Soldier_Militia","CDF_Soldier_TL","CDF_Soldier_Light",["CDF_Soldier_Crew","CDF_Soldier_Officer"]],[["USMC_Soldier","USMC_SoldierM_Marksman","USMC_Soldier_Officer","USMC_Soldier_TL","USMC_Soldier_Crew","USMC_Soldier_Light","FR_TL","FR_Marksman","FR_GL","FR_Sapper","FR_Light"],["BAF_Soldier_W","BAF_Soldier_Officer_W","BAF_crewman_W","BAF_Soldier_AR_W","BAF_Soldier_TL_W","BAF_Soldier_L_W"],["RU_Soldier","RU_Soldier_Officer","RU_Soldier_Crew","RU_Soldier_Light","RUS_Soldier3","RUS_Commander"],["Soldier_PMC","Soldier_GL_PMC","Soldier_Engineer_PMC","Soldier_TL_PMC"]]];
CLY_armoredzombieclasses=["MVD_Soldier"];
//zombie classes


// No editing below.
ace_sys_tracking_markers_enabled = false;  publicVariable "ace_sys_tracking_markers_enabled";
ace_sys_wounds_noai = true; publicVariable "ace_sys_wounds_noai";
ace_sys_eject_fnc_weaponCheckEnabled = {false};  publicVariable "ace_sys_eject_fnc_weaponCheckEnabled";
if (CLY_debug) then {totTriggers = 0; publicVariable "totTriggers";};