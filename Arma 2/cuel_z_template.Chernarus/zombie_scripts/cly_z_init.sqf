//Zombie init script by Celery. Edited by Cuel.
//This script turns a unit into a zombie

if (!isServer) exitWith {};
waitUntil {time > 0.3};

_zombie=_this select 0;
_zombietype=_this select 1;
_victim=_this select 2;
_horde=_this select 3;
_radius=_this select 4;
_pos=_this select 5;
removeAllWeapons _zombie;
removeAllItems _zombie;
if (!isNull (unitBackpack _zombie)) then {removeBackpack _zombie;};

_zombie addRating -10000;
_zombie setBehaviour "CARELESS";
_zombie setCombatMode "BLUE";
_zombie setSpeedMode "LIMITED";
_zombie allowFleeing 0;
_zombie setSkill 0;
_zombie disableAI "TARGET";
_zombie disableAI "AUTOTARGET";
_zombie disableAI "FSM";
_zombie switchMove "amovpercmstpsnonwnondnon";
_zombie setUnitPos "UP";
if (_zombietype in ["crawler","sneaker","ambusher","passive crawler"]) then {_zombie setUnitPos "DOWN";};
_zombie setDir random 360;
_zombie setVariable ["victim",_victim];
_zombie setVariable ["zombietype",_zombietype,true];
_zombie setVariable ["horde",_horde];
_mimic="angry";
if (random 1<0.5) then {_mimic="dead"};
_zombie setMimic _mimic;
if (!(_zombietype in ["armored","slow armored"])) then {_zombie setFace "Facegrover_wounded_EP1"; _zombie setVariable ["face",["Facegrover_wounded_EP1",_mimic],true]};

if (!isNil "_pos") then {_zombie setPosATL _pos;};
_zombie enableSimulation true;

_zombie call CLY_zombiehandledamage;
[_zombie,_zombietype,_radius] spawn zombieRoutine;

if (CLY_debug) then {
	_marker=createMarker [format ["zmarker%1",random 100000],getPos _zombie];
	_marker setMarkerType "Dot";
	_marker setMarkerColor "ColorBrown";
	if (_horde) then {
		_marker setMarkerColor "ColorPink";
	};
	_marker setMarkerSize [0.4,0.4];
	
	while {alive _zombie} do {
		sleep 1;
		_marker setMarkerPos (getPosATL _zombie);
	};
	deleteMarker _marker;
};

