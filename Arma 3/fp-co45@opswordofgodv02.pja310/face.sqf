waitUntil {!isNull player};

_faces = [
	'AfricanHead_01',
	'AfricanHead_02',
	'AfricanHead_03'
];

FP_Face = _faces call BIS_fnc_selectRandom;
player setVariable ["fp_face", FP_Face];

player addEventHandler ["Respawn", {
	player setVariable ["fp_has_face", false, true];
	player setVariable ["fp_face", FP_Face];
}];

{
	_x setVariable ["fp_face", _faces call BIS_fnc_selectRandom];
}forEach (allUnits - ([] call CBA_fnc_players));

while {true} do {
	{
		if (!(_x getVariable ["fp_has_face", false]) && {_x getVariable ["fp_face", ""] != ""}) then {
			_x setVariable ["fp_has_face", true];
			_x setFace (_x getVariable "fp_face");
		};
		sleep 0.02;
	}forEach allUnits;
	sleep 1;
};

{_x setFace ([
	'AfricanHead_01',
	'AfricanHead_02',
	'AfricanHead_03'
] call BIS_fnc_selectRandom)} foreach allUnits;