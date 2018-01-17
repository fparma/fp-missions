#define DEBUG
#include "../script_macros.hpp"

#define GET_FROM_SAVE(v) ([GVAR(save), v] call CBA_fnc_hashGet)
