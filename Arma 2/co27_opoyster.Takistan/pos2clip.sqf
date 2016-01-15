// pos2clip.sqf 
// Adds an action to print position & direction to clipboard.
// Put this in player init: 
// addAction ["Print Position", "xascripts\pos2clip.sqf"];
// the output will be in form of a setposATL and a setDir
// SSG Pap, 2012

_unit = _this select 0;
_pos1 = getpos _unit select 0;
_pos2 = getpos _unit select 1;
_pos3 = getposATL _unit select 2;
_dir = getDir _unit;

hintSilent format["%1\n%2\nAltitude: %3\nDir: %4",_pos1,_pos2,_pos3,_dir];
copyToClipboard format["this setposATL [%1,%2,%3]; this setDir %4;",_pos1,_pos2,_pos3,_dir];
