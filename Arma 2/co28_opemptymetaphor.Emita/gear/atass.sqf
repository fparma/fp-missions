//[this] call compile preprocessFileLineNumbers "source\gear\X.sqf";

#include "common.sqf"

_man addMagazine "30Rnd_545x39_AK";
_man addMagazine "30Rnd_545x39_AK";
_man addMagazine "30Rnd_545x39_AK";
_man addMagazine "30Rnd_545x39_AK";
_man addMagazine "30Rnd_545x39_AK";
_man addMagazine "30Rnd_545x39_AK";
_man addMagazine "30Rnd_545x39_AK";

_man addMagazine "SmokeshellGreen";
_man addMagazine "SmokeshellGreen";
_man addMagazine "HandGrenade_East";

_man addWeapon "ACE_AK105";
_man addWeapon SQUAD_RADIO;
_man addWeapon "ACE_Backpack_RPG";

WAIT_FOR_RUCK
_man setVariable ["ACE_RuckMagContents", [["ACE_RPG29_PG29", 1],["ACE_RPG29_TBG29", 1]]];
END_WAIT_FOR_RUCK

_man selectWeapon (primaryWeapon _man);