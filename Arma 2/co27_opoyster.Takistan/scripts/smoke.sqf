//Burn script for static objects. Based on burning vehicles script by Maddmatt, for ArmA 2
//params: [unit,intensity,time]
//example: nul = [car1,3,600] execVM "xascripts\smoke.sqf"

private ["_v", "_int", "_timer", "_snd", "_fl", "_sm", "_li", "_cl"];
_v = _this select 0;
if (isNil "_v") exitWith {};
if (isNull _v) exitWith {};
_int = _this select 1;
_timer = time + (_this select 2);
if (isNil "_timer") exitWith {};
_pos = [getPos _v select 0, getPos _v select 1, 0];

if (!isDedicated) then {
	_fl = "#particlesource" createVehicleLocal _pos;
	_fl setPos _pos;
	_fl setdropinterval 0.02;

	_sm = "#particlesource" createVehicleLocal _pos;
	_sm setPos _pos;

	_li = "#lightpoint" createVehicleLocal _pos;
	_li setLightBrightness 0;
	_li setLightAmbient[0.8, 0.6, 0.2];
	_li setLightColor[1, 0.5, 0.4];
};

if (isServer) then {
	//_snd = createSoundSource ["Sound_Fire", _pos, [], 0]; //Seriously unhappy about this method. Looping sucks ass!
};

_dummy = "ItemEvidence" createVehicleLocal _pos;
_dummy setPos _pos;

while {(_int>3) && (_timer > time)} do {
	if (!isDedicated) then {
		_fl setParticleParams 
		[["\Ca\Data\ParticleEffects\Universal\Universal", 16, 10, 32],
		"", "Billboard", 1, 0.3*_int, 
		"",[0, 0, 0.17*_int],
		0, 10, 7.9, 1, [0.3*_int, 0.05*_int], 
		[[1,1,1,-0], [1,1,1,-1], [1,1,1,-1], [1,1,1,-1], [1,1,1,-1], [1,1,1,0]], 
		[0.5, 1], 1, 0, "", "", _dummy];
		_fl setParticleRandom [0.04*_int, [0.1*_int, 0.1*_int, 0.1*_int], [0.05*_int, 0.05*_int, 0.05*_int], 0, 0.06*_int, [0, 0, 0, 0], 0, 0];

		_cl = 0.8/_int;
		_sm setDropInterval (0.02*_int);
		_sm setParticleParams 
		[["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], 
		"","Billboard",1, 3*_int, 
		"",[0, 0, 0.5*_int],  
		0, 0.05, 0.04, 0.05, [0.5 + 0.5*_int, 3 + 3*_int],
		[[_cl, _cl, _cl, 0.2],[_cl, _cl, _cl, 1],[_cl, _cl, _cl, 1],
		[0.05+_cl, 0.05+_cl, 0.05+_cl, 0.9],[0.1+_cl, 0.1+_cl, 0.1+_cl, 0.6],[0.2+_cl, 0.2+_cl, 0.2+_cl, 0.3], [1,1,1, 0]], 
		[0.8,0.3,0.25], 1, 0, "", "", _dummy];
		_sm setParticleRandom [0.7*_int, [1 - _int/10,1 - _int/10,1 - _int/10], [0.2*_int, 0.2*_int, 0.05*_int], 0, 0.3, [0.05, 0.05, 0.05, 0], 0, 0];

		_li setLightBrightness (_int/30);
	};
	sleep 3;
};

if (!isDedicated) then {deletevehicle _fl};

while {(_int>0.7) && (_timer > time)} do {
	if (!isDedicated) then {
		_cl = 0.8/_int;
		_sm setDropInterval (0.01 + 0.02*_int);
		_sm setParticleParams 
		[["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], 
		"","Billboard",1, 3*_int, 
		"destructionEffect1",[0, 0, 0.5*_int],  
		0, 0.05, 0.04, 0.05, [0.5*_int, 3*_int],
		[[_cl, _cl, _cl, 0.2],[_cl, _cl, _cl, 1],[_cl, _cl, _cl, 1],
		[0.05+_cl, 0.05+_cl, 0.05+_cl, 0.9],[0.1+_cl, 0.1+_cl, 0.1+_cl, 0.6],[0.2+_cl, 0.2+_cl, 0.2+_cl, 0.3], [1,1,1, 0]], 
		[0.8,0.3,0.25], 1, 0, "", "", _v];
		_sm setParticleRandom [0.7*_int, [1 - _int/10,1 - _int/10,1 - _int/10], [0.2*_int, 0.2*_int, 0.05*_int], 0, 0.3, [0.05, 0.05, 0.05, 0], 0, 0];

		_li setLightBrightness (_int/30);
	};
	sleep 3;
};

if (!isDedicated) then {
	deletevehicle _sm; 
	deletevehicle _li;
	deleteVehicle _dummy;
};
//if (isServer) then {deletevehicle _snd};