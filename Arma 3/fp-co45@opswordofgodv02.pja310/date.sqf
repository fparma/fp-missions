
/*waitUntil{!(isNil "BIS_fnc_init")};
sleep 1;
["YourTextHere", "YourTextHere", str(date select 2) + "." + str(date select 1) + "." + str(date select 0)] call BIS_fnc_infoText;
sleep 1;
["You can continue text here", "and here"] call BIS_fnc_infoText;
sleep 1;	
["and here", "and here"] call BIS_fnc_infoText;*/

waitUntil{!(isNil "BIS_fnc_init")};

private ["_month", "_day", "_hour", "_minute", "_time", "_date", "_text"];
_month = str (date select 1);
_day = str (date select 2);
_hour = str (date select 3);
_minute = str (date select 4);

if (date select 1 < 10) then {_month = format ["0%1", str (date select 1)]};
if (date select 2 < 10) then {_day = format ["0%1", str (date select 2)]};
if (date select 3 < 10) then {_hour = format ["0%1", str (date select 3)]};
if (date select 4 < 10) then {_minute = format ["0%1", str (date select 4)]};

_time = format ["%1:%2", _hour, _minute];
_date = format ["%1/%2/%3", _day, _month, str (date select 0)];

_text = format [("<t align = 'right' color='#ffffff'>%1, %2<br/>" + "SWORD OF GOD<br/>Algerian Gov't Forces"), _time, _date, "<br/>"];
sleep 10;
[parseText _text, [safeZoneX + safeZoneW - 0.35 - 0.025, safeZoneY + safeZoneH - 0.35 - 0.05, 0.35, 0.15], [9, 3]] spawn BIS_fnc_textTiles;