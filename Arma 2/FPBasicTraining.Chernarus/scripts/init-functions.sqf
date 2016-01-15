//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: (AEF)Wolffy.au [CTB]
// Created: 20110315
// Contact: http://dev-heaven.net/projects/mip
// Purpose: Setup functions module
///////////////////////////////////////////////////////////////////

// Override default BIS_fnc_locations function with MIP patch
//  - Used town name variable to set unique marker ID in custom locations
BIS_fnc_locations = compile preprocessFileLineNumbers "CA\modules\functions\systems\fn_locations.sqf";

// See http://community.bistudio.com/wiki/Functions_Library