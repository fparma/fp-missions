SHK_DeadCivilianCount = 0;
SHK_DeadCivilianLimit = 10;
SHK_fnc_deadCivilians = {
  hintsilent format ["Civilians dead: %1",_this];
  if (_this >= SHK_DeadCivilianLimit) then {
    player sidechat "mission end"; // end mission, do whatever
  };
};
if isserver then {
  {
	if (side _x == Civilian && _x iskindof "Man") then {
        _x addEventHandler ["killed", {
        SHK_DeadCivilianCount = SHK_DeadCivilianCount + 1;
        publicvariable "SHK_DeadCivilianCount";
        if !isdedicated then {
          SHK_DeadCivilianCount call SHK_fnc_deadCivilians;
        };
      }];
    };
  } foreach allunits;
};
if !isdedicated then {
  "SHK_DeadCivilianCount" addpublicvariableeventhandler { (_this select 1) call SHK_fnc_deadCivilians 
};

[player,200,10,10,3,6,-0.3,0.1,0.3,1,1,1,30,10,15,true,0.4,0.5,0.025,0,0,0,0,24] execFSM "Fog.fsm";