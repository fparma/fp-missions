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

_man addWeapon "ACE_ALICE_Backpack";

WAIT_FOR_RUCK
_man setVariable ["ACE_RuckMagContents", [["100Rnd_762x54_PK", 3]]];
END_WAIT_FOR_RUCK

_man selectWeapon (primaryWeapon _man);