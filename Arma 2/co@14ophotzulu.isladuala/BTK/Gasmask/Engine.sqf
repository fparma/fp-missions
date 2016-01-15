/*******************************************************************
*
*    __| _ \ __|   \__ __| __| _ \    _ )\ \  /   _ )__ __| |  /
*   (      / _|   _ \  |   _|  |  |   _ \ \  /    _ \   |   . < 
*  \___|_|_\___|_/  _\_|  ___|___/   ___/  _|    ___/  _|  _|\_\
*
*
*  Gasmask engine.
*
*******************************************************************/


// ---- Initialized?
if (isNil "BTK_GasmaskInit") then { waitUntil {!(isNil "BTK_GasmaskInit")}; };


// ---- Check for mask
[] spawn {
	while {true} do {
		sleep 5;
		if (((player getVariable "ACE_Identity") == "ACE_GlassesGasMask_RU") || ((player getVariable "ACE_Identity") == "ACE_GlassesGasMask_US")) then {
 			player setVariable ["BTK_GasmaskUnsafe", false];
		} else {
			player setVariable ["BTK_GasmaskUnsafe", true];
		};
	};
};


// ---- Check for areas
[] spawn {
	while {true} do {
		sleep 5;
		if ((player distance BTK_Gasmask_Area1 < BTK_Gasmask_Area1Radius) || (player distance BTK_Gasmask_Area2 < BTK_Gasmask_Area2Radius) || (player distance BTK_Gasmask_Area3 < BTK_Gasmask_Area3Radius) || (player distance BTK_Gasmask_Area4 < BTK_Gasmask_Area4Radius) || (player distance BTK_Gasmask_Area5 < BTK_Gasmask_Area5Radius)) then {
			_RadiationArea = player setVariable ["BTK_GasmaskArea", true];
		} else {
			_RadiationArea = player setVariable ["BTK_GasmaskArea", false];
		};
	};
};


// ---- Check for radiation
[] spawn {
	while {true} do {
		sleep 5;
		if ((player getVariable "BTK_GasmaskUnsafe") && (player getVariable "BTK_GasmaskArea")) then {
			player setVariable ["BTK_GasmaskRadiation", true];
		};

		if (!(player getVariable "BTK_GasmaskUnsafe") || !(player getVariable "BTK_GasmaskArea")) then {
			player setVariable ["BTK_GasmaskRadiation", false];
		};
	};
};


// ---- FX and damage while radiation
[] spawn {
_c = 0;
	while {true} do {
		sleep 5;
		_Damage = getDammage player;
		if (!(player getVariable "BTK_GasmaskRadiation")) then {
			sleep 10;
		} else {
			// ---- Create FX
			if (BTK_Gasmask_EnableFX == 1) then {
				[] spawn {
					"dynamicBlur" ppEffectEnable true;
					"dynamicBlur" ppEffectAdjust [0];
					"dynamicBlur" ppEffectCommit 5;
					"dynamicBlur" ppEffectAdjust [5];
					"dynamicBlur" ppEffectCommit 10;
					"dynamicBlur" ppEffectAdjust [5];
					"dynamicBlur" ppEffectCommit 10;
					sleep 15;
					"dynamicBlur" ppEffectAdjust [0];
					"dynamicBlur" ppEffectCommit 10;
				};
				[] spawn {
					sleep 14;
					titleText [" ", "Black Out"];
					sleep 1;
					titleText [" ", "Black In"]; titleFadeOut 1;
				};
				[] spawn {
					_PPRadi = ppEffectCreate ["colorCorrections", 1503];
					_PPRadi ppEffectEnable true;
					_PPRadi ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0]];
					_PPRadi ppEffectCommit 5;
					sleep 5;
					_PPRadi ppEffectAdjust [0.162415, 0.209184, 0, [0.123299, 0.590986, 0.148809, 0.161564], [0, 1, 0, 0], [1, 1, 1, 1]]; 
					_PPRadi ppEffectCommit 10;
					sleep 10;
					_PPRadi ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0]];
					_PPRadi ppEffectCommit 10;
					sleep 15;
					ppEffectDestroy _PPRadi;
				};
				[] spawn {
					_PPRadiGrain = ppEffectCreate ["filmGrain", 2005];
					_PPRadiGrain ppEffectEnable true;
					_PPRadiGrain ppEffectAdjust [0.1, 9, 0.4, 0.5, 0.7];
					_PPRadiGrain ppEffectCommit 0;
					sleep 5;
					_PPRadiGrain ppEffectEnable true;
					_PPRadiGrain ppEffectAdjust [0.2, 9, 0.2, 0.25, 0.35];
					_PPRadiGrain ppEffectCommit 0;
					sleep 10;
					_PPRadiGrain ppEffectAdjust [0, 0, 0, 0, 0];
					_PPRadiGrain ppEffectCommit 10;
					sleep 10;
					_PPRadiGrain ppEffectEnable false;
				};
			};
			sleep 2;
			if (BTK_Gasmask_EnableSound == 1) then { playSound "BTK_Gasmask_Geiger"; };
			sleep 8;
			if (_c != 0) then {
			player setDamage (getDammage player) + BTK_Gasmask_Damage;
			};
			_c = _c+1;
		};
		sleep BTK_Gasmask_DamageInterval;
	};
};


// ---- BIS_Hint - NOT protected
[] spawn {
	if (BTK_Gasmask_EnableHints == 1) then {
		while {true} do {
			sleep 5;
			if ((player getVariable "BTK_GasmaskRadiation") && (player getVariable "BTK_GasmaskArea")) then {
				[] spawn {
					[] call bis_fnc_hints;
					[] call BIS_AdvHints_setDefaults;
					[] spawn {
						BIS_AdvHints_THeader = BTK_Gasmask_HintHeader;
						BIS_AdvHints_TInfo = BTK_Gasmask_HintUnProtectedInfo;
						BIS_AdvHints_TImp = BTK_Gasmask_HintUnProtectedImp;
						BIS_AdvHints_TAction = BTK_Gasmask_HintUnProtectedAxn;
						BIS_AdvHints_TBinds = BTK_Gasmask_HintUnProtectedBnd;
						BIS_AdvHints_Text = call BIS_AdvHints_formatText;
						BIS_AdvHints_Duration = BTK_Gasmask_HintDuration;
						BIS_AdvHints_HideCode = "hintSilent '';";
						call BIS_AdvHints_showHint
					};
				};
				
				waitUntil {!(player getVariable "BTK_GasmaskRadiation") || !(player getVariable "BTK_GasmaskArea")};
			};
		};
	};
};


// ---- BIS_Hint - protected
[] spawn {
	if (BTK_Gasmask_EnableHints == 1) then {
		while {true} do {
			sleep 5;
			if (!(player getVariable "BTK_GasmaskRadiation") && (player getVariable "BTK_GasmaskArea")) then {
				[] spawn {
					[] call bis_fnc_hints;
					[] call BIS_AdvHints_setDefaults;
					[] spawn {
						BIS_AdvHints_THeader = BTK_Gasmask_HintHeader;
						BIS_AdvHints_TInfo = BTK_Gasmask_HintProtectedInfo;
						BIS_AdvHints_TImp = BTK_Gasmask_HintProtectedImp;
						BIS_AdvHints_TAction = BTK_Gasmask_HintProtectedAxn;
						BIS_AdvHints_TBinds = BTK_Gasmask_HintProtectedBnd;
						BIS_AdvHints_Text = call BIS_AdvHints_formatText;
						BIS_AdvHints_Duration = BTK_Gasmask_HintDuration;
						BIS_AdvHints_HideCode = "hintSilent '';";
						call BIS_AdvHints_showHint
					};
				};
				
				waitUntil {(player getVariable "BTK_GasmaskRadiation") || !(player getVariable "BTK_GasmaskArea")};
			};
		};
	};
};