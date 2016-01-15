
#define BU ["Niko_USA_SnowMARPAT"]
#define BV ["Niko_USA_PlateCarrierH_Winter"]
#define BH ["H_Watchcap_camo", "H_MilCap_gry"]

#define RU ["U_I_CombatUniform"]
#define RV ["rhs_6b23_rifleman", "V_I_G_resistanceLeader_F", "rhs_6b23_6sh92_headset_mapcase"]
#define RH ["H_ShemagOpen_khk","rhs_tsh4_ess","rhs_tsh4_bala","rhs_tsh4","rds_Woodlander_cap3","rds_Woodlander_cap1","rds_Woodlander_cap4", "H_caf_ag_fur2", "LOP_H_Bardak_beret"]


while {alive player} do {
	sleep 1.25;
	switch (side player) do {
		case blufor: {
			if (uniform player in RU) then {
				removeUniform player;
				hintSilent "You cannot carry this";
			};
			if (vest player in RV) then {
				removeVest player;
				hintSilent "You cannot carry this";
			};
			if (headgear player in RH) then {
				removeHeadgear player;
				hintSilent "You cannot carry this";
			};
		};
		case opfor: {
			if (uniform player in BU) then {
				removeUniform player;
				hintSilent "You cannot carry this";
			};
			if (vest player in BV) then {
				removeVest player;
				hintSilent "You cannot carry this";
			};
			if (headgear player in BH) then {
				removeHeadgear player;
				hintSilent "You cannot carry this";
			};
		};
	};
};
