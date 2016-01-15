//[this] call compile preprocessFileLineNumbers "gear\X.sqf";

#include "common.sqf"

_man addMagazine "30Rnd_545x39_AK";
_man addMagazine "30Rnd_545x39_AK";
_man addMagazine "30Rnd_545x39_AK";
_man addMagazine "30Rnd_545x39_AK";
_man addMagazine "30Rnd_545x39_AK";
_man addMagazine "30Rnd_545x39_AK";
_man addMagazine "30Rnd_545x39_AK";
_man addMagazine "30Rnd_545x39_AK";

_man addMagazine "SmokeshellGreen";
_man addMagazine "SmokeshellGreen";
_man addMagazine "SmokeshellPurple";

_man addMagazine "ACE_Epinephrine";
_man addMagazine "ACE_Epinephrine";
_man addMagazine "ACE_Morphine";
_man addMagazine "ACE_Morphine";
_man addMagazine "ACE_Bandage";
_man addMagazine "ACE_Bandage";
_man addMagazine "ACE_Medkit";

_man addWeapon "AKS_74_kobra";

_man addWeapon SQUAD_RADIO;
_man addWeapon PLATOON_RADIO;

_man addWeapon "ACE_Rucksack_EAST_Medic";
WAIT_FOR_RUCK
_man setVariable ["ACE_RuckMagContents", [["30Rnd_545x39_AK", 2],["ACE_Bandage", 15],["ACE_Morphine", 10],["ACE_Epinephrine", 10],["ACE_Medkit", 8]]];
_man setVariable ["ACE_WeaponOnBack", "ACE_Stretcher"];
END_WAIT_FOR_RUCK


_man selectWeapon (primaryWeapon _man);