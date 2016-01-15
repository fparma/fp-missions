private ["_id","_unit"];
_id = _this select 2;
_unit = _this select 1;
_unit removeAction _id;

_unit setPosATL [((getPosATL president) select 0)-1.8, ((getPosATL president) select 1)+1.8, (getPosATL president select 2)];
_unit setdir ([_unit,getpos president] call BIS_fnc_dirTo);

_unit playMove "ActsPercSnonWnonDnon_tableSupport_TalkA";
[nil,president,"loc", rSwitchMove, "ActsPercSnonWnonDnon_tableSupport_TalkB"] call RE;

//didn't work in MP
//president playMove "ActsPercSnonWnonDnon_tableSupport_TalkB";

sleep 40;

if (alive _unit) then {
visitPresident = true; publicVariable "visitPresident";
};
