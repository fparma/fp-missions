private ["_unit","_ammo","_audible","_caliber","_distance","_list","_v","_z"];

if (!firedHandled) exitWith {};
firedHandled = false;
_unit = 		_this select 0;
_ammo = 		_this select 4;

_audible = getNumber (configFile >> "CfgAmmo" >> _ammo >> "audibleFire");
_cal = getNumber (configFile >> "CfgAmmo" >> _ammo >> "caliber");
_distance = round(_audible * 8);

if (_distance > 400) then {_distance = 400;};
_list = (getPosATL _unit) nearEntities ["Man",_distance];
_list = _list-[_unit];

if (count _list == 0  ||  _distance < 10) exitWith {firedHandled = true;};

_v = (vehicle _unit);
_z = 0;
{
	if(!isPlayer _x) then 
		{
			_t = _x getVariable ["zombietype",""]; _c = _x getVariable ["incombat",false];
			if (_t != "" and !_c) then 
			{
				_x setVariable ["victim",_v,true];
				(group _x) reveal [_v,4];
				_z = _z+1;
			};
		};
	sleep 0.1;
}forEach _list;
if (CLY_debug) then {player sideChat format ["DEBUG: REVEALED TO %1 ZOMBIES - Noise: %2 meters - AMOUNT IN LIST: %3 - AUDIBLE:%4 -- CAL:%5",_z,_distance,count _list,_audible,_cal];};
firedHandled = true;