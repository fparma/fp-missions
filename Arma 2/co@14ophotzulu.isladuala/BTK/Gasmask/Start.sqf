/*******************************************************************
*
*    __| _ \ __|   \__ __| __| _ \    _ )\ \  /   _ )__ __| |  /
*   (      / _|   _ \  |   _|  |  |   _ \ \  /    _ \   |   . < 
*  \___|_|_\___|_/  _\_|  ___|___/   ___/  _|    ___/  _|  _|\_\
*
*
*  Setup and start the engine.
*
*******************************************************************/


// ---- SETTINGS
BTK_Gasmask_Damage = 0;           // - How many damage from conterminated air? (in %)
BTK_Gasmask_DamageInterval = 30;    // - Interval for the damage while not protected (in seconds)
BTK_Gasmask_EnableSound = 1;        // - Play sound? 1 = yes / 0 = no (Sound must be defined as BTK_Gasmask_Geiger in description.ext)
BTK_Gasmask_EnableFX = 1;           // - Enable visual effects while not protected? 1 = yes / 0 = no
BTK_Gasmask_EnableHints = 0;        // - Enable hints when entering a conterminated area?  1 = yes / 0 = no
BTK_Gasmask_GasmasksqfType = "ACE_GlassesGasMask_US";    // - Gasmask type for the add function (Gasmask.sqf)


// ---- SETTINGS (Hints)
BTK_Gasmask_HintDuration = 23;
BTK_Gasmask_HintHeader = "Radiation ";
BTK_Gasmask_HintProtectedInfo = "Breathing radiated air can be deadly.";
BTK_Gasmask_HintProtectedImp = "Your are <t color='#eaeaea'>protected</t>.";
BTK_Gasmask_HintProtectedAxn = "";
BTK_Gasmask_HintProtectedBnd = "";
BTK_Gasmask_HintUnProtectedInfo = "Breathing radiated air can be deadly.";
BTK_Gasmask_HintUnProtectedImp = "<t color='#eaeaea'>Warning!</t> Your are <t color='#eaeaea'>not protected</t>.";
BTK_Gasmask_HintUnProtectedAxn = "";
BTK_Gasmask_HintUnProtectedBnd = "Press <t color='#eaeaea'>(Right application key)</t> to equip your gasmask.";


// ---- SETTINGS (Conterminated areas)
BTK_Gasmask_Area1 = ContArea1;      // - Object (if not used, set to objNull)
BTK_Gasmask_Area1Radius = 80;       // - Radiation area around the object (in meter)
BTK_Gasmask_Area2 = objNull;        // - Object (if not used, set to objNull)
BTK_Gasmask_Area2Radius = 1;        // - Radiation area around the object (in meter)
BTK_Gasmask_Area3 = objNull;        // - Object (if not used, set to objNull)
BTK_Gasmask_Area3Radius = 1;        // - Radiation area around the object (in meter)
BTK_Gasmask_Area4 = objNull;        // - Object (if not used, set to objNull)
BTK_Gasmask_Area4Radius = 1;        // - Radiation area around the object (in meter)
BTK_Gasmask_Area5 = objNull;        // - Object (if not used, set to objNull)
BTK_Gasmask_Area5Radius = 1;        // - Radiation area around the object (in meter)


BTK_GasmaskInit = true;




// ---- Create variables once start engine and manage respawn
if (isDedicated) exitWith {};
player setVariable ["BTK_GasmaskRadiation", false];
player setVariable ["BTK_GasmaskUnsafe", false];
player setVariable ["BTK_GasmaskArea", false];
player setVariable ["ACE_Identity", "ACE_Original_Identity"];
sleep 1;
BTK = execVM "BTK\Gasmask\Engine.sqf";


// ---- Reset on respawn
[] spawn {
	while {true} do {
		sleep 5;
		waitUntil {!(alive player)};
		sleep 5;
		waitUntil {(alive player)};
		player setVariable ["BTK_GasmaskRadiation", false];
		player setVariable ["BTK_GasmaskUnsafe", true];
		player setVariable ["BTK_GasmaskArea", false];
		player setVariable ["ACE_Identity", "ACE_Original_Identity"];
	};
};