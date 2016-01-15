//[this] call compile preprocessFileLineNumbers "source\gear\X.sqf";

#include "common.sqf"

_man addMagazine "ACE_45Rnd_545x39_S_AK";
_man addMagazine "ACE_45Rnd_545x39_S_AK";
_man addMagazine "ACE_45Rnd_545x39_S_AK";
_man addMagazine "ACE_45Rnd_545x39_EP_S_AK";
_man addMagazine "ACE_45Rnd_545x39_EP_S_AK";
_man addMagazine "ACE_45Rnd_545x39_EP_S_AK";
_man addMagazine "ACE_45Rnd_545x39_EP_S_AK";

_man addMagazine "SmokeshellGreen";
_man addMagazine "SmokeshellGreen";
_man addMagazine "HandGrenade_East";
//_man addMagazine "ACE_Battery_Rangefinder";

_man addMagazine "1Rnd_HE_GP25";
_man addMagazine "1Rnd_HE_GP25";
_man addMagazine "1Rnd_HE_GP25";
_man addMagazine "1Rnd_HE_GP25";
_man addMagazine "1Rnd_HE_GP25";
_man addMagazine "1Rnd_Smoke_GP25";
_man addMagazine "1Rnd_Smoke_GP25";

_man addWeapon "ACE_AKS74P_GL";
_man addWeapon "ACE_Backpack_CivAssault";
_man addWeapon SQUAD_RADIO;

WAIT_FOR_RUCK
_man setVariable ["ACE_RuckMagContents", [["PipeBomb", 1],["ACE_C4_M", 4],["1Rnd_HE_GP25",2]]];
END_WAIT_FOR_RUCK


_man selectWeapon (primaryWeapon _man);

