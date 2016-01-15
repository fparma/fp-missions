///////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: (AEF)Wolffy.au [CTB]
// Created: 20110315
// Contact: http://dev-heaven.net/projects/mip
// Purpose: Export settings for amibent civilian module
///////////////////////////////////////////////////////////////////

diag_log "----------";
diag_log "ALICE2 default settings";
{
        diag_log format["%1 = %2", _x, BIS_alice_mainscope getVariable _x];
} forEach [
        "townlist",
        "spawnDistance", 
        "trafficDistance", 
        "civilianRarity", 
        "civilianCount", 
        "civilianActions", 
        "respectModifyCoef", 
        "threatDecay", 
        "ALICE_civilianinit",
        "townsFaction",
        "ALICE_alltowns",
        "ALICE_classes",
        "ALICE_classesVehicles",
        "ALICE_actions",
        "ALICE_topics",
        "ALICE_screams",
        "rarityurban",
        "ALICE_townsize",
        "initArray",
        "civilianActions",
        "civilianConversations",
        "blacklist"
];
diag_log "----------";


