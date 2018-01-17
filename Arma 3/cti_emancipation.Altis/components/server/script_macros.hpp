#define GET_FROM_SAVE(v) ([GVAR(save), v] call CBA_fnc_hashGet)

#define GET_PROFILE_VAR(v) (profileNamespace getVariable [QGVAR(v), []])
#define SET_PROFILE_VAR(v, val) (profileNamespace setVariable [QGVAR(v), val])
