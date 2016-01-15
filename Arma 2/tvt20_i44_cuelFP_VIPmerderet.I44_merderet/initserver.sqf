if (!isServer) exitWith {};
takeDocument = false;
vipDead = false;

clearWeaponCargoGlobal ammobox;
clearMagazineCargoGlobal ammobox;

ammobox addWeaponCargoGlobal ["I44_M1A1Bazooka", 2];
ammobox addMagazineCargoGlobal ["I44_Rocket_60mm_M6A1_M1A1Bazooka", 4];
ammobox addWeaponCargoGlobal ["I44_BrenMk1", 2];
ammobox addMagazineCargoGlobal ["I44_30rd_77x56R_Ball_Bren", 6];
ammobox addWeaponCargoGlobal ["I44_M1911A1", 6];
ammobox addMagazineCargoGlobal ["I44_7rd_1143x23_Ball_M1911", 20];
ammobox addWeaponCargoGlobal ["I44_WebleyMk6", 6];
ammobox addMagazineCargoGlobal ["I44_6rd_12x20R_Ball_WebleyMk6", 20];
ammobox addWeaponCargoGlobal ["I44_DeLisleCarbine", 4];
ammobox addMagazineCargoGlobal ["I44_7rd_1143x23_Ball_DeLisle", 20];
ammobox addWeaponCargoGlobal ["I44_LeeEnfield", 6];
ammobox addMagazineCargoGlobal ["I44_10rd_77x56R_Ball_LeeEnfield", 40];
ammobox addWeaponCargoGlobal ["I44_M1A1Carbine", 6];
ammobox addMagazineCargoGlobal ["I44_15rd_762x33_Ball_M1Carbine", 40];
ammobox addWeaponCargoGlobal ["I44_M1Garand", 6];
ammobox addMagazineCargoGlobal ["I44_8rd_762x63_Ball_M1Garand", 40];
ammobox addMagazineCargoGlobal ["I44_8rd_762x63_AP_M1Garand", 40];
ammobox addWeaponCargoGlobal ["I44_M1903A4", 2];
ammobox addMagazineCargoGlobal ["I44_5rd_762x63_Ball_M1903", 6];
ammobox addWeaponCargoGlobal ["I44_M37Ithaca", 4];
ammobox addMagazineCargoGlobal ["I44_4xM19_12ga_00Buckshot_M37", 10];
ammobox addWeaponCargoGlobal ["I44_M1A1Thompson", 4];
ammobox addMagazineCargoGlobal ["I44_30rd_1143x23_Ball_M1A1Thompson", 20];
ammobox addWeaponCargoGlobal ["I44_M3Greasegun", 4];
ammobox addMagazineCargoGlobal ["I44_30rd_1143x23_Ball_M3Greasegun", 20];
ammobox addWeaponCargoGlobal ["I44_StenMk2S", 3];
ammobox addMagazineCargoGlobal ["I44_32rd_9x19_Ball_Sten", 10];
ammobox addMagazineCargoGlobal ["I44_Mine_AT_GrenadeNo75", 3];
ammobox addMagazineCargoGlobal ["I44_HandGrenade_No82", 6];
ammobox addMagazineCargoGlobal ["I44_SmokeGrenade_M18Green", 10];


sleep 1;


 [] spawn {
while {!takeDocument} do {sleep 5;}; 
["viptaskdocument", "succeeded"] call SHK_Taskmaster_upd;
removeMarker = "killvipdocument"; publicVariable "removeMarker";
};


[]spawn {
	while {!vipDead} do {sleep 2};
		["killviptask", "succeeded"] call SHK_Taskmaster_upd;
		[nil,nil,"per",rTitleCut,"The VIP has been assassinated.", "BLACK", 6] call RE;
		sleep 5;
		[nil,nil,"per",rENDMISSION,"END1"] call RE;
};

[]spawn {
while {!("viptaskbosson" call SHK_Taskmaster_isCompleted) || !("viptaskdocument" call SHK_Taskmaster_isCompleted) || !("viptaskmorale" call SHK_Taskmaster_isCompleted) || !("viptaskcheckpoint" call SHK_Taskmaster_isCompleted) || !("viptaskconvoy" call SHK_Taskmaster_isCompleted) || !("viptaskfriend" call SHK_Taskmaster_isCompleted)} do {sleep 10};
[nil,nil,"per",rTitleCut,"All VIP objectives completed!", "BLACK", 6] call RE;sleep 5; [nil,nil,"per",rENDMISSION,"END2"] call RE; 
};














