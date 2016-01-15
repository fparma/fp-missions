#define PREFIX CUL
#define COMPONENT common

#ifdef DEBUG_MODE_FULL
	#undef DEBUG_MODE_FULL
#endif
#ifdef DEBUG_MODE_NORMAL
	#undef DEBUG_MODE_NORMAL
#endif
#ifndef DEBUG_MODE_MINIMAL
	#define DEBUG_MODE_MINIMAL
#endif

#include "\x\cba\addons\main\script_macros_mission.hpp"
