_id = _this select 2;
towerVar = true; publicVariable "towerVar"; // server is waiting for this var
[nil, tower, "per", rREMOVEACTION, _id] call RE;
player removeAction _id;