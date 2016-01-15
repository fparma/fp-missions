// Write your briefing here
// <br /> is line break.

player createDiaryRecord
["Diary",["Mission","
<br />
1 wave respawn after completing the three first objectives.<br />
Prevent insta death - off.<br />
Stay safe.<br />
"]];

player createDiaryRecord
["Diary",["Intel","
Records show a strong Russian force, both infantry and armor wise.<br />
After the Russians have figured out what's going on, expect multiple mechanized patrols on the roads and infantry patrols around settlements/the city.<br /><br />

We suspect that the Russians are not expecting an attack as most patrols seems to have returned to the base.<br />
Once you are noticed, expect the entire base to go on full alert and send out patrols.
"]];

player createDiaryRecord
["Diary",["Execution","
You may choose to complete the objectives in any order.<br /><br />
1) Assault the mech patrol from Abstwind<br />
Our intel suggests a T72 and BTR60 patrolling between Abstwind and the Russian base. As of now, it's currently in Abstwind and the Russian base.<br />
It's expected to move north between 20-30 minutes from now.<br />Taking this patrol out will allow our comrades to transport refugees and bring in reinforcements
<br /><br />
2) Free the captives in Grammendorf Ruins<br />
We need to help our comrades in Grammendorf. They were captured trying to transport refugees out from the main city.<br />
You must do this quickly and it's likely reinforcements will be brought in from the main base, so get out quickly.
<br />After our comrades been released and geared up, you can expect some help from them.
<br /><br />

3) Destroy the communication tower<br />
Taking out this communication tower will allow you to move more freely within the area.<br />
Expect Russian troops from the RU base after this tower is taken out. Once again, in and out.<br />
The Russians will likely prioritize this tower than you rescuring the captives. A coordinated attack is suggested.
<br /><br />

4) Capture the governor<br />
The governor of the city is a former Russian politician.<br />
Capturing him will strengthen our support in the city.<br />
Once he's captured, bring him directly South-East to a waiting patrol boat, and load him in. Later on, I'm sure we'll see him supporting our cause on national TV.
<br /><br />

5) Take out the solar power towers<br />
This is the big one.<br />
Taking out these two towers that represents everything the city stands for will severly damage the Russian reputation troughout this region.<br />
This requires two well placed satchel charges.<br /><br />

<br /><br />
After all objectives are complete, head towards the docks in the industrial yard (north).<br />
We have a fishing boat coming, around 2-3 hours from now that we will use for our escape.<br />
The Russians will be searching the south for your escape, they'll never expect us to travel by boat.
"]];

player createDiaryRecord
["Diary",["Briefing","
<br />
It's finally time to show the Russians how capable we are of defending our country.<br />
We've selected several high-impact objectives that will strengthen the world's support of our cause.
"]];



//Radio channels
player createDiarySubject ["fp_radios"," - Radio channels"];

player createDiaryRecord ["fp_radios", ["Plt-Radio", "
	[ Plt ]<br />
	Freq 41.1
"]];

player createDiaryRecord ["fp_radios", ["Group channels", "
	[ Alpha ] : 1 <br />
	[ Bravo ] : 2 <br />
	[ Charlie ] : 3 <br />
	[ Delta ] : 4 <br />
	[ Actual ] : 5 <br />
	[ Crew / Pilot] : 6 or 7 <br />
"]];


//  Unomment  next line to not have squads show on the briefing
// if (true) exitWith {};

/*
	Adds squads to the map screen
	Full credits CPC-Skippy

		(optional) Mission Maker can change groups name using :
		(group this) setGroupID ["Group Name"];
		on all units in the group

		(optional) Mission Maker can change groups color using :
		(group this) setVariable ["color",'#000000']; where 000000 can be changed to whatever hexa code

		You can set a custom name on one unit by doing
		this setVariable ["displayName","Noob #1"];

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


// ADMIN from F3 framework

if (serverCommandAvailable '#kick') then {
    player createDiarySubject ["fp_admin"," - Admin"];
    _briefing ="
    <br />
    ADMIN SECTION<br/>
    This briefing section can only be seen by the admin.
    <br /><br />
    ";

    // ENDINGS
    // This block of code collects all valid endings and formats them properly

    _title = [];
    _ending = [];
    _endings = [];

    _i = 1;
    while {true} do {
        _title = getText (missionconfigfile >> "CfgDebriefing" >> format ["end%1",_i] >> "title");
        _description = getText (missionconfigfile >> "CfgDebriefing" >> format ["end%1",_i] >> "description");
        if (_title == "") exitWith {};
        _ending = [_i,_title,_description];
        _endings set [count _endings,_ending];
        _i = _i + 1;
    };

    _briefing = _briefing + "
    ENDINGS<br />
    These endings are available. To trigger an ending click on its link.<br /><br />
    ";

    {
        _briefing = _briefing + format [
        "<execute expression=""[{['end' + str(%1),true,true] call BIS_fnc_endMission},'BIS_fnc_spawn',nil,true] call BIS_fnc_MP;"">'end%1 WIN'</execute> - %2 : - <execute expression=""[{['end' + str(%1),false,true] call BIS_fnc_endMission},'BIS_fnc_spawn',nil,true] call BIS_fnc_MP;"">'end%1 FAIL'</execute>
        <br />
        %3<br /><br />"
        ,_x select 0,_x select 1,_x select 2];
    } forEach _endings;

    if (count _endings > 0) then {
        player createDiaryRecord ["fp_admin", [" - Ending",_briefing]];
    };
    _cmds = " <br />You may run these commands.<br /><br />";
    CUL_a_showUnits = {
        hint format ['UNITS\n\nWEST:%1\nEAST:%2\nINDEP:%3\nCIV:%4\nDEAD MEN:%5\nPLAYERS:%6',
            {side _x == WEST} count allUnits,{side _x == EAST} count allUnits,{side _x == independent} count allUnits,{side _x == civilian} count allUnits,count allDeadMen, count call CBA_fnc_players]
    };
    _cmds =  _cmds + "'<execute expression=""call CUL_a_showUnits"">Count all units</execute><br />'";
    CUL_serverFPSTimeout = time;
    CUL_serverFPS = {
        if (time < CUL_serverFPSTimeout) exitWith{
            hintSilent "You must wait";
        };
        CUL_serverFPSTimeout = time + 15;
        [[[player], {
            [[[diag_fps], {hint format ["Server fps: %1",_this select 0]}],"BIS_fnc_spawn",(_this select 0),false] call BIS_fnc_MP;
        }],"BIS_fnc_spawn",false,false] call BIS_fnc_MP;
    };
    _cmds =  _cmds + "'<execute expression=""call CUL_serverFPS"">Server FPS</execute>'";
    player createDiaryRecord ["fp_admin", [" - Ending",_cmds]];
};
