Some functions are in this template.
Below is a description on how to use and call them.

Note that they should only be called from the SERVER or a SINGLE client (not a global trigger etc). If you don't know how to do this, ask Cuel.

FP_fnc_switchMove
Takes an object and animation name. Plays the switchMove globally. Example:
[player,"acts_CrouchingFiringLeftRifle01"] call FP_fnc_switchMove;

FP_fnc_addAction 
Takes an object and ARRAY. Adds action globally. Example:
[theVIP,["<t color='#ffff00'>[ Free VIP ]</t>","free.sqf",0, 100, true, true,"","_this distance _target < 4 && vehicle player == player"]] call FP_fnc_addAction;
OR : 
[player,["Free Me","free.sqf"]] call FP_fnc_addAction;
actions are added for join in progress players.

FP_fnc_removeAction
Takes an object and an integer (number), removes action (globally). Also removes it for jips.
Remember that addAction returns an integer, alternatively it is the second (_this select 2) argument in whatever script that runs from an addAction. Example:
[theVIP,0] call FP_fnc_removeAction;

FP_fnc_hint
Takes a String (or array) and sends it globally. Example:
"Hello World" call FP_hint;
["Hello World"] call FP_fnc_hint;