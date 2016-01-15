///////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: (AEF)Wolffy.au [CTB]
// Created: 20110315
// Contact: http://dev-heaven.net/projects/mip
// Purpose: Export settings for amibent civilian vehicles module
///////////////////////////////////////////////////////////////////

diag_log "----------";
diag_log "SILVIE default settings";
{
        diag_log format["%1 = %2", _x, BIS_silvie_mainscope getVariable _x];
} forEach [
        "townlist",
        "blackList",
        "vehicleRarity",
        "vehicleCount",
        "vehicleInit",
        "roadDistance",
        "attempts",
        "rarityurban"
];
diag_log "----------";
