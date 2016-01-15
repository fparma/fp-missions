// by Bon_Inf*
// gets
//	- position,
//	- radius
// returns
//	either: the most flat area given in the given radius and away from any road segment


private ["_position","_radius","_maxradius","_isFlat","_maxgradient","_ang","_a","_b","_bcount","_inc"];


_position = _this select 0;
_maxradius = _this select 1;


_isFlat = [];
_maxgradient = 0.1; 
_radius = 10;
while{count _isFlat < 3 && _maxgradient < 0.7} do {

	_ang = random 360;
	_bcount = floor (_radius*2*pi*0.1);
	_inc = 360/_bcount; 

	for "_i" from 1 to _bcount do {

		_ang = _inc * _i;
		_a = (_position select 0)+(sin(_ang)*_radius);
		_b = (_position select 1)+(cos(_ang)*_radius);

		_isFlat = [_a,_b,0] isflatempty [10,0,_maxgradient,5,0,false,objNull];
		if(count _isFlat == 3) then {
			_isFlat set [2,0];
			if(count (_isFlat nearRoads 20) > 0) then{_isFlat = []};
		};
		if(count _isFlat == 3) exitWith{};
	};

	_radius = _radius + 10;
	if(_radius > _maxradius) then{
		_radius = 10;
		_maxgradient = _maxgradient + 0.1;
	};
};


if(count _isFlat == 0) then {
	_isFlat = [(_position select 0) + _maxradius - random (2*_maxradius),(_position select 1) + _maxradius - random (2*_maxradius),0];
};


_isFlat