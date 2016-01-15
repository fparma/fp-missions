//Starta denna via en trigger t.ex. när man har kommit någon bit eller så. Den ger dig "intel".
//ex i en trigger 
//  Condition: this
//  On act: mess1 = ["SIERRA LIMA this is CROSSROADS, MESSAGE in 10...","New intel suggest movement in S-E","Enemies are fielding tanks.","CROSSROADS OUT"] execVM "xascripts\intelFromHQ.sqf";

//Byt ut texten "Första raden..." och "Andra raden..." mot det meddelande du vill ska komma från HQ.
//mess1 = ["SIERRA LIMA this is CROSSROADS, MESSAGE in 10...","Första raden med INTEL","Andra raden med INTEL","CROSSROADS OUT"] execVM "xascripts\intelFromHQ.sqf";

_message1 = _this select 0;
_message2 = _this select 1;
_message3 = _this select 2;
_message4 = _this select 3;

PAPABEAR = [West,"HQ"];
//"SIERRA LIMA this is CROSSROADS, MESSAGE in 10..."
if (isServer) then {[-2, {PAPABEAR sideChat _this}, _message1] call CBA_fnc_globalExecute;};
sleep 10;

//"Första raden med INTEL"
if (isServer) then {[-2, {PAPABEAR sideChat _this}, _message2] call CBA_fnc_globalExecute;};
sleep 6;

//"Andra raden med INTEL"
if (isServer) then {[-2, {PAPABEAR sideChat _this}, _message3] call CBA_fnc_globalExecute;};
sleep 6;

//"CROSSROADS OUT"
if (isServer) then {[-2, {PAPABEAR sideChat _this}, _message4] call CBA_fnc_globalExecute;};