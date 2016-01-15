CUL_fnc_makeWinterUnit = {
	local _unit = _this select 0;
	if (!local _unit || {faction _unit != "FP_Faction_GSFG70"}) exitWith {};

	_items = uniformItems _unit;// + magazineCargo uniformContainer player;
	removeUniform _unit;
	_unit forceAddUniform "U_I_CombatUniform";
	[_unit, _items] call FP_fnc_addToContainers;
	if (isNull (unitBackpack _unit)) then {
		_unit addBackpack "RHS_sidor";
	};
	_unit setObjectTextureGlobal [0, "snowcamo.paa"];
};


["FP_doRespawn", {
	if (isServer) then {
		truck1 enableSimulationGlobal true;
		truck1 hideObjectGlobal false;
		truck2 enableSimulationGlobal true;
		truck2 hideObjectGlobal false;
	};

	if (ACE_spectator_isSet && hasInterface) then {
		["FP_screen"] call BIS_fnc_blackOut;
		[] spawn {
			sleep 4;
			[{
				[] spawn {
					sleep 2 + random 5;
					_truck = if (truck1 emptyPositions "cargo" == 0) then {truck2} else {truck1};
					player moveInCargo _truck;
					sleep 2;
					["FP_screen"] call BIS_fnc_blackIn;
				};
			}] call FP_JRM_fnc_forceRespawn;
		};
	};
}] call ACE_common_fnc_addEventHandler;

/*
this addEventHandler["HandleDamage", {
	if (_this select 4 == "IEDUrbanSmall_Range_Ammo") then {
		(_this select 0) setDamage 1;
	};
}];
*/
