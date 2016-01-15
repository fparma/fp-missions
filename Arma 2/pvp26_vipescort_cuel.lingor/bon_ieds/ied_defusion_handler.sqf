// by Bon_Inf*
/*
	Whenever a player defuses an IED, this script is executed on server side,
	getting the position of the IED that has been defused as parameter.

	Make sure lines 3 to 7 in defuse.sqf are not commented out.
*/


if(not isServer) exitWith{};

_iedpos = _this;




/********************************************************/
/******************** CUSTOM STUFF **********************/
/********************************************************/