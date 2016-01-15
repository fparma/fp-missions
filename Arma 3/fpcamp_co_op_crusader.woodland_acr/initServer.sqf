/*
	Executed only on server when mission is started.
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.
*/

createCenter west;
createCenter east;
createCenter resistance;
createCenter civilian;

// clean up script
// will not delete units dead on mission start
// will not delete units where "this setVariable ["fp_noDelete", true]"
[] execVM "src\cleanup\clean.sqf";

{
	_mrk = createMarker [format ["mine_%1",_forEachIndex],_x];
	_mrk setMarkerShape "ICON";
	_mrk setMarkerType "MinefieldAP";
	if (0 == _foreachindex) then {
		_mrk setMarkerColor "ColorBlack";
	}
} foreach [[3911.91,2792.05,0.00146484],[4828.61,3205.18,0.00144577],[5320.1,2613.76,0.00138092],[5949.55,2510.76,0.00145769]];


_mines = [
	[5903.54,2487.82],
	[5934.89,2508.78],
	[5957.45,2512.39],
	[5979.75,2526.94],
	[5326.33,2604.12],
	[5314.53,2624.51],
	[5957.45,2512.39],
	[5979.75,2526.94],
	[5326.33,2604.12],
	[5314.53,2624.51],
	/*[3917.86,2786.11],
	[3923.03,2785.64],
	[3926.99,2781.38],
	[3879.76,2807.52],
	[3908.48,2797.95],*/
	[4830.1,3209.34],
	[4832.49,3197.98],
	[4822.98,3211.97],
	// south of moutanin
	[3159.55,1927.74,0.00143528],[3166.87,1923.42,0.00143862],[3166.43,1911.33,0.001441],[3258.66,1701.13,0.00144672],[3260.71,1710.34,0.001441],[3255,1712.03,0.00146055],
	// farm
	[2615.83,2536.58,0.00144577],[2617.7,2540.17,0.00145245],[2623.17,2544.5,0.00148821]
];
{
	_mine = createMine ["ATMine", _x, [], 0];
	if (isOnRoad _x) then {
		_mine setPosATL [_x select 0, _x select 1,(getposatl _mine select 2) + 0.03];
	};
	_mine call FP_fnc_addCuratorObject;
	sleep 0.2;
} foreach _mines;

{
	_x addCuratorEditableObjects [vehicles,true];
	_x addCuratorEditableObjects [(allMissionObjects "Man"),false];
	_x addCuratorEditableObjects [(allMissionObjects "Air"),true];
	_x addCuratorEditableObjects [(allMissionObjects "Ammo"),false];
	_x addCuratorEditableObjects [allMines,false];
}forEach allCurators;
