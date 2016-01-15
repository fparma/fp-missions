MCC_fnc_setVehicleInit  = 
{
private ["_unit","_unitinit"];
_unit = if (((_this select 0) select 0) == "") then {(_this select 0) select 1} else {objectFromNetID ((_this select 0) select 0)};
_unitinit = _this select 1;
_unit call compile format ["%1",_unitinit];
};

if (!isServer) exitWith {};
MCC_align3D = false;
_spawn = 
{
private ["_pos", "_dir","_class","_type","_faction","_unitspawned","_dummy","_notEmpty","_init","_name","_dummyGroup"];
_pos 	 = _this select 0;
_dir 	 = _this select 1;
_class	 = _this select 2;
_type	 = _this select 3;
_faction = _this select 4;
_notEmpty	 = _this select 5;
_init	 = _this select 6;
_name	 = _this select 7;
switch (_type) do
{
case "MAN":	
{
if (_faction=="GUE") then {_unitspawned = createGroup resistance;};
if (_faction=="WEST") then {_unitspawned = createGroup west;};							
if (_faction=="EAST") then {_unitspawned = createGroup east;};
if (_faction=="CIV") then {_unitspawned = createGroup civilian;};
_dummy = _unitspawned createUnit [_class, _pos, [], 0, "NONE"];
_dummy setpos _pos;
_dummy setdir _dir;
sleep 0.01;
if (!MCC_align3D) then {_dummy setpos _pos};
_unitspawned setformdir _dir; 
};
case "ANIMAL":	
{
_unitspawned = createGroup sidelogic;
_dummy = _unitspawned createUnit [_class, _pos, [], 0, "NONE"];
_dummy setpos _pos;
_dummy setdir _dir;
sleep 0.01;
if (!MCC_align3D) then {_dummy setpos _pos};
_unitspawned setformdir _dir; 
};

case "VEHICLE":	
{
if (_notEmpty) then
{
if (_faction=="GUE") then  {_dummy 		=	[_pos, _dir, _class, resistance] call BIS_fnc_spawnVehicle;};										
if (_faction=="WEST") then { _dummy 	=	[_pos, _dir, _class, WEST] call BIS_fnc_spawnVehicle;};
if (_faction=="EAST") then { _dummy 	=	[_pos, _dir, _class, EAST] call BIS_fnc_spawnVehicle;};										
if (_faction=="CIV") then { _dummy	 	=	[_pos, _dir, _class, civilian] call BIS_fnc_spawnVehicle;};
} else
{
_dummy = _class createvehicle _pos;
_dummy setpos _pos;
_dummy setdir _dir;
sleep 0.01;
if (!MCC_align3D) then {_dummy setpos _pos};
};
};

case "AMMO":	
{
_dummy = _class createvehicle _pos;
_dummy setpos _pos;
_dummy setdir _dir;
sleep 0.01;
if (!MCC_align3D) then {_dummy setpos _pos};
};

case "MINES":	
{
_dummy = createMine [_class, _pos, [], 0];
_dummy setpos _pos;
_init = format ["%1;_this setdir %2;",_init,_dir];
sleep 0.01;
};
};
if (_name != "") then {missionNameSpace setVariable [_name,_dummy]};
if (_init != "") then {[[[netID _dummy,_dummy], _init], "MCC_fnc_setVehicleInit", true, true] spawn BIS_fnc_MP;};
_dummy
};	


_veh = [[2898.67,3156.35,0], 220.927, 'Land_Obstacle_Ramp_F', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2896.47,3158.26,0], 220.927, 'Land_Obstacle_Ramp_F', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2894.39,3164.79,0], 218.393, 'Land_Obstacle_Ramp_F', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2892.97,3165.86,0], 218.393, 'Land_Obstacle_Ramp_F', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2946.38,3250.17,0], 181.746, 'Land_HBarrier_large', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2963.85,3225.69,0], 25.8406, 'Land_HBarrier_large', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2878.42,3268.78,0], 25.834, 'Land_HBarrier_large', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2861.46,3213.37,0], 62.0257, 'Land_HBarrier_large', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2991.96,3169.03,0], 62.0487, 'Land_HBarrier_large', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[3014.42,3191.94,0], 87.7776, 'Fort_RazorWire', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[3013.99,3200.03,0], 87.7804, 'Fort_RazorWire', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[3013.67,3208.48,0], 87.7844, 'Fort_RazorWire', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[3013.54,3216.75,0], 87.7851, 'Fort_RazorWire', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[3013.81,3180.37,0], 107.062, 'Fort_RazorWire', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2871.7,3103.87,0], 162.699, 'Land_Timbers_F', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2941.14,3218.95,0], 162.753, 'Land_Timbers_F', 'AMMO', 'CIV', true, '', ''] call _spawn;
MCC_align3D=true;publicVariable 'MCC_align3D';MCC_align3D=false;publicVariable 'MCC_align3D';
_veh = [[2879.56,3236.33,0], 93.0637, 'Land_Timbers_F', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2861.89,3299.07,0], 93.0306, 'Land_Timbers_F', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2932.25,3210.34,0], 93.1057, 'Land_Bricks_V1_F', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2970.05,3182.82,0], 93.105, 'Land_Bricks_V1_F', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2948.09,3180.31,0], 93.1077, 'Land_Bricks_V1_F', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2903.62,3255.55,0], 113.32, 'Misc_Cargo1B_military', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2910.34,3255.25,0], 113.319, 'Misc_Cargo1B_military', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2916.06,3240.61,0], 140.957, 'Misc_Cargo1Bo_military', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2946.98,3248.12,0], 179.659, 'Land_CamoNet_EAST', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2989.49,3185.69,-0.3], 116.692, 'Land_Barrack2', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2991.91,3193.74,-0.3], 98.1541, 'Land_Barrack2', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2870.5,3275.45,-0.3], 215.868, 'Land_GuardShed', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2998.45,3200.13,-0.3], 215.928, 'Land_Antenna', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2925.27,3240.58,-0.3], 215.868, 'Misc_cargo_cont_small2', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2925.44,3236.55,-0.3], 306.126, 'Misc_cargo_cont_small2', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2914.25,3204.18,4.2], 287.605, 'Misc_cargo_cont_small2', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2882.05,3200.39,2.38419e-007], 267.943, 'Misc_cargo_cont_net3', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2870.46,3280.64,2.38419e-007], 246.498, 'PowGen_Big', 'AMMO', 'CIV', true, '', ''] call _spawn;

MCC_align3D=true;publicVariable 'MCC_align3D';
_veh = [[2978.62,3271.87,-0.9], 23.8004, 'Bunker_PMC', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2951.89,3248.79,2.38419e-007], 23.9753, 'Land_Pallet_MilBoxes_F', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2944.89,3247.69,2.38419e-007], 23.9866, 'Land_PaperBox_closed_F', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2927.27,3202.52,3.6], 23.9452, 'Land_PaperBox_closed_F', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2902.04,3231.13,4.5], 30.8408, 'Land_PaperBox_closed_F', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2921.37,3222.66,3.9], 301.292, 'Land_ScrapHeap_1_F', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2889.3,3284.31,2.38419e-007], 198.972, 'Land_fort_rampart_EP1', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2952.02,3163.11,2.38419e-007], 11.8875, 'Land_fort_rampart_EP1', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2962.86,3158.76,2.38419e-007], 22.5423, 'Land_fort_rampart_EP1', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2986.31,3150.55,0.3], 338.229, 'Land_fort_rampart_EP1', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2934.86,3197.89,-0.3], 249.181, 'Land_fort_bagfence_long', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2939.25,3206.21,-0.3], 172.086, 'Land_fort_bagfence_long', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2942.58,3193.28,-0.3], 211.369, 'Land_fort_bagfence_long', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2945.85,3193.54,-0.3], 151.136, 'Land_fort_bagfence_long', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2958.24,3227.36,-0.3], 197.114, 'Land_fort_bagfence_long', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2960.7,3243.74,-0.3], 239.558, 'Land_fort_bagfence_long', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2913.63,3251.76,-0.3], 239.56, 'Land_fort_bagfence_long', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2898.86,3255.82,-0.3], 191.301, 'Land_fort_bagfence_long', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2873.33,3237.05,-0.3], 191.298, 'Land_fort_bagfence_long', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2877.63,3201.26,-0.3], 188.339, 'Land_fort_bagfence_long', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2890.89,3168.35,-0.3], 287.267, 'Land_fort_bagfence_long', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2874.17,3174.1,-0.3], 222.363, 'Land_fort_bagfence_long', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2871.5,3171.3,-0.3], 222.363, 'Land_fort_bagfence_long', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2871.82,3187.66,-0.3], 222.35, 'Land_fort_bagfence_long', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2922.12,3200.07,3.6], 41.9977, 'Land_BagFenceRound', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2931.62,3206.26,3.3], 220.271, 'Land_BagFenceRound', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2931.61,3218.36,3.3], 271.623, 'Land_BagFenceRound', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2918.28,3204.74,3.9], 271.629, 'Land_BagFenceRound', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2930.37,3216.08,3.3], 331.727, 'Land_BagFenceRound', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2894.24,3227.63,4.8], 113.85, 'Land_BagFenceRound', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2890.9,3210.99,5.1], 113.86, 'Land_BagFenceRound', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2898.82,3215.31,4.8], 216.87, 'Land_BagFenceRound', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2939.39,3185.59,2.38419e-007], 57.3407, 'Land_BagFenceRound', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2930.47,3166.98,2.38419e-007], 57.3408, 'Land_BagFenceRound', 'AMMO', 'CIV', true, '', ''] call _spawn;
MCC_align3D=false;publicVariable 'MCC_align3D';
_veh = [[2917.86,3158.07,2.38419e-007], 179.545, 'Land_BagFenceRound', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2916.44,3177.39,2.38419e-007], 179.515, 'Land_BagFenceRound', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2838.47,3229.8,2.38419e-007], 204.969, 'Land_BagFenceRound', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2915.69,3212.54,0.3], 22.5223, 'Land_BagFenceRound', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2892.34,3148.13,1.2], 216.776, 'Land_WoodenRamp', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2891.1,3146.43,0], 216.748, 'Land_WoodenRamp', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2935.67,3207.7,2.38419e-007], 69.2422, 'TargetEpopup', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2944.36,3191.69,2.38419e-007], 152.702, 'TargetEpopup', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2919.1,3226.48,2.38419e-007], 43.5148, 'TargetEpopup', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2915.8,3240.46,0.3], 141.998, 'TargetEpopup', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2888.33,3250.78,2.38419e-007], 141.975, 'TargetEpopup', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2887.22,3254.39,2.38419e-007], 288.906, 'TargetFakeTank', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2955.18,3156.28,2.38419e-007], 204.093, 'TargetFakeTank', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2888.35,3232.36,2.38419e-007], 176.964, 'TargetFakeTank', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2835.87,3189.43,2.38419e-007], 246.784, 'TargetFakeTank', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2865.84,3185.21,2.38419e-007], 187.344, 'TargetFakeTank', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2996.38,3227.02,2.38419e-007], 129.21, 'TargetFakeTank', 'AMMO', 'CIV', true, '', ''] call _spawn;

_veh = [[2904.61,3156.49,2.38419e-007], 189.564, 'TargetFakeTank', 'AMMO', 'CIV', true, '', ''] call _spawn;
