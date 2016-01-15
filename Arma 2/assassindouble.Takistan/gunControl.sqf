/* Holster Script v1.03 by Cheetah. Released: 4th of October, 2007
Mission approved by www.ofpec.com, OFPEC - The Editing Center.

Activate with: script = [] execVM "gunControl.sqf";
Holstered / unholstered boolean: saveWeapon select 1; True if holstered, false if unholstered.

With this script, the player can holster and unholster his pistol. Handy in undercover missions!
Check the demo mission for a simple setup to let the enemy engage/disengage depending on (un)holstering.
*/

_passedArray = _this;
_waitUntil = 0;
_gun = "";

// Function for pistol data - by Spooner
isPistol =
{
	_unknownWeaponClass = _this select 0;
	
	_unknownConfig = configFile >> "CfgWeapons" >> _unknownWeaponClass;
	_pistolConfig = configFile >> "CfgWeapons" >> "PistolCore";
	
	_isPistol = false;
	while {isClass _unknownConfig} do
	{
	    if (_unknownConfig == _pistolConfig) exitWith
	    {
	        _isPistol = true;
	    };
	
	    _unknownConfig = inheritsFrom _unknownConfig;
	};
	
	_isPistol; // Return.
};

// Moderate array when script is ran 1st time
if (count _this == 0) then
{
// Modify array when first ran (make it similar to addAction)
_passedArray = [0,0,0,[false]];

// Activate parallel script to check weapon conditions, first run
[] spawn
{
	// Syntax: ["pistolclass",holstered?,dropped pistol?];
	saveWeapon = ["",false,false];

while { true } do
{
	_weaponsArray = weapons player;
	_numWeapon = count _weaponsArray;

// Get pistol classname
_prevention = true;
for [{_p = 0},{_p < _numWeapon},{_p = _p + 1}] do
{
	_gun = (_weaponsArray select _p);
	if ([_gun] call isPistol) exitWith
	{
		_prevention = false;
		if ((_gun != saveWeapon select 0) && saveWeapon select 1) then { _prevention = true; saveWeapon set [1,false]; };
		saveWeapon set [0,_gun];		
	};
};

// Determine if holster/unholster can be used
if (_prevention && !(saveWeapon select 1)) then { saveWeapon set [2,true]; player removeAction holster; player removeAction unholster; }
else
{ if (saveWeapon select 2) then { holster = player addAction ["Holster","gunControl.sqf",[true]]; saveWeapon set [2,false]; }; };

sleep 0.5;
};

// End of spawn
};
};

// Prepare value if holster or unholstered
_holster = (_passedArray select 3 select 0);

// Activate the correct action
if (!_holster) then
{
	player removeAction unholster;
	saveWeapon set [1,false];
	holster = player addAction ["Holster","gunControl.sqf",[true]];
	
	// Upon first activation, prevent addWeapon
	if (count _this > 0) then
	{
	player addWeapon (saveWeapon select 0);
	player selectWeapon (saveWeapon select 0);
	};
}
else
{
	player removeAction holster;
	saveWeapon set [1,true];
	unholster = player addAction ["Unholster","gunControl.sqf",[false]];
	player removeWeapon (saveWeapon select 0);
};

// Calculate next ID
_waitUntil = (_passedArray select 2) + 1;

// Wait with termination until action is used or pistol is dropped
waitUntil { holster == _waitUntil || unholster == _waitUntil || (saveWeapon select 2) };