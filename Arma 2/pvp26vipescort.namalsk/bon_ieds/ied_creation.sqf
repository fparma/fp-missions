//by Bon_Inf*

if(not isServer || bon_number_ieds == 0) exitWith {};


_debug =false; // create markers at IED positions



private ["_iedpos","_offset","_ied"];


// the following line is a CPU overkill :-(
// whenever possible, avoid usage of nearroads with a radius > 100
_roads = [1500,1500,0] nearRoads 25000;

if(not isNil "bon_ied_greenzone") then {
	_roads = _roads - ((bon_ied_greenzone select 0) nearRoads (bon_ied_greenzone select 1));
		//remove these lines, added by cuel.
	_roads = _roads - ((getmarkerpos "opforspawn") nearRoads (500));
	_roads = _roads -  ((getmarkerpos "respawn_east") nearRoads (500));
	_roads = _roads -  ((getpos taraloc) nearRoads (500));
};


_number_ieds = ceil ((count _roads / bon_min_distance_between_ieds) * bon_number_ieds);

if(_debug) then {
	hint format["attempting to create %1 IEDs...",_number_ieds];
};
diag_log format["[%1]  ##### TFOR IEDs - number ieds to create: %2 #####",time,_number_ieds];



_created_ieds = [];

while{count _roads > 0 && count _created_ieds < _number_ieds} do {
	_j = (count _roads - 1) min (round random (count _roads));
	_iedpos = _roads select _j;
	_roads = _roads - [_iedpos]; // in each step _roads get smaller, hence deterministic

	if({_x distance _iedpos < bon_min_distance_between_ieds} count _created_ieds == 0 && count roadsConnectedTo _iedpos >= 2) then {

		_j = (count bon_ied_container - 1) min (round random (count bon_ied_container));
		_ied = (bon_ied_container select _j) createVehicle getpos _iedpos;
		_created_ieds = _created_ieds + [_ied];

		_offset = if(random 2 > 1) then {-7.5 - random 3} else {7.5 + random 3};
		_iedpos = _iedpos modelToWorld [_offset,0,0];
		_ied setPos [_iedpos select 0, _iedpos select 1, 0];

		_ied setVehicleInit format["
			this addAction ['<t color=""#FFCC00"">Blow IED</t>','%1blow.sqf'];
			this addAction ['<t color=""#F00000"">Defuse IED</t>','%1defuse.sqf'];
		",BON_IED_PATH]; processInitCommands;
		_ied execFSM (BON_IED_PATH+"ied_sensor.fsm");
	};
};


diag_log format["[%1]  ##### TFOR IEDs INITIALIZED; number ieds created: %2 #####",time,count _created_ieds];


if(_debug) then {
	{
		createMarker [str position _x, position _x] setmarkertype "dot";
	} foreach _created_ieds;
	hint format["IEDs created: %1", count _created_ieds];
};