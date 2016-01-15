// Hide all UPS markers with correct name, e.g: "area0", "area1", "area_0", "area_1"
for "_i" from 0 to 50 do {
	_a = format ["area%1",_i];
	_a setMarkerAlphaLocal 0;
	_a = format ["area_%1",_i];
	_a setMarkerAlphaLocal 0;
};

[] execVM "xtra\civ\main.sqf";
