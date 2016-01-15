// face texture and expression script by Celery, edited by cuel.
if (isServer) exitWith {};

sleep 1;
{if (!isNil {_x getVariable "face"}) then {if (typeName (_x getVariable "face" select 0)=="STRING") then {_x setFace (_x getVariable "face" select 0);_x setMimic (_x getVariable "face" select 1);_x setVariable ["face",nil]}}} forEach allUnits+allDead;

while {true} do {
	sleep 5;
	{
	if (!isNil {_x getVariable "face"}) then 
		{
			if (typeName (_x getVariable "face" select 0)=="STRING") then 
			{
				_x setFace (_x getVariable "face" select 0);
				_x setMimic (_x getVariable "face" select 1);
				_x setVariable ["face",nil]
			};
		};
	} forEach allUnits;
};