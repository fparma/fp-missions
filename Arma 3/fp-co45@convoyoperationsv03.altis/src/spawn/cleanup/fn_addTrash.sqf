_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _unit) exitWith {};
_unit setVariable ["fp_added",time];
FP_gc_queue set [count FP_gc_queue,_unit];