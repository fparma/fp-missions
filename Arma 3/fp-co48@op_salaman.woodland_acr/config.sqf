// Use clean up script. See base\scripts\clean_up
FP_use_cleanUp = true;

// Seconds when unit respawns before the TP flag can be used, if there is a flag
FP_respawnTeleportDelay = 180;

//Units that should have longer view distance when flying. Unit names in strings
FP_pilotNames = ["p1", "p2"];

// Players that are given the option to start the mission, comma separated strings representing object name
// Empty array ([])  = disabled. Weapons are hot from the go, and no players will locked to a 20m circle until mission has started.
FP_lockStarters = ["gm", "gm2","actual"];

// Object names that will not be locked in a 20m circle when mission is under "lock", as in, it has not started.
// Ignored if FP_lockStarters is an empty array
// If empty, squad leaders can move by default
FP_lockCanMove = ["gm", "actual", "act1", "act2", "a0", "b1", "c1", "d0","engi1", "f1", "f2", "crew11", "crew21", "crew22","crew31","crew32","crew41","crew42","crew52","crew51"];


// === Join in progress (JIP) and respawn manager (JRM) parameters === //

// If enabled at all, no other settings matter if this is not true. NOTE: Respawn must be BASE when using JRM
FP_JRM_enabled = false;

// Amount of times player can respawn. -1 = unlimited
FP_JRM_amountLives = -1;

//Seconds before JiP will not be possible anymore */
FP_JRM_timeBeforeJIPNotPossible = -1; // -1 disabled

// If JIP player should be teleported to his group, or if no group members, players on his side
FP_JRM_JIPTeleport = false;

// === END JRM parameters === //
