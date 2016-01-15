_unit = _this select 0;
#include "_defineItems.sqf";

_unit forceAddUniform "U_nikosagedbody";
_unit addVest "V_Press_F";
_unit addHeadGear (_HEADGEARS select 0);

//#include "_after.sqf";