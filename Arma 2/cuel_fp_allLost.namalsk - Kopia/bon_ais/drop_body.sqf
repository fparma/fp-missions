_dragee	= _this select 3; 
_dragger = _this select 1;

detach _dragger;
detach _dragee;

_dragger playAction "released";
_dragee setVariable ["dragger",ObjNull,true];

_dragger removeAction dropaction;
dropaction = nil;