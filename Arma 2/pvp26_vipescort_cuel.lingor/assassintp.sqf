
private ["_unit","_dest"];
_unit = _this select 1;
_dest = _this select 3;

switch (_dest) do {
	case "spawn": {
		_unit setPos (getPos assassinLoc);
	};
	case "lagosa": {
		_unit setPos (getPos lagosaLoc);
	};
	default {
	hint "bug";
	};
};