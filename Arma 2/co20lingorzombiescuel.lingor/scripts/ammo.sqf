// by cuel. useage in init: _xhandle = [this, ammoamount] execVM "scripts\ammo.sqf"
private ["_box","_amount"];
_box = _this select 0;
_amount =  _this select 1;

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;

_box addMagazineCargoGlobal["20Rnd_762x51_B_SCAR",_amount];
_box addMagazineCargoGlobal["30Rnd_556x45_Stanag",_amount];
_box addMagazineCargoGlobal["20Rnd_762x51_DMR",_amount];
_box addMagazineCargoGlobal["8Rnd_B_Beneli_Pellets",_amount];
_box addMagazineCargoGlobal["20Rnd_762x51_FNFAL",_amount];
_box addMagazineCargoGlobal["10x_303",_amount];
_box addMagazineCargoGlobal["8Rnd_B_Saiga12_Pellets",_amount];
_box addMagazineCargoGlobal["200Rnd_556x45_M249",1];
_box addMagazineCargoGlobal["17Rnd_9x19_glock17",_amount+4];
_box addMagazineCargoGlobal["7Rnd_45ACP_1911",_amount+4];