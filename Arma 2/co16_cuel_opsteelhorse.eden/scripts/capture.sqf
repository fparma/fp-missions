//for TFOR 'South Airbase' by Bon_Inf*
//further edit and params changes by SemlerPDX and team [Poffadder, SavageCDN, cuel] for CLAfghan co44
// executed by player action

_capturee = _this select 0;
_capturer = _this select 1;
_callid = _this select 2;

[-2, {_this switchMove ""},_capturee] call CBA_fnc_globalExecute;
_capturee enableAI "MOVE";
_capturee enableAI "ANIM";

[_capturee] joinSilent _capturer;


sleep 15;
[nil,nil,"per",rTitleCut,"Pilot has been rescued! Good job.", "BLACK FADED", 6] call RE;
sleep 5; 
[nil,nil,"per",rENDMISSION,"END1"] call RE;

if(true) exitWith{};