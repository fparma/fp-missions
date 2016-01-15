if (!isServer) exitWith {};
sleep 1;

// create ambient civilian life
[cuel_ambient_civs] execVM "civilians\init.sqf";


removeMarker = "";

[] spawn {
while {!investigateFOB} do {sleep 10;}; 
["viptaskpista", "succeeded"] call SHK_Taskmaster_upd;
removeMarker = "killvippista"; publicVariable "removeMarker";
};

[] spawn {
while {!stayBarro} do {sleep 10;}; 
["viptaskbarro", "succeeded"] call SHK_Taskmaster_upd;
removeMarker = "killvipbarro"; publicVariable "removeMarker";
};

[] spawn {
while {!buyWeapons} do {sleep 10;}; 
["viptaskeddie", "succeeded"] call SHK_Taskmaster_upd;
buyweaponsbox addWeaponCargoGlobal ["M4A3_RCO_GL_EP1", 5]; buyweaponsbox addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 15];
buyweaponsbox addWeaponCargoGlobal ["M4A3_CCO_EP1", 5]; buyweaponsbox addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 15];
buyweaponsbox addWeaponCargoGlobal ["SCAR_H_CQC_CCO", 5]; buyweaponsbox addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR", 15];
buyweaponsbox addMagazineCargoGlobal ["HandGrenade_West", 10];
buyweaponsbox addMagazineCargoGlobal ["1Rnd_HE_M203", 6];
removeMarker = "killvipeddie"; publicVariable "removeMarker";
};
 
[] spawn {
while {!donateMoney} do {sleep 10;}; 
sleep 5;
["viptasklab", "succeeded"] call SHK_Taskmaster_upd;
removeMarker = "killviplab"; publicVariable "removeMarker";
}; 
 
[] spawn {
while {!buyDrugs} do {sleep 10;}; 
["viptaskplant", "succeeded"] call SHK_Taskmaster_upd;
removeMarker = "killvipplant"; publicVariable "removeMarker";
}; 

 [] spawn {
while {!visitPresident && alive president} do {sleep 10;}; 
if (alive president) then {
	["viptaskpresident", "succeeded"] call SHK_Taskmaster_upd;
}else {
	["viptaskpresident", "canceled"] call SHK_Taskmaster_upd;
	[nil, nil, rHINT, "The president was assassinated"]call RE;
};
visitPresident = true; publicVariable "visitPresident";
removeMarker = "killvippresident"; publicVariable "removeMarker";
};

[] spawn {
while {!getDrunk} do {sleep 10;}; 
["viptaskcoconut", "succeeded"] call SHK_Taskmaster_upd;
removeMarker = "killvipcoconut"; publicVariable "removeMarker";
};

 [] spawn {
while {!compareLab} do {sleep 10;}; 
["viptaskmillab", "succeeded"] call SHK_Taskmaster_upd;
removeMarker = "killvipmillab"; publicVariable "removeMarker";
};
[]spawn {
while {!investigateFOB || !stayBarro || !buyWeapons || !donateMoney || !buyDrugs || !visitPresident || !getDrunk || !compareLab} do {sleep 10};
[nil,nil,"per",rTitleCut,"All VIP objectives completed!", "BLACK", 6] call RE;sleep 5; [nil,nil,"per",rENDMISSION,"END1"] call RE; 
};

[]spawn {
	while {!vipDead} do {sleep 2};
		["killviptask", "succeeded"] call SHK_Taskmaster_upd;
		[nil,nil,"per",rTitleCut,"The VIP has been assassinated.", "BLACK", 6] call RE;
		sleep 5;
		[nil,nil,"per",rENDMISSION,"END1"] call RE;
};


