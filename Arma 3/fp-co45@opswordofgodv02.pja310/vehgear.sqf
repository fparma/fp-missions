_veh = _this select 0;

clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearItemCargoGlobal _veh;

_veh addItemCargoGlobal ["ACE_fieldDressing",50];
_veh addItemCargoGlobal ["ACE_epinephrine",50];
_veh addItemCargoGlobal ["ACE_morphine",50];
_veh addItemCargoGlobal ["ACE_bloodIV_250",50];
_veh addItemCargoGlobal ["ACE_bloodIV_500",50];
_veh addItemCargoGlobal ["ACE_bloodIV",50];
_veh addItemCargoGlobal ["ACE_bodyBag",10];

_veh addItemCargoGlobal ["rhs_weap_akms",10];
_veh addMagazineCargoGlobal ["rhs_30Rnd_762x39mm",100];
_veh addMagazineCargoGlobal ["hlc_75Rnd_762x39_m_rpk",100];
_veh addMagazineCargoGlobal ["rhs_rpg7_PG7VL_mag",10];
_veh addMagazineCargoGlobal ["rhs_rpg7_OG7V_mag",10];