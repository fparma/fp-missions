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

_veh addItemCargoGlobal ["CUP_10x_303_M",100];
_veh addMagazineCargoGlobal ["sfp_36Rnd_9mm_kpistm45",100];
_veh addMagazineCargoGlobal ["CUP_50Rnd_UK59_762x54R_Tracer",100];
_veh addMagazineCargoGlobal ["CUP_30Rnd_Sa58_M",100];
_veh addMagazineCargoGlobal ["CUP_30Rnd_Sa58_M_TracerG",100];