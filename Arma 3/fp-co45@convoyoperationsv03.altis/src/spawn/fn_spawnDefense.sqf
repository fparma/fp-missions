/*
///////////////////////////
	ARMA 3 Group defense script
	Version: 0.1
	Author: Cuel
	Created: 2013-10-13
	Purpose: Spawns a group at designated location with the specific amount.  Group will enter houses and static weapons
	Takes an array format ["TEAM",position,amount,radius,patrol (boolean)] call FP_spawnDefense;
	@param {String} - Team
	@param {Location | String | Object} - Location to spawn the group at
	@param {Int} - Amount of units
	@param {int} - Radius to patrol
	@param {Boolean} - Optional. Patrol the area or not
	Example: ["CSAT","myDefenseMarker",6,200,true] call FP_fnc_spawnDefense;
	@return {Group} -  Created group
///////////////////////////
*/

// 
// units man defenses and patrol area
if (!isServer) exitWith {};
private ["_grp","_radius","_patrol"];
_grp = _this call FP_fnc_spawnGroup;
_radius = [_this,3,150,[0]] call BIS_fnc_param;
_patrol = [_this,4,false,[false]] call BIS_fnc_param;
[_grp,_mrk,_radius,2,_patrol] call CBA_fnc_taskDefend;

_grp