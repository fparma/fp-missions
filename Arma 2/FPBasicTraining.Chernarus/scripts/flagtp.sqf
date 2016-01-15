_unit = _this select 1;
_loc = _this select 3;

switch _loc do {
	case 0:{
		_unit setPos (getMarkerPos "respawn_west");
	};
	case 1:{
		_unit setPos (getMarkerPos "tanktrainingmarker");
	};
	case 2:{
		_unit setPos (getMarkerPos "easytraining");
	};
	case 3:{
		_unit setPos (getMarkerPos "mediumtraining");
	};
	case 4:{
		_unit setPos (getMarkerPos "hardtraining");
	};
};
sleep 1;
_stuff = nearestObjects [_unit, ["All"],150];
{_unit reveal [_x,4]} forEach _stuff;