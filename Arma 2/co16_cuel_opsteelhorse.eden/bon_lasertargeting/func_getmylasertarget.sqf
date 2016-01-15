//by Bon_Inf*
/** returns the laser target the player is lasering at, or ObjNull if it does not exist **/

private ["_xpos","_ypos","_myLaserTarget","_lasertargets","_dir","_distance","_min","_target","_targetpos","_targetdistance","_aimpos"];


_lasertargets = nearestObjects[player,["LaserTarget"],5000];
if(count _lasertargets == 0) exitWith{ObjNull};

_xpos = getPos player select 0;
_ypos = getPos player select 1;

_myLaserTarget = ObjNull;

_dir = player weaponDirection "Laserdesignator";
_dir = (_dir select 0) atan2 (_dir select 1);		// get direction of the lasermarker aiming at

_distance = 99;
_min =99;

for "_i" from 0 to (count _lasertargets - 1) do{
	_target = _lasertargets select _i;
	_targetpos = [getPos _target select 0,getPos _target select 1,0];

	_targetdistance = _targetpos distance [getPos player select 0, getPos player select 1, 0];

	_aimpos = [_xpos + _targetdistance*sin(_dir), _ypos + _targetdistance*cos(_dir),0];

	if((_targetpos distance _aimpos)<_min) then{
		_myLaserTarget=_target;
		_min = _targetpos distance _aimpos;
	};
};

if(_min>40) then{_myLaserTarget = ObjNull};

_myLaserTarget