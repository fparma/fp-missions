if (!isServer) exitWith {};
private ["_amountWeapon","_amountAmmo"];
_amountWeapon = 4;
_amountAmmo = 10;

// Clear box
clearWeaponCargoGlobal _this;
clearMagazineCargoGlobal _this;

			_this addWeaponCargoGlobal["AK_47_M",_amountWeapon];
			_this addWeaponCargoGlobal["AK_47_S",_amountWeapon];
			_this addWeaponCargoGlobal["AKS_GOLD",_amountWeapon];

			//ak-74
			_this addWeaponCargoGlobal["AK_74",_amountWeapon];
			_this addWeaponCargoGlobal["AK_74_GL",_amountWeapon];
			_this addWeaponCargoGlobal["AKS_74_KOBRA",_amountWeapon];
			_this addWeaponCargoGlobal["AKS_74_U",_amountWeapon];
			_this addWeaponCargoGlobal["AKS_74_UN_KOBRA",_amountWeapon];

			//ak-107
			_this addWeaponCargoGlobal["AK_107_KOBRA",_amountWeapon];
			_this addWeaponCargoGlobal["AK_107_GL_KOBRA",_amountWeapon];
			_this addWeaponCargoGlobal["AK_107_PSO",_amountWeapon];
			_this addWeaponCargoGlobal["AK_107_GL_PSO",_amountWeapon];

			//sniper rifles
			_this addWeaponCargoGlobal["HUNTINGRIFLE",2];
			_this addWeaponCargoGlobal["VSS_VINTOREZ",1];
			_this addWeaponCargoGlobal["SVD",1];
			_this addWeaponCargoGlobal["KSVK",1];

			//machineguns
			_this addWeaponCargoGlobal["RPK_74",_amountWeapon];
			_this addWeaponCargoGlobal["PK",_amountWeapon];
			_this addWeaponCargoGlobal["PECHENEG",_amountWeapon];

			//submachineguns
			_this addWeaponCargoGlobal["BIZON",_amountWeapon];
			_this addWeaponCargoGlobal["BIZON_SILENCED",_amountWeapon];

			//shotguns
			_this addWeaponCargoGlobal["SAIGA12K",_amountWeapon];

			//pistols
			_this addWeaponCargoGlobal["MAKAROV",_amountWeapon];
			_this addWeaponCargoGlobal["MAKAROVSD",_amountWeapon];

			//launchers
			_this addWeaponCargoGlobal["RPG7V",2];
			_this addWeaponCargoGlobal["METISLAUNCHER",1];

	//magazines
			//east
			//rifles
			_this addMagazineCargoGlobal["30RND_762X39_AK47",50];
			_this addMagazineCargoGlobal["30RND_545X39_AK",50];
			_this addMagazineCargoGlobal["30RND_545X39_AKSD",50];

			//under-barrel grenade launchers
			_this addMagazineCargoGlobal["1RND_HE_GP25",_amountAmmo];
			_this addMagazineCargoGlobal["FLAREWHITE_GP25",_amountAmmo];
			_this addMagazineCargoGlobal["FLAREGREEN_GP25",_amountAmmo];
			_this addMagazineCargoGlobal["FLARERED_GP25",_amountAmmo];
			_this addMagazineCargoGlobal["FLAREYELLOW_GP25",_amountAmmo];
			_this addMagazineCargoGlobal["1RND_SMOKE_GP25",_amountAmmo];
			_this addMagazineCargoGlobal["1RND_SMOKEGREEN_GP25",_amountAmmo];
			_this addMagazineCargoGlobal["1RND_SMOKERED_GP25",_amountAmmo];
			_this addMagazineCargoGlobal["1RND_SMOKEYELLOW_GP25",_amountAmmo];

			//sniper rifles
			_this addMagazineCargoGlobal["5X_22_LR_17_HMR",_amountAmmo];
			_this addMagazineCargoGlobal["10RND_9X39_SP5_VSS",_amountAmmo];
			_this addMagazineCargoGlobal["20RND_9X39_SP5_VSS",_amountAmmo];
			_this addMagazineCargoGlobal["10RND_762X54_SVD",_amountAmmo];
			_this addMagazineCargoGlobal["5RND_127X108_KSVK",_amountAmmo];

			//machineguns
			_this addMagazineCargoGlobal["75RND_545X39_RPK",50];
			_this addMagazineCargoGlobal["100RND_762X54_PK",50];

			//submachineguns
			_this addMagazineCargoGlobal["64RND_9X19_BIZON",_amountAmmo];
			_this addMagazineCargoGlobal["64RND_9X19_SD_BIZON",_amountAmmo];

			//shotguns
			_this addMagazineCargoGlobal["8RND_B_SAIGA12_74SLUG",_amountAmmo];

			//pistols
			_this addMagazineCargoGlobal["8RND_9X18_MAKAROV",_amountAmmo];
			_this addMagazineCargoGlobal["8RND_9X18_MAKAROVSD",_amountAmmo];

			//launchers
			_this addMagazineCargoGlobal["PG7V",2];
			_this addMagazineCargoGlobal["PG7VL",2];
			_this addMagazineCargoGlobal["PG7VR",2];
			_this addMagazineCargoGlobal["OG7",3];
			_this addMagazineCargoGlobal["AT13",3];

			//grenades
			_this addMagazineCargoGlobal["HANDGRENADE_EAST",50];
			_this addMagazineCargoGlobal["SMOKESHELLPURPLE",50];
			_this addMagazineCargoGlobal["SMOKESHELLBLUE",50];
			_this addMagazineCargoGlobal["SMOKESHELLORANGE",50];
			
			//bombs
			_this addMagazineCargoGlobal["MINE",5];
			_this addMagazineCargoGlobal["PIPEBOMB",5];
			
			//west
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
			_this addWeaponCargoGlobal["ACE_GLASSESBALAKLAVA",50];
			
			//east
			_this addWeaponCargoGlobal["ACE_GLASSESGASMASK_RU",50];
