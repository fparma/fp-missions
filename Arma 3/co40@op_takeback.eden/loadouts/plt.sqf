#include "sql.sqf"

_unit addBackpack "usm_pack_st138_prc77";
_unit addItemToBackpack "ACRE_PRC117F";
_unit addItemToVest "ACRE_PRC148";

if (_type == "B_RangeMaster_F") then {
  // zeus
  _unit addHeadgear "CUP_H_FR_Headband_Headset";
}else {
  _unit addHeadgear "usm_bdu_cap_wdl";
};
