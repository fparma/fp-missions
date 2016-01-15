//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: (AEF)Wolffy.au [CTB]
// Created: 20110315
// Modified: 20110926
// Contact: http://dev-heaven.net/projects/mip
// Purpose: Setup amibent civilian module
///////////////////////////////////////////////////////////////////
if(!isServer) exitWith{};

[] spawn {

waitUntil{!isNil "BIS_fnc_init"};
waitUntil{!isNil "BIS_alice_mainscope"};

// Override default BIS_ALICE2_fnc_civilianSet function with MIP patch
// - Fixed issues with units spawning on roofs in Chernarus
// - Fixed some typos
// - Added bis_alice_emptydoor code for A2 building compatibility
// - Reduced default AI skill for less CPU
// - Changed unit speed to LIMITED
BIS_ALICE2_fnc_civilianSet = compile preprocessFileLineNumbers "ca\modules_e\alice2\data\scripts\fn_civilianSet.sqf";

// See http://community.bistudio.com/wiki/Ambient_Civilians
// BIS_alice_mainscope setVariable ["debug", true, true];

// ==================== EDIT THIS STUFF BELOW! ======================= //

BIS_alice_mainscope setvariable ["trafficDistance",1300, true];
BIS_alice_mainscope setvariable ["spawnDistance",800, true]; 
BIS_alice_mainscope setVariable ["civilianCount","round (0.9 * (sqrt %1))"]; 
[] spawn compile preprocessFileLineNumbers "scripts\ALICE2_houseEffects.sqf"; //if you want smoke from chimneys etc.

//Choose one of these.
//BIS_alice_mainscope setVariable ["townsFaction",["BIS_TK_CIV"],true];	 //Takistani civilians
//BIS_alice_mainscope setVariable ["townsFaction",["CIV","CIV_RU"]];  //Russian civilians


// list of places where civilians will be spawned. Can be location logic (created by BIS_fnc_locations), array in format [center,distance] or trigger. 
// BIS_alice_mainscope setVariable ["townlist",[bis_loc_acityc_mogilevka,[position this,3000],trigger1]]; 

// Changing civilian rarity numbers (e.g. to have villagers spawned in cities, or to disable spawning of given class completely with unusual number like 10). Default rarity numbers are set in config under rarityUrban value (in range from 0/village to 1/city) 
// BIS_alice_mainscope setVariable ["vehicleRarity",["Citizen1",10,"Worker2",0.8]]; 

// ===================================================================== //

// list of action categories from CfgCivilianActions 
// BIS_alice_mainscope setVariable ["civilianActions",["BIS"]];

// Artificial coeficient to set how much will be town's respect decreased once some civilian is hit or killed.
// The higher the number is, the more is respect towards killer's faction decreased. 
// BIS_alice_mainscope setVariable ["respectModifyCoef",0.15]; 
BIS_alice_mainscope setvariable ["respectModifyCoef", 0.3, true]; 

// Value which is removed from town threat every 5 seconds (until threat reaches 0) 
// BIS_alice_mainscope setVariable ["threatDecay",0.07 ];
BIS_alice_mainscope setvariable ["threatDecay", 0.05, true];

// array of codes which is executed upon every civilian unit created. 
// [BIS_alice_mainscope,"ALICE_civilianinit",[{_this addweapon "Mk_48"}]] call bis_fnc_variablespaceadd; 
// Dumb down civilian units to use less CPU (see http://creobellum.org/node/175)
[BIS_alice_mainscope,"ALICE_civilianinit",[
        {_this setSkill 0},
        {
 {_this disableAI _x} count ["AUTOTARGET","TARGET"]
        },
        {removeAllWeapons _this},
        {removeAllItems _this},
        {
		if (random 1 > 0.1) then {
			_this setSkill 0.2;
			{_this enableAI _x} count ["AUTOTARGET","TARGET"];
			_this addMagazine "HandGrenade_Stone";
			_this addMagazine "HandGrenade_Stone";
			_this addMagazine "HandGrenade_Stone";
			_this addMagazine "HandGrenade_Stone";
			_this addMagazine "HandGrenade_Stone";
			_this addMagazine "HandGrenade_Stone";
			_this addMagazine "HandGrenade_Stone";
			_this addMagazine "HandGrenade_Stone";
//			if(!("Throw" in weapons _this)) then {_this addWeapon "Throw";};
		};
 if (random 1 > 0.95 && (_this isKindOf "Woman_EP1" || _this isKindOf "Woman")) then {
			_this setSkill 0.1;
			{_this enableAI _x} count ["AUTOTARGET","TARGET"];
         if (random 1 > 0.5) then {
  _this addMagazine "8Rnd_9x18_Makarov";
  _this addMagazine "8Rnd_9x18_Makarov";
  _this addWeapon "Makarov";
         } else {
  _this addMagazine "6Rnd_45ACP";
  _this addMagazine "6Rnd_45ACP";
  _this addWeapon "revolver_EP1";
         };
 };
        }

]] call BIS_fnc_variableSpaceAdd;

};