/////////   MP Ammo Box script
/////////   By: Riouken
/////////   For Arma 3

if (! isServer) exitWith {};


_crate = _this select 0;




while {alive _crate} do
{


clearMagazineCargo _crate;
clearWeaponCargo _crate;
clearItemCargoGlobal _crate;

///AMMO///

_crate addMagazineCargoGlobal ["hlc_30Rnd_556x45_B_AUG", 200];
_crate addMagazineCargoGlobal ["hlc_30Rnd_556x45_T_AUG", 200];
_crate addMagazineCargoGlobal ["RH_20Rnd_57x28_FN", 200];
_crate addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 200];
_crate addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 200];
_crate addMagazineCargoGlobal ["1Rnd_SmokeOrange_Grenade_shell", 200];
_crate addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 200];
_crate addMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell", 200];



////Launcher Ammo////



_crate addMagazineCargoGlobal ["CUP_SMAW_HEAA_M", 50];
_crate addMagazineCargoGlobal ["CUP_SMAW_HEDP_M", 50];


/////Explosives////



_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 50];
_crate addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", 50];
_crate addWeaponCargoGlobal ["ToolKit", 50];
_crate addWeaponCargoGlobal ["MineDetector", 500];
_crate addWeaponCargoGlobal ["AGM_bandage", 500];
_crate addWeaponCargoGlobal ["AGM_epipen", 500];
_crate addWeaponCargoGlobal ["AGM_morphine", 500];
_crate addWeaponCargoGlobal ["AGM_bloodbag", 500];





/////Grenades////



///Attachments///


////Items////


/////Items////


_crate addItemCargoGlobal ["FirstAidKit", 50];
_crate addItemCargoGlobal ["Toolkit", 50];


sleep 500;
};