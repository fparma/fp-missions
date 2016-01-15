//Written by beta and Krause
//AI can hear you talk on ACRE
//version 2

private ["_nearAI", "_revealAmount", "_sideUnit", "_nearAISingle", "_sideAI", "_sideUnits", "_inContact", "_enemyInContact", "_talkTime"];

_talkTime = 0;

sleep 5;  //wait for init

waitUntil
{
	if ((player getVariable "acre_sys_core_isSpeaking") == 1) then
	{
		_talkTime = _talkTime + 0.25;
		
		if (_talkTime >= 2.0) then
		{
			_nearAI = nearestObjects [player, ["Man"], 40];
			_nearAI = _nearAI - [playableUnits];
			
			{
				if ((alive _x) && (_x knowsAbout player < 1.0) && !(_x knowsAbout player >= 4.0)) then
				{
					
					_nearAISingle = _x; 
					_sideAI = side _nearAISingle; 
					_sideUnits = [];
					_inContact = false; 
					
					//AI hears talking
					_revealAmount = 1.0;
					
					//Command and control checks
					if ( ([weapons _nearAISingle, "ACRE_PRC117F"] call acre_api_fnc_hasKindOfRadio) || ([weapons _nearAISingle, "ACRE_PRC119"] call acre_api_fnc_hasKindOfRadio) || ([weapons _nearAISingle, "ACRE_PRC148"] call acre_api_fnc_hasKindOfRadio) ||  ([weapons _nearAISingle, "ACRE_PRC152"] call acre_api_fnc_hasKindOfRadio) ) then {
						_revealAmount = _revealAmount + 1.0; 
						//AI has a radio 
						{
							if ((side _x == _sideAI) && !(isplayer _x)) then { 
								_sideUnits = _sideUnits + [_x]; 
							};
						}
						foreach allunits; 
						
						{
							_sideUnit = _x; 
							{
								if ((_sideUnit knowsAbout _x > 2) && (([weapons _sideUnit, "ACRE_PRC117F"] call acre_api_fnc_hasKindOfRadio) || ([weapons _sideUnit, "ACRE_PRC119"] call acre_api_fnc_hasKindOfRadio) || ([weapons _sideUnit, "ACRE_PRC148"] call acre_api_fnc_hasKindOfRadio) ||  ([weapons _sideUnit, "ACRE_PRC152"] call acre_api_fnc_hasKindOfRadio))) exitWith { 
									_inContact = true; 
									_revealAmount = _revealAmount + 1.0; 
									//AI has radio link to other troops in contact
								};
								
							}
							foreach playableunits; 
						}
						foreach _sideUnits;
						
						
					};
					
					if (!isNull ((leader (group _nearAISingle)) findNearestEnemy (getPos leader (group _nearAISingle)))) then { 
						
						_enemyInContact = (leader (group _nearAISingle)) findNearestEnemy (getPos leader (group _nearAISingle));
						
						if (_enemyInContact distance _nearAISingle < 2000) then { 
							_revealAmount = _revealAmount + 1.0; 
							//AI is already in contact with enemy
						};					
					};
					
					//player sideChat format["%1 hears you, for %2", _x, _revealAmount];
					[0, {(_this select 0) reveal (_this select 1);}, [_nearAISingle, [player, _revealAmount]]] call CBA_fnc_globalExecute;
				};
			} forEach _nearAI;
		};
	}
	else
	{
		if (_talkTime > 0) then { _talkTime = 0; };
	};
	
	sleep 0.25;
	
	false
};