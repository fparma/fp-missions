/*
    Initializes the player
*/
"respawn_west" setMarkerAlphaLocal 0;
"drive" setMarkerAlphaLocal 0;

// Custom ares funcs
if (isClass (configFile >> "CfgPatches" >> "Ares")) then {
	[] call compile preprocessFileLineNumbers "base\scripts\ares\init.sqf";
};

// Respawn with gear, is set by fn_getKit
FP_kit_type = player getVariable ["FP_kit_type", []];
player addEventHandler ["Respawn", {

	// Add new unit to zeus
	[_this select 0] remoteExecCall ["FP_fnc_addToCurators", 2];

	// Respawn with gear if using template gear
	if (count FP_kit_type > 0) then {
    if ((FP_kit_type  select 0) == "CREW") then {FP_kit_type set [0, "RIFLEMAN"]};
		[_this select 0, FP_kit_type select 0, FP_kit_type select 1] call FP_fnc_getKit;
	};

  (format ["%1 died - total : %2", name player, count (call FP_JRM_fnc_getSpectators)]) remoteExecCall ["systemChat", missionNamespace getVariable ["gm", objNull]];
}];

// Fix so player can't join "ENEMY" side
player addEventHandler ["HandleRating", {
    abs (_this select 1);
}];

// Delete grenades thrown in spawn
player addEventHandler ["Fired", {
	if (_this select 2 == "HandGrenadeMuzzle") then {
		private _proj = param [6, objNull];
		private _idx = [blufor, opfor, independent, civilian] find side player;
		private _mrk = markerPos (["respawn_west","respawn_east","respawn_guerrila","respawn_civilian"] select _idx);
		if ((_this select 0) distance _mrk < 80) then {
			[_proj] call ace_frag_fnc_addBlackList;
			deleteVehicle _proj;
			titleText ["G IS FOR GRENADES", "PLAIN", 2];
		};
	};
}];

// Longer view distance for pilots
if (player in ([FP_pilots, false, true] call ACE_common_fnc_parseList)) then {
	[] call compile preProcessFileLineNumbers "base\scripts\dynamic_vd.sqf";
};

// Init jip and respawn manager. Edit in config.sqf
if (!isServer &&  {!isNil "FP_JRM_fnc_init"}) then {
	[] call FP_JRM_fnc_init;
};

[{
  // Initialize cold start (edit with config.sqf)
  [] call FP_fnc_coldStart;

  // Lower weapon after mission start
  if (primaryWeapon player != "") then {
    player switchMove "amovpercmstpslowwrfldnon";
  };

  // Assign team colors to units
  if (leader group player == player) then {
      private _units = ((units group player) - [player]);
      player assignTeam "GREEN";
      if (count _units >= 3) then {
          private _cnt = floor ((count _units) / 2);
          {
              _x assignTeam (["RED", "BLUE"] select (_forEachIndex < _cnt));
          } forEach _units;
      };
  };
	}, []] call ACE_common_fnc_execNextFrame;


// monkey patch ace markers temporarly to show messages during briefing
if (time > 0) exitWith {};
[] call compile preProcessFileLineNumbers "base\scripts\log_ace_markers.sqf";
