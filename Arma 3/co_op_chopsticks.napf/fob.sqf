#define GREEN "#(rgb,8,8,3)color(0,1,0,1)"
#define RED "#(rgb,8,8,3)color(1,0,0,1)"

#define FOB_PACKED "B_Truck_01_box_F"
#define FOB_UNPACKED "B_Truck_01_mover_F"
#define HQ_TYPE "Land_Cargo_HQ_V1_F"
#define MAX_DIST_FROM_VEHICLE 100
#define AMOUNT_HELPERS 20

if (hasInterface && {isNil "fpb_placeObject"}) then {
	fpb_placeObject = objNull;

	private _canUnpack = {
		params ["_target", "_unit"];
		(isNull fpb_placeObject &&
			{!(_target getVariable ["fpb_unpacking", false])} &&
			{speed _target < 0.1} && 
			{count crew _target isEqualTo 0} &&
			{[_unit, _target] call ace_common_fnc_canInteractWith})
	};

	_action = ['fp_fob', 'Unpack  FOB', "", {_this call fpb_fnc_place}, _canUnpack] call ace_interact_menu_fnc_createAction;
	[FOB_PACKED, 0, ["ACE_MainActions" ], _action] call ace_interact_menu_fnc_addActionToClass;

	private _canPack = {
		params ["_target", "_unit"];
		(alive _target && 
			{isNull (_target getVariable ["fpb_packer", objNull])} &&
			{count crew _target isEqualTo 0} &&
			[_unit, _target] call ace_common_fnc_canInteractWith)
	};

	_action = ['fp_fob', 'Pack FOB', "", {_this call fpb_fnc_pack}, _canPack] call ace_interact_menu_fnc_createAction;
	[FOB_UNPACKED, 0, ["ACE_MainActions" ], _action] call ace_interact_menu_fnc_addActionToClass;

	[{!isNull (findDisplay 46)}, {
		private _display = findDisplay 46;
		_display displayAddEventHandler ["MouseButtonDown", {if (param [1, 0] isEqualTo 1) exitWith {[] call fpb_fnc_cancel}}];
		_display displayAddEventHandler ["MouseZChanged", {(_this select 1) call fpb_fnc_scroll}];
	}] call CBA_fnc_waitUntilAndExecute;
};

if (hasInterface) then {
	// ignored when placing
	fpb_blacklist = [
		"Sign_Sphere100cm_F",
		"Land_ClutterCutter_large_F"
	];

	// onScroll
	fpb_fnc_scroll = {
		if (isNull fpb_placeObject) exitWith {false};
		fpb_rotate = fpb_rotate + (param [0, 1] * 5);
		true
	};

	// init placing the hq
	fpb_fnc_place = {
		params ["_veh"];
		if (!isNull fpb_placeObject || {_veh getVariable ["fpb_unpacking", false]}) exitWith {};
		
		fpb_aborted = false;
		fpb_canPlace = false;
		fpb_placeObject = _veh;
		[_veh, false] remoteExecCall ["engineOn", _veh];
		fpb_placeObject setVariable ["fpb_unpacking", true, true];
		
		private _ghost = HQ_TYPE createVehicleLocal [0, 0, 0];
		_ghost enableSimulation false;
		_ghost allowDamage false;

		fpb_helpers = [];
		fpb_helpers pushBack _ghost;
		for "_i" from 0 to AMOUNT_HELPERS do {
			private _helper = "Sign_Sphere100cm_F" createVehicleLocal [0,0,0];
			fpb_helpers pushBack _helper;
			_helper setObjectTexture [0, RED];
		};

		private _unit = ACE_player;
		private _hqSize = sizeOf HQ_TYPE;
		private _helperDist = (3.5 max (0.6 * _hqSize)) + 0.5;
		fpb_rotate = round getDir _unit;

		[fpb_fnc_pfh, 0.01, [_unit, _helperDist, _hqSize]] call CBA_fnc_addPerFrameHandler;

		["Confirm", "Cancel", "Rotate"] call ace_interaction_fnc_showMouseHint;

		_unit setVariable ["fpb_actionid", [
			_unit,
			"DefaultAction",
			{true},
			{_this call fpb_fnc_placeConfirm}
		] call ace_common_fnc_addActionEventHandler];
	};

	// perframehandler when placing
	fpb_fnc_pfh = {
		params ["_args", "_id"];
		_args params ["_unit", "_helperDist", "_hqSize"];

		if (fpb_aborted ||
			{ACE_player != _unit} ||
			{count crew fpb_placeObject > 0} ||
			{!([_unit] call ace_common_fnc_isAwake)} ||
			{_unit distance fpb_placeObject > MAX_DIST_FROM_VEHICLE}) exitWith 
		{
			[_unit] call fpb_fnc_cancel;
			[_id] call CBA_fnc_removePerFrameHandler;
		};

		private _ghost = fpb_helpers param [0, objNull];
		private _pos = _unit getPos [_hqSize, getDir _unit];

		_ghost setPos _pos;
		_ghost setDir fpb_rotate;
		_ghost setVectorUp [0,0,1];

		private _anyBad = false;
		// skip first (ghost)
		for "_i" from 1 to (count fpb_helpers) do {
			private _helper = fpb_helpers param [_i, objNull];
			private _helperPos = _pos getPos [_helperDist, (_i - 1) * (360 / AMOUNT_HELPERS)];
			_helper setPos _helperPos;
			// private _bad = [_helperPos, [1, 0, 0.1, 1, 0, false, fpb_placeObject]] call fpb_fnc_isFlatEmpty isEqualTo [];
			private _bad = abs ((AGLToASL _pos vectorDiff AGLToASL _helperPos) param [2,0]) > 1;
			_helper setObjectTexture [0, [GREEN, RED] select _bad];
			if (_bad && !_anyBad) then {_anyBad = true};
		};

		if (_anyBad) exitWith {
			fpb_canPlace = false;
			titleText ["<t color='#ff0000' size='3'>Placeable</t>", "PLAIN DOWN", 0.001, true, true];
		};

		private _all = _pos nearObjects ["AllVehicles", _hqSize + 4] select {
			private _type = typeOf _x;
			(_x != _unit && 
				{!(_x isKindOf "Animal")} &&
				{sizeOf _type > 1.1} &&
				{!(_type in fpb_blacklist)})
		};

		fpb_canPlace = _all isEqualTo [];
		private _str = format ["<t color='#%1' size='3'>Placeable</t>", ["ff0000", "00ff00"] select fpb_canPlace];
		titleText [_str, "PLAIN DOWN", 0.001, true, true];
	};

	// abort placing hq
	fpb_fnc_cancel = {
		params [["_unit", ACE_player]];
		if (isNull fpb_placeObject) exitWith {false};

		fpb_aborted = true;
		{deleteVehicle _x} forEach fpb_helpers;
		fpb_helpers = [];
		fpb_placeObject setVariable ["fpb_unpacking", false, true];
		fpb_placeObject = objNull;
		[_unit, "DefaultAction", _unit getVariable ["fpb_actionid", -1]] call ace_common_fnc_removeActionEventHandler;
		[] call ace_interaction_fnc_hideMouseHint;
		titleText ["", ""];

		true
	};

	fpb_fnc_placeConfirm = {
		if (!fpb_canPlace || fpb_aborted) exitWith {};

		private _ghost = fpb_helpers param [0, objNull];
		if (isNull _ghost) exitWith {};

		private _pos = getPos _ghost;
		private _dir = getDir _ghost;

		fpb_aborted = true;
		[fpb_placeObject, _pos, _dir] remoteExecCall ["fpb_fnc_build", 2];
	};

	// pack up hq
	fpb_fnc_pack = {
		params ["_veh"];
		_veh setVariable ["fpb_packer", ACE_player, true];
		private _items = (_veh getVariable ["fpb_items", []]) select {_x != _veh};

		private _onSuccess = {
			param [0] params ["_veh"];
			[_veh] remoteExecCall ["fpb_fnc_packFinished", 2];
		};
		private _onFail = {
			param [0] params ["_veh", "_items"];
			_veh setVariable ["fpb_packer", nil, true];
			_veh setVariable ["fpb_items", _items, true]; // no need to add the pack vehicle back at this time
		};
		private _condition = {
			params ["_args", "_elapsed", "_total"];
			_args params ["_veh", "_items"];
			private _count = count _items;
			if (_count > 0 && {round (_total - _elapsed) < _count}) then {
				private _item = [_items deleteAt 0] param [0, objNull];
				deleteVehicle _item;
			};

			(alive _veh &&
				{[ACE_player] call ace_common_fnc_isAwake} &&
				{ACE_player distance _veh < 10} &&
				{count crew _veh isEqualTo 0} &&
				{(_veh getVariable ["fpb_packer", objNull]) isEqualTo ACE_player})
		};	

		[5 max (count _items), [_veh, _items], _onSuccess, _onFail, "PACKING", _condition] call ace_common_fnc_progressBar;
	};
};

if (isServer) then {
	fpb_fnc_build = {
		params ["_veh", "_pos", "_dir"];
		_veh hideObjectGlobal true;
		_veh allowDamage false;
		_veh enableSimulationGlobal false;
		private _items = _veh getVariable ["ace_cargo_loaded", []];
		private _objects = [_pos, _dir, fpb_fobitems] call bis_fnc_objectsMapper;
		reverse _objects; // assume HQ is always first. put it last when deleting

		{
			private _type = typeOf _x;
			if (_type == FOB_UNPACKED) then {
				_x lockDriver true;
				_x setFuel (fuel _veh);
				_x setVariable ["fpb_original", _veh, true];
				_x setVariable ["fpb_items", _objects, true];
				_x setVariable ["ace_cargo_loaded", _items, true];
				_x setVariable ["ACE_isRepairVehicle", 1, true];
				_x setVariable ["ace_medical_isMedicalFacility", true, true];
				_x setVariable ["fpb_respawnId", [missionNamespace, _x, "Mobile FOB"] call BIS_fnc_addRespawnPosition];
				_x addEventHandler ["Killed", {
					params ["_veh"];
					(_veh getVariable ["fpb_respawnId", []]) call BIS_fnc_removeRespawnPosition;
					["fpb_fobRemoved", [_veh getVariable ["fpb_original", objNull]]] call CBA_fnc_globalEvent;
				}];

				["fpb_fobCreated", [_veh, _x]] call CBA_fnc_globalEvent;
			};

			if (_x isKindOf "LandVehicle") then {
				[_x] call fpa_common_fnc_clearCargo;
			};
		} forEach _objects;

	};

	fpb_fnc_packFinished = {
		params ["_veh"];
		private _original = _veh getVariable ["fpb_original", objNull];
		
		private _pos = getPos _veh;
		private _dir = getDir _veh;
		private _items = _veh getVariable ["ace_cargo_loaded", []];
		(_veh getVariable ["fpb_respawnId", []]) call BIS_fnc_removeRespawnPosition;
		deleteVehicle _veh;
		["fpb_fobRemoved", [_original]] call CBA_fnc_globalEvent;

		_original enableSimulationGlobal true;
		_original setDir _dir;
		_original setPos _pos;
		_original setVariable ["ace_cargo_loaded", _items, true];
		_original setVelocity [0,0,0];
		_original hideObjectGlobal false;
		_original allowDamage true;
	};

	// exported with bis_fnc_objectsgrabber
	fpb_fobitems = [
		[HQ_TYPE,[0,0,0],0,1,0,[0,0],"","",true,false], 
		[FOB_UNPACKED,[-10.8491,9.33594,0.114967],226.623,1,0,[0,0],"","",true,false], 
		["Land_CampingTable_F",[-5.646,2.58447,0],269.796,1,0,[0,0],"","",true,false], 
		["Land_CampingChair_V1_F",[-6.67334,2.04932,0],269.283,1,0,[0,0],"","",true,false], 
		["Land_CampingChair_V1_F",[-6.70313,3.04004,0],272.503,1,0,[0,0],"","",true,false], 
		["Land_WaterBarrel_F",[-5.85205,-4.91797,0],0,1,0,[0,0],"","",true,false], 
		["Land_Cargo10_grey_F",[1.80078,7.43555,0],0,1,0,[0,0],"","",true,false], 
		["Land_SatelliteAntenna_01_F",[1.98047,-4.84326,0],218.917,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_01_line_1_green_F",[-6.06104,-6.29492,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_01_wall_4_green_F",[4.20508,8.62598,0],90,1,0,[0,-0],"","",true,false], 
		["Land_CampingChair_V1_F",[-6.90869,6.86475,0],136.409,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_01_line_1_green_F",[-6.02734,8.08203,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_01_line_1_green_F",[-5.20703,9.30664,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_01_line_5_green_F",[-9.14307,6.46973,0],320,1,0,[0,0],"","",true,false], 
		["MetalBarrel_burning_F",[-3.93066,10.5781,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_01_wall_corner_green_F",[-9.65186,-6.22754,0],180,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_01_line_1_green_F",[-6.80322,9.40039,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_01_line_5_green_F",[-11.6997,0.239258,0],270,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_01_line_1_green_F",[-5.25781,10.6318,0],90,1,0,[0,-0],"","",true,false], 
		["Flag_Blue_F",[-10.6455,4.02393,-1.35305],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_01_line_1_green_F",[-11.6152,3.73584,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_01_line_5_green_F",[-3.28467,12.0435,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_01_line_5_green_F",[4.11182,12.168,0],0,1,0,[0,0],"","",true,false], 
		["FlexibleTank_01_forest_F",[-1.07764,13.2832,0],0,1,0,[0,0],"","",true,false], 
		["FlexibleTank_01_forest_F",[-1.80762,13.2568,0],0,1,0,[0,0],"","",true,false], 
		["Land_WeldingTrolley_01_F",[-2.89063,13.3071,0],0,1,0,[0,0],"","",true,false], 
		["Wooden_barrels",[-13.3652,3.70361,0],0,1,0,[0,0],"","",true,false], 
		["Land_Gloves_F",[-3.7583,13.4785,0.925163],0,1,0,[0,0],"","",true,false], 
		["Land_ToolTrolley_01_F",[-3.82129,13.7705,0],0,1,0,[0,0],"","",true,false], 
		["Land_DuctTape_F",[-3.73535,13.9736,0.923035],0,1,0,[0,0],"","",true,false], 
		["Box_NATO_AmmoVeh_F",[-5.00977,13.7207,0],0,1,0,[0,0],"","",true,false], 
		["CamoNet_BLUFOR_F",[-12.0259,9.39502,0.641136],312.434,1,0,[0,0],"","",true,false], 
		["Land_BagFence_01_long_green_F",[-9.27832,14.2402,-0.000999451],2.1116,1,0,[0,0],"","",true,false], 
		["Land_BagFence_01_long_green_F",[-15.9575,6.25488,-0.000999451],275.105,1,0,[0,0],"","",true,false]
	];
};