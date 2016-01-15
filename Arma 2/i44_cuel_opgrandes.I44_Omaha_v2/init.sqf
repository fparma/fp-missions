if (!isDedicated && isNull player) then { waitUntil {!isNull player}; };

server execVM "revive_init.sqf";
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";	

[[
["task1", "Destroy Communications","<br><br/>In order for your mission to as easy as possible, you must take out the German radio tower located inside Cabourg. If you do not take out this tower, it's likely that the Germans will call for reinforcements. You must be swift during your assault of Cabourg. Intel shows that the town is lightly guarded.<br><br/><br><br/>",true,["task1",(getmarkerpos "cabourg"),"hd_destroy","ColorRed","Destroy Communications"]],
["task2", "Assault Colleville","<br><br/>Your main objective is Colleville. It serves as a depot for German troops. It's supposed to be well guarded however reports tell us that a lot of German troops has left the town last week, but be on your guard.<br><br/><br><br/>When the town is secured, destroy all of value.<br><br/><br><br/>",true,["task2",(getmarkerpos "colleville"),"mil_objective","ColorRed","Assault"]],
["task3", "Find intel","<br><br/>Reports show that a highly ranked German officer has been visiting small a village close to Colleville. If he is carrying any kind of intel you must secure it.<br><br/><br><br/>",true,["task3",(getmarkerpos "smalltown"),"mil_pickup","ColorRed","Find intel"]]
],[
["Credits","Made by cuel for FP Arma 2."],
["Mission notes", "<br><br/>The Germans never expected this. During the night, a British Commando united was paradropped in Omaha, near the beach. Even though this place is a German stronghold, most of the troops are scattered around the area. Get in, get the job done and get out. <br><br/>Simple.<br><br/>"]
]]execVM "shk_taskmaster.sqf";


if(not isDedicated) then{
	player setVariable ["BIS_noCoreConversations", true];
	player enableGunLights false;
};

if (isServer) then {
	["Respawn", true] call CBA_fnc_setMarkerPersistent;


		ammocrate addEventHandler ["handleDamage", {
			_damage = _this select 2; 
			_unit = _this select 0;
			if (_damage <0.3) then {ammocrate setDamage 0;}else{antenna setDamage 1;com setDamage 1;net setDamage 1; [nil, antenna, "per", rHideObject, true] call RE;[nil, table, "per", rHideObject, true] call RE; ["task1", "succeeded"] call SHK_Taskmaster_upd;"Respawn" setmarkerpos (getpos cabourgrespawn)};
			_damage
		}];
		
		//fill boxes
		clearWeaponCargoGlobal box1;
		clearWeaponCargoGlobal box3;
		clearMagazineCargoGlobal box1;
		clearMagazineCargoGlobal box3;
		
		box1 addWeaponCargoGlobal ["I44_MG34", 1];
		box1 addMagazineCargoGlobal ["I44_50rd_792x57_Mix_MG34", 4];
		box1 addWeaponCargoGlobal ["I44_PzFaust60", 2];
		box1 addMagazineCargoGlobal ["I44_Rocket_149mm_PzF_60", 4];
		box1 addWeaponCargoGlobal ["I44_MP40", 3];
		box1 addMagazineCargoGlobal ["I44_32rd_9x19_Ball_MP40", 4];
		box1 addWeaponCargoGlobal ["I44_K98k_GGrGer", 2];
		box1 addMagazineCargoGlobal ["I44_RifleGrenade_GSprgr", 4];
		box1 addMagazineCargoGlobal ["I44_5rd_792x57_Mix_K98", 10];
			
		box3 addWeaponCargoGlobal ["I44_K98k", 8];
		box3 addMagazineCargoGlobal ["I44_5rd_792x57_Mix_K98", 40];
		box3 addWeaponCargoGlobal ["I44_G43", 5];
		box3 addMagazineCargoGlobal ["I44_10rd_792x57_Ball_G43", 4];
		box3 addMagazineCargoGlobal ["I44_HandGrenade_StiHgr24", 8];
		//
		[]spawn {
		while {officer distance officerlocation < 40 && alive officer} do {sleep 5};
			if (alive officer) then {
				_mark = createMarker ["officermarker", [(getPosATL officer select 0),(getPosATL officer select 1)]];
				_mark setMarkerShape "ICON";
				_mark setMarkerType "Dot";
				_mark setMarkerColor "ColorRed";
				_mark setMarkerText " Officer";
				_mark spawn { while {alive officer} do {
					_this setMarkerPos (getPos officer);
					sleep 5;
					};
			};
		};
		};
		
		[]spawn {
		waitUntil {sleep 4; !alive officer};
		_exit = false;
		while {!_exit} do {
		sleep 0.5;
		if ((items officer) find "EvMap" == -1) then {_exit = true};
		};
		["task3", "succeeded"] call SHK_Taskmaster_upd;
		deleteMarker "officermarker";

		while {!("task1" call SHK_Taskmaster_isCompleted) || !("task2" call SHK_Taskmaster_isCompleted) } do {sleep 2};
		sleep 5;
		//make sure script doesnt crash
		if (isNil "s") then {s= objNull};
		if (isNil "s_2") then {s_2= objNull};
	    if (isNil "s_8") then {s_8= objNull};
		if (isNil "s_10") then {s_10= objNull};

		PAPABEAR = [West,"HQ"];
		[-2, {PAPABEAR sideChat _this}, "STRIKE TEAM, THIS IS CROSSROAD. MESSAGE IN 10."] call CBA_fnc_globalExecute;
		if (alive s_2) then {
		[[s_2], "messageinten"] call CBA_fnc_globalSay;
		}else{
		[[s], "messageinten"] call CBA_fnc_globalSay;		
		};
		if (alive s_10) then {
		[[s_10], "messageinten"] call CBA_fnc_globalSay;
		}else{
		[[s_8], "messageinten"] call CBA_fnc_globalSay;		
		};
	
		sleep 10;
		[-2, {PAPABEAR sideChat _this}, "A JOB WELL DONE. PROCEED TO THE BEACH FOR EXTRACTION. CROSSROAD OUT."] call CBA_fnc_globalExecute;
				if (alive s_2) then {
		[[s_2], "jobwelldone"] call CBA_fnc_globalSay;
		}else{
		[[s], "jobwelldone"] call CBA_fnc_globalSay;		
		};
		if (alive s_10) then {
		[[s_10], "jobwelldone"] call CBA_fnc_globalSay;
		}else{
		[[s_8], "jobwelldone"] call CBA_fnc_globalSay;		
		};
		sleep 10;
		["task4","Extract","Well done! Time has come to for you to pull out. Get to the beach for extraction by boat!",true,["task4",(getmarkerpos "beach"),"hd_start","ColorBlue","Escape"]] call SHK_Taskmaster_add;
		};
		
};

// world initialization before mission is launched. 
finishMissionInit;