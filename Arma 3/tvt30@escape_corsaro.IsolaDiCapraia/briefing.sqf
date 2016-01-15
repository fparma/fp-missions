private "_sideBriefing";
switch (side player) do {
    case blufor:  {
        _sideBriefing = 
        "Good luck killing people blufor! <br />
        Here is a new line!
        ";
    };
    case opfor:  {
        _sideBriefing = 
        "Good luck killing people opfor!<br />
        Here is a new line!";
    };
    case independent:  {
        _sideBriefing = 
        "Good luck killing people independents!<br />
        Here is a new line!";
    };
    case civilian:  {
        _sideBriefing = 
        "Good luck not dying civvies!<br />
        Here is a new line!";
    };
};

/* Add side specific briefing from above*/
player createDiaryRecord 
["Diary",["Briefing",_sideBriefing]];

/* Briefings available to all teams*/
player createDiaryRecord 
["Diary",["Execution","
    You have to kill each other
"]];


// Remove next line to not have squads show on the briefing
// if (true) exitWith {};


/*
	Adds squads to the map screen
	Full credits CPC-Skippy
*/
private["_includeAI","_rank","_role","_strRank","_strRole","_strGrp","_strColorGrp","_strFinal","_oldGrp","_newGrp","_unitsArr"]; 

_includeAI     = 0;//0->only players, 1->both AI and players, 2->playable units only (includes player and some AI) 
_rank         = false;//true->display unit's rank        false->hide unit's rank 
_role         = true;//true->display unit's role        false->hide unit's role 

_strRank         = "";//will contain unit's rank 
_strRole         = "";//will contain unit's role 
_strGrp         = "";//will contain unit's group name 
_strColorGrp     = "";//will contain unit's group color 
_strFinal         = "";//will contain final string to be displayed 
_oldGrp         = grpNull;//group of last checked unit 
_newGrp         = grpNull;//group of current unit 
_unitsArr         = [];//will contain all units that have to be processed 

switch(_includeAI) do { 
    case 0:{//only players 
			_unitsArr = call CBA_fnc_players;
	}; 
    case 1:{//both AI and players 
        _unitsArr = allUnits; 
    }; 
    case 2:{//only playable units 
        if(isMultiplayer) then { 
            _unitsArr = playableUnits; 
        } else { 
            _unitsArr = switchableUnits; 
        }; 
    }; 
    default{ 
        _unitsArr = allUnits; 
    }; 
}; 

{
    if(side _x == side player) then {
        _newGrp = group _x;
        _strGrp = "";
         
        if(_rank) then {
            switch(rankID _x) do {
                case 0:{ 
                    _strRank = "Pvt. "; 
                }; 
                case 1:{ 
                    _strRank = "Cpl. "; 
                }; 
                case 2:{ 
                    _strRank = "Sgt. "; 
                }; 
                case 3:{ 
                    _strRank = "Lt. "; 
                }; 
                case 4:{ 
                    _strRank = "Cpt. "; 
                }; 
                case 5:{ 
                    _strRank = "Maj. "; 
                }; 
                case 6:{ 
                    _strRank = "Col. "; 
                }; 
                default{ 
                    _strRank = "Pvt. "; 
                }; 
            }; 
        }; 

        if(_role) then { 
            _strRole = " - " + getText(configFile >> "CfgVehicles" >> typeOf(_x) >> "displayName"); 
        }; 
         
        if((_x getVariable "displayName") != "") then { 
            _strRole = " - " +(_x getVariable "displayName"); 
        }; 

        if(_newGrp != _oldGrp) then {
            _strGrp = "<br/>" + (groupID(group _x)) + "<br/>"; 
             
            if((_this find ("Color"+str(side _x)))>-1) then { 
                if(count _this > ((_this find ("Color"+str(side _x))) + 1)) then { 
                    _strColorGrp = _this select ((_this find ("Color"+str(side _x))) + 1); 
                } else {
                    hint "Skippy-Roster - Missing Param"; 
                    _strColorGrp = ""; 
                }; 
            } else {
                switch (side _x) do { 
                    case EAST:{ 
                        _strColorGrp = "'#990000'"; 
                    }; 
                    case WEST:{ 
                        _strColorGrp = "'#0066CC'"; 
                    }; 
                    case RESISTANCE:{ 
                        _strColorGrp = "'#339900'"; 
                    }; 
                    case CIVILIAN:{ 
                        _strColorGrp = "'#990099'"; 
                    }; 
                    
                };
            }; 
             
            if(((group _x) getVariable "color") != "") then { 
                _strColorGrp = (group _x) getVariable "color"; 
            }; 
        }; 

        _strFinal =  _strFinal + "<font color="+_strColorGrp+">"+_strGrp+"</font>" + _strRank + format ["%1%2",if (leader group _x == _x) then {"- "}else{"  - "}, name _x] + _strRole + "<br/>"; 

        _oldGrp = group _x; 
    }; 
}forEach _unitsArr; 

player createDiarySubject ["fp_squads"," - Squads"]; 
player createDiaryRecord ["fp_squads",["Squads",_strFinal]];  