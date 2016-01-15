//by Bon_Inf*

if(not isServer) exitWith{};


// _type:
//	0 : no civilian life
//	1 : civilians only
//	2 : civilians plus civ traffic
_type = _this select 0;


// civilians spawn if a player closes the town with this value
_civilian_spawndistance = 700;

// civilian count. the %1 stands for the number buildings with doors 
_civilian_count = "10";

// civilian car count. %1 is the number buildings in town
_car_count = "5";

// probability for a car to be locked. values from 0 to 1.
_car_locked = 0.5;

// house types cars will not spawn next to.
_car_blacklist = call {
	_blacklist = [];
	{
		_blacklist = (_blacklist - [typeof _x]) + [typeof _x];
	} foreach nearestObjects [getmarkerpos "respawn_west",["House"],250];
	_blacklist;
};



if(_type > 0) then {
	_CIV_GroupLogic = createGroup sideLogic;

	_ALICE = _CIV_GroupLogic createUnit ["Alice2Manager",[0,0,0],[],0,"NONE"];
	//_ALICE setVariable ["debug",false];
	_ALICE setvariable ["civilianActions",["BIS","BON_CUSTOM_CIVLIAN_ACTION"]];
	_ALICE setvariable ["spawnDistance", _civilian_spawndistance];
	_ALICE setvariable ["civilianCount", _civilian_count];
	_ALICE setVariable ["townlist", [ccenter]];
	_ALICE setVariable ["ALICE_civilianinit",[{
		_this addEventHandler ["Killed",{
nul = _this spawn R_SN_EHKILLEDCIV;
		}];
		
	}]];

	if(_type > 1) then {
		_SILVIE = _CIV_GroupLogic createUnit ["SilvieManager",[0,0,0],[],0,"NONE"];
		_SILVIE setvariable ["vehicleCount",_car_count];
		_SILVIE setVariable ["blackList",_car_blacklist];
		_SILVIE setvariable ["townlist",[ccenter]];
		call compile format["_SILVIE setvariable ['vehicleInit',{if((random 1) <= %1) then{_this lock true}}];",_car_locked];
	};
};
