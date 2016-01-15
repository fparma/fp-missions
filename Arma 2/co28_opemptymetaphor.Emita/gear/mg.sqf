//[this] call compile preprocessFileLineNumbers "source\gear\X.sqf";

#include "common.sqf"

_man addMagazine "100Rnd_762x54_PK";
_man addMagazine "100Rnd_762x54_PK";
_man addMagazine "100Rnd_762x54_PK";

_man addMagazine "SmokeshellGreen";
_man addMagazine "SmokeshellGreen";
_man addMagazine "HandGrenade_West";
_man addMagazine "HandGrenade_West";

_man addWeapon "PK";

_man addWeapon SQUAD_RADIO;

_man selectWeapon (primaryWeapon _man);