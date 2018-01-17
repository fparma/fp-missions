
if (!hasInterface) exitWith {};

// Fix so player can't join "ENEMY" side
player addEventHandler ["HandleRating", {
  abs (_this select 1);
}];

player createDiaryRecord ["Diary", ["Mission", "
<br /> No respawn
<br /> JIP. If a unit dies - possible to rejoin in different slot.
<br /> Spectator
<br /><br />
This mission has no direct tasks and you have to investigate interesting areas. Looks for notes and clues, use your head.
"]];

player createDiaryRecord ["Diary", ["Background", "
<br />
You are refugees escaping from a bad country. Your boat capsized near an island called Malden. It's the middle of night and you are low on supplies.<br /><br />
There is a town directly west, maybe it has something...
"]];

plId = [["<t color='#00FF00'>Read note</t>", {
  [plId] call CBA_fnc_removePlayerAction;
  player createDiaryRecord ["Diary", ["Note from laptop", "<br /> 3rd april. Last night we lost several fighters. We buried them down the road. God please help us!
  <br /><br />5th april. Food is running out. Jefe said he saw the military had set up some stronghold down the main road south, near the hangars. They weren't friendly and he came back with a bullet wound in his hand. Not many of them tho. Should be an easy pick later on.
  <br /><br />6th april. Had a run in with the military. I counted 2 guys. They were scavenging fuel from a nearby truck half a click south east, they had to leave due to raiders. Note to self: Bring the toolkit from the lada outside in order to repair the truck. Maybe we can use it to ... go somewhere.
  <br /><br />7th april. Got no food. I saw some bananas in the town, going to try go get them."]];
  hintSilent "Note added to briefing";
  //We're running low on food. I'm going to go get bananas from the local supply.<br />
}, 0, 99, false, true, "", "player distance laptop < 4"]] call CBA_fnc_addPlayerAction;

plId2 = [["<t color='#00FF00'>Read military note</t>", {
  [plId2] call CBA_fnc_removePlayerAction;
  player createDiaryRecord ["Diary", ["Note from military laptop", "<br />We managed to gather enough fuel, Jerry and Berry took the fuel truck down to the east harbor. We can finally leave. Me and Larry and just picking up the last guns."]];
  hintSilent "Note added to briefing";
  //We're running low on food. I'm going to go get bananas from the local supply.<br />
}, 0, 99, false, true, "", "player distance laptop2 < 4"]] call CBA_fnc_addPlayerAction;

if (isnil "fp_dead") then {
  fp_dead = [];
};

fp_strPlayer = tolower (str player);
player addEventHandler ["Killed", {
  if (!(fp_strPlayer in fp_dead)) then {
    fp_dead pushBack fp_strPlayer;
    publicVariable "fp_strPlayer";
  };
}];

player addEventHandler ["Respawn", {
    [player, true] call ace_spectator_fnc_stageSpectator;
    [true] call ace_spectator_fnc_setSpectator;
}];

fnc_fog = {
  params ["_target"];
  [
    _target, // unit to follow
    100, // max dist
    11, // min dist
    10, // cloud count
    3, // min size of cloud
    7, // max size of cloud
    -0.3, // height of clouds atl
    0.1, // respawn time of cloud
    0.3, // transparency
    0.9,0.9,1, // color 
    13, //  remove speed of cloud
    12, // min life time
    15, //  max life time
    false, //  ENABLE affected by wind
    0.3, //  wind: strength
    2.1, // wind: random dir period
    0.1, // wind: random dir intensity
    0,0.2,0.1, // wind: XYZ movement. ENABLE have to be false
    0, // start clouds day time
    24 // end clouds daytime
  ] call fpz_api_fnc_fog;
};

if (fp_strPlayer != "zeus") then {
  [player] call fnc_fog;
};

if (fp_strPlayer in fp_dead) then {
  [] spawn {
    sleep 0.4;
    [player, true] call ace_spectator_fnc_stageSpectator;
    [true] call ace_spectator_fnc_setSpectator;
  };
} else {
  call compile preprocessFileLineNumbers "gear.sqf";
  if (CBA_missionTime > 120) then {
    private _leader = leader group player;
    private _plrs = ([] call CBA_fnc_players) select {simulationEnabled _x};
    private _target = [selectRandom _plrs, _leader] select (_leader in _plrs);
    player setPosAtl (_target modelToWorld [0,-1.4,0]);
    {player reveal [_x, 4]} forEach nearestObjects [player, ["All"], 100];
  };
};

