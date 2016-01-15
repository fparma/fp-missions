_id = _this select 2;
genVar = true; publicVariable "genVar"; // server is waiting for this var
[nil, generator, "per", rREMOVEACTION, _id] call RE;
