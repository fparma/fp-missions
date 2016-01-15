
private ["_id","_unit"];
_id = _this select 2;
_unit = _this select 1;

talkGeneral = true; publicVariable "talkGeneral"; // server is waiting for this var
_unit removeAction _id;
talkOfficer removeAction _id;