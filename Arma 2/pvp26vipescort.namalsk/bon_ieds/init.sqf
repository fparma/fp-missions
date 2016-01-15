//by Bon_Inf*
// very simple IED script :-P

// NOTE: depending on the number roads on the map,
// 	 the IED creation and initialization can
//	 take up to a few minutes



BON_IED_PATH = "bon_ieds\";


// number ieds; values between [0,4]
// 0 - no ieds
// 4 - max. possible according to the minimum distance between two ieds
bon_number_ieds = bon_ieds;

bon_min_distance_between_ieds = 800;

bon_ied_container = ["HMMWVWreck","hiluxWreck","datsun01Wreck",
	"datsun02Wreck","SKODAWreck","T72WreckTurret","UAZWreck","BMP2Wreck",
	"BRDMWreck","T72Wreck"];


bon_ied_boomlist = ["ARTY_Sh_105_HE","Bo_GBU12_LGB","Sh_85_HE"];

//comment out the next line if no greenzone should be established
bon_ied_greenzone = [getmarkerpos "Respawn",500]; // [position,radius] no IED shall spawn *Changed by SemlerPDX from 1500 to 3500 for CLAfghan map port to reflect LOS from base to the 2 roads leaving green zone v0.85


[] execVM (BON_IED_PATH+"ied_creation.sqf");

if(isServer) then{
	"bon_ieds_ied_defused" addPublicVariableEventHandler {(_this select 1) execVM (BON_IED_PATH+"ied_defusion_handler.sqf")};
};