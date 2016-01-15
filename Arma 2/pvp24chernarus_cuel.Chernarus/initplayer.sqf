if (isDedicated) exitWith {};
	removeAllWeapons player;
	
player addEventHandler ["Killed",{
player spawn {
private ["_unit"];
_unit = _this;
		WaitUntil{alive player};
		removeAllWeapons player;
		sleep 120;
		hidebody _unit; 
		sleep 3;
		deleteVehicle _unit;
	};
}];


/*
//pbv test
if (playerSide == west) then {
hint "ADDING PV!";
	"tpwest" addPublicVariableEventHandler {_pos = (_this select 1);
	hint format ["POS: %1", _pos];
	_tppos = _pos findEmptyPosition [5,50, typeof (vehicle player)];
		if ((count _tppos) > 0) then {
			player setPos _tpppos;
		} else {
			player setPos _pos;
		};
	};
};

if (playerSide == east) then {
hint "ADDING PV!";
	"tpeast" addPublicVariableEventHandler {_pos = (_this select 1);
	_tppos = _pos findEmptyPosition [5,50, typeof (vehicle player)];
		hint format ["POS: %1", _pos];
		if ((count _tppos) > 0) then {
			player setPos _tpppos;
		} else {
			player setPos _pos;
		};
	};
};
*/