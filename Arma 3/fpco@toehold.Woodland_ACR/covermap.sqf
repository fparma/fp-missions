scriptName "coverMap.sqf";
/*
	File: fn_coverMap.sqf
	Author: Karel Moricky

	Description:
	Covers unused part of the map

	Parameter(s):
	_this: OBJECT - Area Trigger

	Returns:
	Nothing
*/
_pos = _this select 0;
_posX = _pos select 0;
_posY = _pos select 1;
_size = _this select 1;
_sizeX = _size select 0;
_sizeY = _size select 1;
_zoneProtection = _this select 2;
_dir = 0;
_sizeOut = 100000;
_sizeBorder = (_sizeX max _sizeY) / 50;

if (isnil "bis_warningDis") then {bis_warningDis = 100};
if (isnil "bis_minefield") then {bis_minefield = {}};
if (isnil "bis_minefield_explode") then {bis_minefield_explode = {}};

_colorForest = "colorkhaki";
_colorDesert = "coloryellow";
_colors = if (worldname in ["Takistan","Zargabad","Mountains_ACR","Shapur_BAF","Ardistan"]) then {
	["colorblack","colorblack","colorblack","colorwhite","coloryellow",/**/"colorblack"/**/,"colorblue",_colorDesert];
} else {
	["colorblack","colorblack",_colorForest,"colorgreen",_colorForest,/**/"colorblack"/**/,_colorForest,_colorForest];
};

for "_i" from 0 to 270 step 90 do {
	_sizeMarker = [_sizeX,_sizeOut] select ((_i / 90) % 2);
	_dirTemp = _dir + _i;
	_markerPos = [
		_posX + (sin _dirTemp * (_sizeX + _sizeOut)),
		_posY + (cos _dirTemp * (_sizeY + _sizeOut))
	];
	for "_m" from 0 to (count _colors - 1) do {
		_marker = createmarker [format ["zone_%1_%2",_i,_m],_markerPos];
		_marker setmarkersize [_sizeMarker,_sizeOut];
		_marker setmarkerdir _dirTemp;
		_marker setmarkershape "rectangle";
		_marker setmarkerbrush "solid";
		_marker setmarkercolor (_colors select _m);
		if (_m == 5) then {
			//_marker setmarkercolor "colorblack";
			_marker setmarkerbrush "grid";			
			_marker setmarkersize [_sizeMarker,_sizeOut];
		};
	};

	//--- White borders
	_sizeMarker = [_sizeX,_sizeY + _sizeBorder * 2] select ((_i / 90) % 2);
	//_sizeBorderTemp = if (_i == 90) then {_sizeBorder * 2} else {_sizeBorder};
	_sizeBorderTemp = _sizeBorder;
	_markerPos = [
		_posX + (sin _dirTemp * (_sizeX + _sizeBorderTemp)),
		_posY + (cos _dirTemp * (_sizeY + _sizeBorderTemp))
	];
	for "_m" from 0 to 7 do {
		_marker = createmarker [format ["zoneBorder_%1_%2",_i,_m],_markerPos];
		_marker setmarkersize [_sizeMarker,_sizeBorderTemp];
		_marker setmarkerdir _dirTemp;
		_marker setmarkershape "rectangle";
		_marker setmarkerbrush "solid";
		_marker setmarkercolor "colorwhite";
	};

	//--- Warning
	if (_zoneProtection) then {
		_sizeTrigger = [_sizeX,_sizeY * 1.5] select ((_i / 90) % 2);
		_sizeCoef = 5;
		_marker = format ["bis_warning_%1",_i];
		_triggerPos = [
			_posX + (sin _dirTemp * (_sizeX + _sizeTrigger/_sizeCoef)),
			_posY + (cos _dirTemp * (_sizeY + _sizeTrigger/_sizeCoef))
		];
		_trigger = createtrigger ["emptydetector",_triggerPos];
		_trigger triggerattachvehicle [player];
		_trigger settriggeractivation ["member","present",true];
		_trigger settriggerarea [_sizeTrigger,(_sizeTrigger / _sizeCoef),_dirTemp,true];
		missionnamespace setvariable [_marker,_trigger];

		_trigger settriggerstatements [
			"this",
			format ["%1_spawn = %1 spawn bis_minefield",_marker],
			format ["terminate %1_spawn;",_marker]
		];

		//--- Death
		_trigger = createtrigger ["emptydetector",_triggerPos];
		_trigger triggerattachvehicle [player];
		_trigger settriggeractivation ["member","present",true];
		_trigger settriggerarea [_sizeTrigger,(_sizeTrigger / _sizeCoef) - (bis_warningDis * 2),_dirTemp,true];
		missionnamespace setvariable [_marker + "_d",_trigger];

		_trigger settriggerstatements [
			"this",
			"{position _x call bis_minefield_explode} foreach thislist;",
			""
		];
	};
};

//--- Black frame Inner
_marker = createmarker ["zoneBorderInner",_pos];
_marker setmarkersize [_sizeX,_sizeY];
_marker setmarkerdir 0;
_marker setmarkershape "rectangle";
_marker setmarkerbrush "border";
_marker setmarkercolor "colorblack";

//--- Black frame Outer
_marker = createmarker ["zoneBorderOuter",_pos];
_marker setmarkersize [_sizeX + _sizeBorder * 2,_sizeY + _sizeBorder * 2];
_marker setmarkerdir 0;
_marker setmarkershape "rectangle";
_marker setmarkerbrush "border";
_marker setmarkercolor "colorblack";