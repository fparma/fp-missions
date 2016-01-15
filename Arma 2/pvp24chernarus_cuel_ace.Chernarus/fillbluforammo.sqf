if (!isServer) exitWith {};
private ["_amountWeapon","_amountAmmo"];
_amountWeapon = 4;
_amountAmmo = 10;

// Clear box
clearWeaponCargoGlobal _this;
clearMagazineCargoGlobal _this;


//weapons
	//west
		//rifles
			//m16
			_this addWeaponCargoGlobal["M16A2",_amountWeapon];
			_this addWeaponCargoGlobal["M16A2GL",_amountWeapon];
			_this addWeaponCargoGlobal["M16A4",_amountWeapon];
			_this addWeaponCargoGlobal["M16A4_GL",_amountWeapon];
			_this addWeaponCargoGlobal["M16A4_ACG",_amountWeapon];
			_this addWeaponCargoGlobal["M16A4_ACG_GL",_amountWeapon];

			//m4
			_this addWeaponCargoGlobal["M4A1",_amountWeapon];
			_this addWeaponCargoGlobal["M4A1_AIM",_amountWeapon];
			_this addWeaponCargoGlobal["M4A1_AIM_CAMO",_amountWeapon];
			_this addWeaponCargoGlobal["M4A1_AIM_SD_CAMO",_amountWeapon];
			_this addWeaponCargoGlobal["M4A1_HWS_GL",_amountWeapon];
			_this addWeaponCargoGlobal["M4A1_HWS_GL_CAMO",_amountWeapon];
			_this addWeaponCargoGlobal["M4A1_HWS_GL_SD_CAMO",_amountWeapon];
			_this addWeaponCargoGlobal["M4A1_RCO_GL",_amountWeapon];

			//other
			_this addWeaponCargoGlobal["M8_CARBINE",_amountWeapon];
			_this addWeaponCargoGlobal["M8_CARBINEGL",_amountWeapon];
			_this addWeaponCargoGlobal["M8_COMPACT",_amountWeapon];
			_this addWeaponCargoGlobal["G36A",_amountWeapon];
			_this addWeaponCargoGlobal["G36K",_amountWeapon];
			_this addWeaponCargoGlobal["G36C",_amountWeapon];
			_this addWeaponCargoGlobal["G36_C_SD_EOTECH",_amountWeapon];

			//sniper rifles
			_this addWeaponCargoGlobal["M4SPR",1];
			_this addWeaponCargoGlobal["M8_SHARPSHOOTER",_amountWeapon];
			_this addWeaponCargoGlobal["M40A3",1];
			_this addWeaponCargoGlobal["M107",1];

			//machineguns
			_this addWeaponCargoGlobal["M8_SAW",_amountWeapon];
			_this addWeaponCargoGlobal["MG36",_amountWeapon];
			_this addWeaponCargoGlobal["M249",_amountWeapon];
			_this addWeaponCargoGlobal["M240",_amountWeapon];
			_this addWeaponCargoGlobal["MK_48",_amountWeapon];

			//submachineguns
			_this addWeaponCargoGlobal["MP5A5",_amountWeapon];
			_this addWeaponCargoGlobal["MP5SD",_amountWeapon];

			//shotguns
			_this addWeaponCargoGlobal["M1014",_amountWeapon];

			//pistols
			_this addWeaponCargoGlobal["COLT1911",_amountWeapon];
			_this addWeaponCargoGlobal["M9",_amountWeapon];
			_this addWeaponCargoGlobal["M9SD",_amountWeapon];

			//launchers
			_this addWeaponCargoGlobal["M136",2];
			_this addWeaponCargoGlobal["SMAW",1];

	//magazines
		//west
			//rifles
			_this addMagazineCargoGlobal["30RND_556X45_STANAG",50];
			_this addMagazineCargoGlobal["30RND_556X45_STANAGSD",50];
			_this addMagazineCargoGlobal["30RND_556X45_G36",50];
			_this addMagazineCargoGlobal["30RND_556X45_G36SD",50];

			//under-barrel grenade launchers
			_this addMagazineCargoGlobal["1RND_HE_M203",_amountAmmo];
			_this addMagazineCargoGlobal["FLAREWHITE_M203",_amountAmmo];
			_this addMagazineCargoGlobal["FLAREGREEN_M203",_amountAmmo];
			_this addMagazineCargoGlobal["FLARERED_M203",_amountAmmo];
			_this addMagazineCargoGlobal["FLAREYELLOW_M203",_amountAmmo];
			_this addMagazineCargoGlobal["1RND_SMOKE_M203",_amountAmmo];
			_this addMagazineCargoGlobal["1RND_SMOKEGREEN_M203",_amountAmmo];
			_this addMagazineCargoGlobal["1RND_SMOKERED_M203",_amountAmmo];
			_this addMagazineCargoGlobal["1RND_SMOKEYELLOW_M203",_amountAmmo];

			//sniper rifles
			_this addMagazineCargoGlobal["20RND_556X45_STANAG",50];
			_this addMagazineCargoGlobal["20RND_762X51_DMR",_amountAmmo];
			_this addMagazineCargoGlobal["5RND_762X51_M24",_amountAmmo];
			_this addMagazineCargoGlobal["10RND_127X99_M107",_amountAmmo];

			//machineguns
			_this addMagazineCargoGlobal["100RND_556X45_BETACMAG",_amountAmmo];
			_this addMagazineCargoGlobal["200RND_556X45_M249",20];
			_this addMagazineCargoGlobal["ACE_200RND_556X45_T_M249",_amountAmmo];
			_this addMagazineCargoGlobal["100RND_762X51_M240",20];

			//submachineguns
			_this addMagazineCargoGlobal["30RND_9X19_MP5",50];
			_this addMagazineCargoGlobal["30RND_9X19_MP5SD",_amountAmmo];

			//shotguns
			_this addMagazineCargoGlobal["8RND_B_BENELI_74SLUG",_amountAmmo];

			//pistols
			_this addMagazineCargoGlobal["7RND_45ACP_1911",_amountAmmo];
			_this addMagazineCargoGlobal["15RND_9X19_M9",_amountAmmo];
			_this addMagazineCargoGlobal["15RND_9X19_M9SD",_amountAmmo];

			//launchers
			_this addMagazineCargoGlobal["SMAW_HEAA",3];
			_this addMagazineCargoGlobal["SMAW_HEDP",3];
			
			//grenades
			_this addMagazineCargoGlobal["HANDGRENADE_WEST",50];
			_this addMagazineCargoGlobal["SMOKESHELL",50];
			_this addMagazineCargoGlobal["SMOKESHELLGREEN",50];
			_this addMagazineCargoGlobal["SMOKESHELLRED",50];
			_this addMagazineCargoGlobal["SMOKESHELLYELLOW",50];
			
			//bombs
			_this addMagazineCargoGlobal["MINE",5];
			_this addMagazineCargoGlobal["PIPEBOMB",5];
			
		//stuff
			_this addWeaponCargoGlobal["ACE_GLASSESSPECTACLES",50];
			_this addWeaponCargoGlobal["ACE_GLASSESROUNDGLASSES",50];
			_this addWeaponCargoGlobal["ACE_GLASSESSUNGLASSES",50];
			_this addWeaponCargoGlobal["ACE_GLASSESBLACKSUN",50];
			_this addWeaponCargoGlobal["ACE_GLASSESBLUESUN",50];
			_this addWeaponCargoGlobal["ACE_GLASSESREDSUN",50];
			_this addWeaponCargoGlobal["ACE_GLASSESGREENSUN",50];
			_this addWeaponCargoGlobal["ACE_GLASSESLHD_GLASSES",50];
			_this addWeaponCargoGlobal["ACE_GLASSESTACTICAL",50];
			_this addWeaponCargoGlobal["ACE_EARPLUGS",50];
			_this addWeaponCargoGlobal["ACE_GLASSESGASMASK_US",50];
			_this addWeaponCargoGlobal["ACE_GLASSESBALAKLAVA",50];