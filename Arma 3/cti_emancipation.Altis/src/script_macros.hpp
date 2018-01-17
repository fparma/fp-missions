#define PREFIX CUL

#define QUOTE(v) #v
#define DOUBLES(v1,v2) ##v1##_##v2
#define TRIPLES(v1,v2,v3) ##v1##_##v2##_##v3

#define GVAR(v) DOUBLES(PREFIX,v)
#define QGVAR(v) QUOTE(GVAR(v))

#define GETPVAR(v) profileNamespace getVariable [QGVAR(v), []]
#define SETPVAR(v, val) profileNamespace setVariable [QGVAR(v), val];

#define FUNC(v) TRIPLES(PREFIX,fnc,v)
#define QFUNC(v) QUOTE(FUNC(v))

#define INC(v) v = (v) + 1
#define DEC(v) v = (v) - 1

#define RETNIL(VARIABLE) if (isNil{VARIABLE}) then {nil} else {VARIABLE}
#define PFORMAT_1(MESSAGE,A) format ['%1: A=%2', MESSAGE, RETNIL(A)]
#define PFORMAT_2(MESSAGE,A,B) format ['%1: A=%2, B=%3', MESSAGE, RETNIL(A), RETNIL(B)]
#define PFORMAT_3(MESSAGE,A,B,C) format ['%1: A=%2, B=%3, C=%4', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C)]
#define PFORMAT_4(MESSAGE,A,B,C,D) format ['%1: A=%2, B=%3, C=%4, D=%5', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D)]

#define WARNING(MESSAGE) [_fnc_scriptName, __LINE__, ('WARNING: ' + MESSAGE)] call CBA_fnc_log
#define ERROR(MESSAGE) [_fnc_scriptName, __LINE__, "ERROR", MESSAGE] call CBA_fnc_error;

#ifdef DEBUG
  #define LOG(MESSAGE) [__FILE__, __LINE__, MESSAGE] call CBA_fnc_log
  #define TRACE_1(MESSAGE,A) [__FILE__, __LINE__, PFORMAT_1(MESSAGE,A)] call CBA_fnc_log
  #define TRACE_2(MESSAGE,A,B) [__FILE__, __LINE__, PFORMAT_2(MESSAGE,A,B)] call CBA_fnc_log
  #define TRACE_3(MESSAGE,A,B,C) [__FILE__, __LINE__, PFORMAT_3(MESSAGE,A,B,C)] call CBA_fnc_log
  #define TRACE_4(MESSAGE,A,B,C,D) [__FILE__, __LINE__, PFORMAT_4(MESSAGE,A,B,C,D)] call CBA_fnc_log
#else
  #define LOG(MESSAGE)
  #define TRACE_1(MESSAGE,A)
  #define TRACE_2(MESSAGE,A,B)
  #define TRACE_3(MESSAGE,A,B,C)
  #define TRACE_4(MESSAGE,A,B,C,D)
#endif
