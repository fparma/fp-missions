
private ["_unit","_dest"];
_unit = _this select 1;
_dest = _this select 3;

switch (_dest) do {
	case "spawn": {
		_unit setPos (getPos spawnFlag);
	};
	case "talus": {
		_unit setPos (getPos talusFlag);
	};
	case "river": {
		_unit setPos (getPos riverFlag);
	};
	default {
	hint "bug";
	};
};