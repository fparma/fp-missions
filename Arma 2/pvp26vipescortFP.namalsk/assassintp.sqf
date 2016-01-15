
private ["_unit","_dest"];
_unit = _this select 1;
_dest = _this select 3;

switch (_dest) do {
	case "spawn": {
		_unit setPos (getPos assassinLoc);
	};
	case "seraja": {
		_unit setPos (getPos serajaLoc);
	};
	case "tara": {
		_unit setPos (getPos taraLoc);
	};
	default {
	hint "bug";
	};
};