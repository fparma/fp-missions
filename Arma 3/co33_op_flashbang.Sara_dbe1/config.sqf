// Only allow people with map tools to draw on briefing (true = everyone can draw)
ACE_maptools_EveryoneCanDrawOnBriefing = false;

// Amount of respawns, -1 = infinite, 0 = no respawn. Can also be higher
FP_JRM_respawns = 0;

// Units (object names, comma separated) that can start the mission from cold start
// If FP_coldStartCanStart is empty string (""), cold start is never activated.
FP_coldStartCanStart = "gm, actual";
// Units that can move during cold start (object names, comma separated)
FP_coldStartCanMove = "gm, actual, amed, a0, b0, c0, d0, d1, engi1, engi2, combatcam0, combatcam1";

FP_VD = 2000; // View distance
FP_OVD = 1800; // object view distance

// Players (object names) that gets higher viewdistance in aircrafts
FP_pilots = "p0, p1";

// Flag teleport targets in format [Display name, objectName]
FP_flagTargets = [
    ["Actual", "actual"],
    ["Alpha SQL", "a0"],
    ["Bravo SQL", "b0"],
    ["Charlie SQL", "c0"]
];

// The default gear script file. This is a file inside gear\loadouts
FP_gearDefault = "deltahawk_m4m16";
