// Hide all UPS markers with correct name, e.g: "area0", "area1", "area_0", "area_1"
for "_i" from 0 to 50 do {
	_a = format ["area%1",_i];
	_a setMarkerAlphaLocal 0;
	_a = format ["area_%1",_i];
	_a setMarkerAlphaLocal 0;
};

CUL_bombsites =
[
	[
		[10646.5,8005.93,0.061554],
		[10663.8,8048.85,0.974365],
		[10659,7911.62,0.524063]
	],

	[
		[11474.8,7480.75,0.527969],
		[11453.8,7437.28,0.14328]
	],

	[
		[11311.3,6633.78,0.332703],
		[11218.8,6569.09,0.396896]
	],

	[
		[10260,5576.43,0.0699158],
		[9907.96,5450.87,0.0914154]
	]
];

CUL_inc_box = {
	if (!isServer || count CUL_bombsites == 0) exitWith {};
	_pos = _this select 0;

	CUL_bombsites set [_pos, objNull];
	_b = CUL_bombsites - [objNull];
	if (count _b == 2) then {
		{
			_a = _b deleteAt 0;
			_x setPosATL (_a call bis_fnc_selectRandom);
		}forEach [box1, box2];
		CUL_bombsites = [];
	};
};
