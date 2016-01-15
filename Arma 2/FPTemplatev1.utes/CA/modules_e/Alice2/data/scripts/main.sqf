private ["_logicFnc","_twnlist","_locationParams","_create","_twnlistTemp","_i","_rarity","_faction","_classlist","_classlistVehicles","_scope","_side","_woman","_class","_vehicleclass","_actual","_condition","_fsm","_locked","_canrepeat","_initVariables","_init","_allActions","_action","_tempArrayx","_civilianActions","_source","_allActionsx","_allTopics","_endSentences","_tempArray","_element","_type","_topic","_path","_category","_screams","_scream","_categoryId","_oldScreams","_allScreams","_Remarks","_oldRemarks","_allRemarks","_civilianConversations","_civilianScreams","_civilianRemarks","_factionCiv","_logic","_debug","_initArray","_distlimit","_trafficDistance","_twnSize","_civilianCount","_actionCategories","_kbCategories","_townsFaction","_blacklist","_respectModifyCoef","_threatDecay","_unitrarity","_totobj","_allConversations","_twnrespect"];
scriptName "Alice2\data\scripts\main.sqf";
/*
	File: main.sqf
	Author: Karel Moricky

	Description:
	Init script - Ambient Life In Civilian Environment 2

	Parameter(s):
	_this: Alice2 logic unit which triggered this script.
*/
_logic = _this select 0;
_logic setpos [1,1,1];

//--- Default values
_logic setvariable ["id",0,true];
_logic setvariable ["pause",true,true];

createcenter west;
createcenter east;
createcenter resistance;
createcenter civilian;

//--- File paths
BIS_Alice2_path = "ca\modules_e\alice2\data\";

//--- Is Garbage collector running?
if (isnil "BIS_GC_trashItFunc") then {(group _logic) createUnit ["GarbageCollector", position player, [], 0, "NONE"]};

//--- Execute Functions
if (isnil "bis_fnc_init") then {
	_logicFnc = (group _logic) createunit ["FunctionsManager",position player,[],0,"none"];
};
waituntil {!isnil "BIS_fnc_init"};	//--- Wait for functions
if (!isnil "bis_gita_0") then {waituntil {!isnil "bis_gita_init"}};	//--- If present, wait for GITA (town generator)

///////////////////////////////////////////////////////////////////////////////////
///// Custom params
///////////////////////////////////////////////////////////////////////////////////
//--- Debug
_debug = if (isnil {_logic getvariable "debug"}) then {false} else {true};
_logic setvariable ["debug",_debug];

//--- Civilian init
_initArray = if (isnil {_logic getvariable "initArray"}) then {[]} else {_logic getvariable "initArray";};
_logic setvariable ["initArray",_initArray];

//--- Spawn distance
_distlimit = if (isnil {_logic getvariable "spawnDistance"}) then {400} else {_logic getvariable "spawnDistance"};
_logic setvariable ["spawnDistance",_distLimit];

//--- Traffic distance
_trafficDistance = if (isnil {_logic getvariable "trafficDistance"}) then {500} else {_logic getvariable "trafficDistance"};
_logic setvariable ["trafficDistance",_trafficDistance];

//--- Town size
_twnSize = if (isnil {_logic getvariable "ALICE_townsize"}) then {_distLimit * 2/3} else {_logic getvariable "ALICE_townsize";};
_logic setvariable ["ALICE_townsize",_twnSize];

//--- Civilian count
_civilianCount = if (isnil {_logic getvariable "civilianCount"}) then {"round (4 * (sqrt %1))"} else {_logic getvariable "civilianCount";};
_logic setvariable ["civilianCount",_civilianCount];

//--- Civilian actions
_actionCategories = if (isnil {_logic getvariable "civilianActions"}) then {["BIS"]} else {_logic getvariable "civilianActions";};
_logic setvariable ["civilianActions",_actionCategories];

//--- Civilian conversations
_kbCategories = if (isnil {_logic getvariable "civilianConversations"}) then {["BIS"]} else {_logic getvariable "civilianConversations";};
_logic setvariable ["civilianConversations",_kbCategories];

//--- Towns faction
_townsFaction = if (isnil {_logic getvariable "townsFaction"}) then {["BIS_TK_CIV"]} else {_logic getvariable "townsFaction";};
_logic setvariable ["townsFaction",_townsFaction];

//--- Object blacklist
_blacklist = if (isnil {_logic getvariable "blacklist"}) then {[]} else {_logic getvariable "blacklist";};
_logic setvariable ["blacklist",_blacklist];

//--- Respect modify
_respectModifyCoef = if (isnil {_logic getvariable "respectModifyCoef"}) then {0.15} else {_logic getvariable "respectModifyCoef"};
_logic setvariable ["respectModifyCoef",_respectModifyCoef];

//--- ThreatDecay
_threatDecay = if (isnil {_logic getvariable "threatDecay"}) then {0.07} else {_logic getvariable "threatDecay"};
_logic setvariable ["threatDecay",_threatDecay];


//--- Town list
_twnlist = [];
 if (isnil {_logic getvariable "townlist"}) then {
	_locationParams = if (_debug) then {[["CityCenter"],[],true]} else {[["CityCenter"]]};
	_create = _locationParams call bis_fnc_locations;

	//waituntil {count _create > 0};
	waituntil {sleep 1; count (bis_functions_mainscope getvariable "locations") > 0};
	{
		if ((_x getvariable "type") == "CityCenter") then {_twnlist = _twnlist + [_x]};
	} foreach (bis_functions_mainscope getvariable "locations");

	_logic setvariable ["townlist",_twnlist];
} else {
	_twnlistTemp = _logic getvariable "townlist";
	{
		//--- Array
		if (typename _x == "ARRAY") then {
			//_center = _x select 0;
			//_maxdis = _x select 1;
			_locationParams = if (_debug) then {[["CityCenter"],_x,true]} else {[["CityCenter"],_x]};
			_create = _locationParams call bis_fnc_locations;
			{if !(_x in _twnlist) then {_twnlist = _twnlist + [_x]}} foreach _create;
		} else {
			if (typename _x == "OBJECT") then {
				if (typeof _x != "EmptyDetector") then {
					//--- City logic
					if (isnil {_x getvariable "class"}) then {[[_x]] call bis_fnc_locations};
					_twnlist = _twnlist + [_x];
				} else {
					//--- Trigger
					_locationParams = if (_debug) then {[["CityCenter"],_x,true]} else {[["CityCenter"],_x]};
					_create = _locationParams call bis_fnc_locations;
					{if !(_x in _twnlist) then {_twnlist = _twnlist + [_x]}} foreach _create;
				};
			};
		};
	} foreach _twnlistTemp;
};
_logic setvariable ["ALICE_alltowns",_twnlist];

///////////////////////////////////////////////////////////////////////////////////
///// Civilian & Vehicles Classes
///////////////////////////////////////////////////////////////////////////////////
_unitrarity = if (format ["%1",_logic getvariable "civilianRarity"] == "<null>") then {[]} else {_logic getvariable "civilianRarity";};
_logic setvariable ["civilianRarity",_unitrarity];

_classlist = [];
_classlistVehicles = [];
_totobj = count (configfile >> "cfgVehicles");
for [{_i = 0}, {_i < _totobj}, {_i = _i + 1}] do {
	_actual = (configfile >> "cfgVehicles") select _i;
	if (isclass _actual) then {
		_class = configname _actual;
		_vehicleclass = gettext (configfile >> "cfgvehicles" >> _class >> "vehicleClass");
		if !(_vehicleclass in ["Sounds","Mines"]) then {
			_scope = getnumber (_actual >> "scope");
			_side = getnumber (_actual >> "side");
			_woman = getnumber (_actual >> "woman");

			//--- Civilians
			if (_class iskindof "civilian" && _scope == 2) then {
				_rarity = if (_class in _unitrarity) then {
					_unitrarity select ((_unitrarity find _class)+1);
				} else {
					getnumber (_actual >> "rarityUrban");
				};
				_faction = gettext (_actual >> "faction");
				_classlist = _classlist + [[_class,_rarity,_faction,_woman]];
			};

			//--- Civilian Cars
			if (_vehicleclass == "Car" && _side == 3 && _scope == 2) then {
				_classlistVehicles = _classlistVehicles + [_class];
			};
		};
	};
};
_logic setvariable ["ALICE_classes",_classlist];
_logic setvariable ["ALICE_classesVehicles",_classlistVehicles];

///////////////////////////////////////////////////////////////////////////////////
///// Civilian Actions
///////////////////////////////////////////////////////////////////////////////////

_allActionsx = [];
_allActions = [];
for "_i" from 0 to 2 do {
	_source = [configfile,missionconfigfile,campaignconfigfile] select _i;
	_tempArrayx = [];
	{
		_civilianActions = _source >> "CfgCivilianActions_EP1" >> _x;
		if (str _civilianActions != "") then {
			_tempArrayx = _tempArrayx + [_civilianActions];
			for "_i" from 0 to (count _civilianActions - 1) do {
				_action = _civilianActions select _i;
				if (isclass _action) then {
					_condition = gettext(_action >> "condition");
					_fsm = gettext(_action >> "fsm");
					_rarity = getnumber(_action >> "rarity");
					_locked = getnumber(_action >> "locked");
					_canrepeat = getnumber(_action >> "canRepeat");
					_initVariables = getarray(_action >> "initVariables");
					_init = gettext(_action >> "init");
					_allActions = _allActions + [
						[
							/* 0 */ _action,
							/* 1 */ configname _action,
							/* 2 */ _condition,
							/* 3 */ _fsm,
							/* 4 */ _rarity,
							/* 5 */ _locked,
							/* 6 */ _canrepeat,
							/* 7 */ _initVariables,
							/* 8 */ _init
						]
					];
				};
			};
		};
	} foreach _actionCategories;
	_allActionsx = _allActionsx + [_tempArrayx];
};
_logic setvariable ["ALICE_actionsx",_allActionsx];
_logic setvariable ["ALICE_actions",_allActions];


///////////////////////////////////////////////////////////////////////////////////
///// Civilian Conversations
///////////////////////////////////////////////////////////////////////////////////

_allConversations = [[],[],[],[]];
_allTopics = [];
_allScreams = [];
_allRemarks = [];
for "_i" from 0 to 2 do {
	_source = [configfile,missionconfigfile,campaignconfigfile] select _i;
	_tempArray = [];
	{
		_civilianConversations = _source >> "CfgCivilianConversations_EP1" >> _x;
		for "_i" from 0 to (count _civilianConversations - 1) do {

			_topic = "ALICE_" + (configname _civilianConversations);
			_path = gettext (_civilianConversations >> "path");
			if !(_topic in _allTopics) then {_allTopics = _allTopics + [_topic,_path]};

			_category = _civilianConversations select _i;
			if (isclass _category) then {
				_type = getnumber (_category >> "type");
				_tempArray = _allConversations select _type;

				for "_c" from 0 to (count _category - 1) do {
					_element = _category select _c;
					if (isclass _element) then {
						_endSentences = getarray (_element >> "endSentences");
						_tempArray = _tempArray + [[(configname _civilianConversations),configname _element,_endSentences]];
					};
				};
				_allConversations set [_type,_tempArray];
			};


		};

		//--- Screams
		_civilianScreams = _source >> "CfgCivilianScreams_EP1" >> _x;
		_screams = [];
		for "_i" from 0 to (count _civilianScreams - 1) do {
			_scream = _civilianScreams select _i;
			if (isclass _scream) then {
				_screams = _screams + [configname _scream];
			};
		};
		if (_x in _allscreams) then {
			_categoryId = (_allScreams find _x) + 1;
			_oldScreams = _allScreams select _categoryId;
			_allScreams set [_categoryId,_oldScreams + _screams];
		} else {
			_allScreams = _allScreams + [_x,_screams];
		};

		//--- Remarks
		_civilianRemarks = _source >> "CfgCivilianRemarks_EP1" >> _x;
		_remarks = [];
		for "_i" from 0 to (count _civilianRemarks - 1) do {
			_scream = _civilianRemarks select _i;
			if (isclass _scream) then {
				_Remarks = _Remarks + [configname _scream];
			};
		};
		if (_x in _allRemarks) then {
			_categoryId = (_allRemarks find _x) + 1;
			_oldRemarks = _allRemarks select _categoryId;
			_allRemarks set [_categoryId,_oldRemarks + _Remarks];
		} else {
			_allRemarks = _allRemarks + [_x,_remarks];
		};
	} foreach _kbCategories;
};
_logic setvariable ["ALICE_conversations",_allConversations];
_logic setvariable ["ALICE_screams",_allScreams];
_logic setvariable ["ALICE_remarks",_allRemarks];
_logic setvariable ["ALICE_topics",_allTopics];


///////////////////////////////////////////////////////////////////////////////////
///// Execute
///////////////////////////////////////////////////////////////////////////////////
_fsm = _logic execfsm (BIS_Alice2_path + "fsms\alice2.fsm");



///////////////////////////////////////////////////////////////////////////////////
///// Towns
///////////////////////////////////////////////////////////////////////////////////
//debuglog format ["Log: ALICE 2: Initializing ...",_twnname];
_twnrespect = ["SET"] call BIS_fnc_respect;
{
	_factionCiv = [_x] call BIS_fnc_getFactions;
	_twnrespect set [_factionCiv,0.5];
} forEach _townsFaction;
/*
{
	_type = _x getvariable "type";
	_name = _x getvariable "name";
	_pos = position _x;
	if (isnil {_x getvariable "respect"}) then {_x setVariable ["respect",_twnrespect,true]};
	_x setVariable ["ALICE_active",false];
	_x setVariable ["ALICE_active_traffic",0];
	_x setvariable ["ALICE_threat",-1];
	_x setvariable ["ALICE_status","black"];
	_x setVariable ["ALICE_population",[]];
	_x setVariable ["ALICE_populationCount",-1];
	_fsm = [_x,_classlist] execfsm (BIS_Alice2_path + "fsms\alice2.fsm");
	_x setvariable ["ALICE_fsm",_fsm];
	//if (_x == bis_loc_acityc_khelm) then {diag_debugfsm _fsm};

	//sleep .1;
} foreach _twnlist;
_logic setvariable ["pause",false];
*/
debuglog format ["Log: ALICE 2: Initialized (%1 towns).",count _twnlist];
bis_alice2_init = true;
