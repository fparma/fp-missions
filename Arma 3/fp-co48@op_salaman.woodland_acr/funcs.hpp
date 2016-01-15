version = 2.0.0;
createShortcuts = 1;

// BASE API. Do not remove
class FP_Base {
	#include "base\funcs.hpp"
};

// Anything below can be deleted if you do not want to use it.
// Rember to delete the dialogs (Line 10) from description.ext if they are deleted from xtra\dialogs

// Gear func
class FP_Gear {
	#include "gear\funcs.hpp"
};

// Xtras below

// Spawning functions
class FP_Spawn {
	#include "xtra\spawn\funcs.hpp"
};

// JiP and respawn manager funcs
class FP_JRM {
	#include "xtra\jrm\funcs.hpp"
};

// Spectate funcs
class F {
	#include "xtra\spect\funcs.hpp"
};
