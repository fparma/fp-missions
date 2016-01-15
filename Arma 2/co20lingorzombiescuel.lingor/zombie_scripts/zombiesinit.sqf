//Zombie mission init script by Celery

cutText ["","BLACK FADED",1];

//Wait for JIP to load
waitUntil {(isDedicated) or (!isNull player)};

//Parameters
if (isNil "paramsArray") then {paramsArray=[2,0]};
CLY_friendlyfire=paramsArray select 0;
CLY_terraingrid=paramsArray select 1;

//Option to set terrain detail at start
if (!isDedicated) then {
	[] spawn {
		sleep 1;
		if (CLY_terraingrid==0) then {
			CLY_terrainaction0=player addAction ["Confirm terrain detail","cly_terraingrid.sqs",0,2.5,true,true,"",""];
			CLY_terrainaction1=player addAction ["Terrain detail: very low","cly_terraingrid.sqs",50,2.5,true,true,"",""];
			CLY_terrainaction2=player addAction ["Terrain detail: low","cly_terraingrid.sqs",25,2.5,true,true,"",""];
			CLY_terrainaction3=player addAction ["Terrain detail: medium","cly_terraingrid.sqs",12.5,2.5,true,true,"",""];
			CLY_terrainaction4=player addAction ["Terrain detail: high","cly_terraingrid.sqs",6.25,2.5,true,true,"",""];
			CLY_terrainaction5=player addAction ["Terrain detail: very high","cly_terraingrid.sqs",3.125,2.5,true,true,"",""];
		} else {
			if (CLY_terraingrid>0) then {setTerrainGrid CLY_terraingrid};
		};
	};
} else {
	setTerrainGrid 50;
};

//Random zombie classname
CLY_randomzombie={
	_selected=false;
	_zombie=CLY_zombieclasses select floor random count CLY_zombieclasses;
	while {typeName _zombie=="ARRAY"} do {
		_zombie=_zombie select floor random count _zombie;
	};
	_zombie;
};

//Random armored zombie classname
CLY_randomarmoredzombie={
	_zombie=CLY_armoredzombieclasses select floor random count CLY_armoredzombieclasses;
	while {typeName _zombie=="ARRAY"} do {
		_zombie=_zombie select floor random count _zombie;
	};
	_zombie;
};

//Zombie damage handling
CLY_zombiehandledamage={
	_zombie=_this;
	_armored=_zombie getVariable "zombietype" in ["armored","slow armored"] or typeOf _zombie in CLY_armoredzombieclasses;
	if (!_armored) then {
		_zombie addEventHandler [
			"HandleDamage",
			{
				_unit=_this select 0;
				_damage=_this select 2;
				_gethit=[0,0,0,0];
				if (!isNil {_unit getVariable "gethit"}) then {_gethit=_unit getVariable "gethit"} else {_unit setVariable ["gethit",[0,0,0,0]]};
				switch (_this select 1) do {
					case "":{_damage=damage _unit+_damage*0.1};
					case "head_hit":{_damage=(_gethit select 0)+(_damage-(_gethit select 0))*2;_gethit set [0,_damage];_unit setVariable ["gethit",_gethit]};
					case "body":{_damage=(_gethit select 1)+(_damage-(_gethit select 1))*0.25;_gethit set [1,_damage];_unit setVariable ["gethit",_gethit]};
					case "legs":{_damage=(_gethit select 3)+(_damage-(_gethit select 3))*0.45;_gethit set [3,_damage];_unit setVariable ["gethit",_gethit]};
				};
				if (_this select 3!=_unit) then {
					_unit setVariable ["victim",_this select 3];
				};
				_damage;
			}
		];
	} else {
		_zombie addEventHandler [
			"HandleDamage",
			{
				_unit=_this select 0;
				_damage=_this select 2;
				_gethit=[0,0,0,0];
				if (!isNil {_unit getVariable "gethit"}) then {_gethit=_unit getVariable "gethit"} else {_unit setVariable ["gethit",[0,0,0,0]]};
				switch (_this select 1) do {
					case "":{_damage=damage _unit+_damage*0.05};
					case "head_hit":{_damage=(_gethit select 0)+(_damage-(_gethit select 0))*0.1;_gethit set [0,_damage];_unit setVariable ["gethit",_gethit]};
					case "body":{_damage=(_gethit select 1)+(_damage-(_gethit select 1))*0.1;_gethit set [1,_damage];_unit setVariable ["gethit",_gethit]};
					case "legs":{_damage=0};
				};
				if (_this select 3!=_unit) then {
					_unit setVariable ["victim",_this select 3];
				};
				_damage;
			}
		];
	};
};

//Disable saving
enableSaving [false,false];

//Weather
setViewDistance 300;
setWind [2,-2,true];

//CLY Remove Dead
[45,0] execVM "cly_removedead.sqf";
player setVariable ["CLY_removedead",false,true];



/////No dedicated after this/////
if (isDedicated) exitWith {};
/////No dedicated after this/////



//Put player in proper start position
[] spawn {
	sleep 1;
	//JIP
	player enableSimulation true;
	player setVelocity [0,0,0];
	player setPos [getPos player select 0,getPos player select 1,(getPosATL player select 2)-(getPos player select 2)];
	if (!isNil "CLY_jipresumepos" and !(typeOf player in CLY_deadcharacters)) then {
		player setPosATL CLY_jipresumepos;
	};
	if !(typeOf player in CLY_deadcharacters) then {
		sleep 0.5;
		cutText ["","BLACK IN",2];
		player setVariable ["CLY_addweapon",nil];
		player setVariable ["CLY_playerstates",true,true];
		sleep 15;
		player setVariable ["victim",nil,true];
		
	} else {
		player setPos [(getMarkerPos "respawn_civilian" select 0)-20+random 40,(getMarkerPos "respawn_civilian" select 1)-20+random 40,0];
	};
};

//Trigger spectator script when player is dead or already dead
[] spawn {
	waitUntil {!alive player or typeOf player in CLY_deadcharacters};
	[[],true] execVM "cly_spectate.sqf";
	if !(typeOf player in CLY_deadcharacters) then {
		CLY_deadcharacters set [count CLY_deadcharacters,typeOf player];
		publicVariable "CLY_deadcharacters";
	} else {
		titleText ["\n\nYour character is already dead.\nIf you wish to play, try another slot.","PLAIN",0.5];
	};
};



//---Accuracy boost---
//Activate accuracy boost
//Designed and recommended only for sidearms with a high spread.
CLY_accuracy=true;

//Minimum dispersion value in config before a handgun receives accuracy boost
CLY_mindispersion=0.002;

//Weapons that receive an accuracy boost regardless of type and dispersion
CLY_accuracyarray=[];

//Load the script
CLY_accuracyscript=compile preProcessFile "cly_accuracy.sqf";

//Event handler
player addEventHandler ["Fired",{_this call CLY_accuracyscript}];

//Update weapon direction
if (CLY_accuracy) then {
	[] spawn {
		_lasttime=0;
		while {true} do {
			sleep 0.02;
			CLY_weapondir=[player weaponDirection currentWeapon player,time,_lasttime];
			_lasttime=time;
		};
	};
};
//////////////////////



//Leave group
_group=createGroup civilian;
[player] join _group;

//Friendly fire damage modifier
if (CLY_friendlyfire!=1) then {
	player addEventHandler ["HandleDamage",{if (isPlayer (_this select 3) and (_this select 3)!=(_this select 0)) then {damage (_this select 0)+(_this select 2)*(CLY_friendlyfire*0.1)} else {_this select 2}}];
};

//Zombie face update for clients
[] exec "zombie_scripts\cly_z_textures.sqs";

//GPS markers
[] exec "cly_gps.sqs";

//CLY Jukebox

//Claw script
CLY_z_claw={
	_victim=_this select 0;
	_claw=_this select 1;
	if (player==_victim) then {
		titleRsc [format ["claw%1",_claw],"PLAIN"]
	} else {
		if (!isNil {player getVariable "spectating"}) then {
			if (player getVariable "spectating"==_victim) then {
				titleRsc [format ["claw%1",_claw],"PLAIN"];
			};
		};
	};
	true;
};

//Claw mark HUD
[] execVM "cly_hud.sqf";

//Public variable event handlers
"CLY_z_noisepv" addPublicVariableEventHandler {
	_var=_this select 1;
	_zombie=_var select 0;
	_zombie say3D (_var select 1);
};
"CLY_z_attackpv" addPublicVariableEventHandler {
	_var=_this select 1;
	_zombie=_var select 0;
	_sound=_var select 1;
	_anim=if (count _var>2) then {_var select 2} else {""};
	_object="HeliHEmpty" createVehicleLocal [0,0,0];
	_object attachTo [_zombie,[0,0,1.5]];
	_object say3D _sound;
	if (_anim!="") then {_zombie switchMove _anim};
	[_object] spawn {sleep 10;deleteVehicle (_this select 0)};
};
"CLY_z_victimpv" addPublicVariableEventHandler {
	_var=_this select 1;
	_victim=_var select 0;
	_sound=_var select 1;
	_claw=_var select 2;
	_object="HeliHEmpty" createVehicleLocal [0,0,0];
	_object attachTo [_victim,[0,0,1.5]];
	if (_sound!="") then {_object say3D _sound};
	[_object] spawn {sleep 5;deleteVehicle (_this select 0)};
	if (_claw>0) then {[_victim,_claw] call CLY_z_claw};
};
"CLY_z_radiopv" addPublicVariableEventHandler {
	_var=_this select 1;
	_talker=_var select 0;
	_radio=_var select 1;
	_say=if (count _var>2) then {_var select 2} else {""};
	if (isPlayer _talker) then {
		_talker commandRadio _radio;
	} else {
		_talker globalRadio _radio;
	};
	if (_say!="") then {_talker say _say};
};



sleep 3;

//CLY Heal
_bandages=if (typeOf player=="Dr_Hladik_EP1") then {8} else {1};

//Load player state
if !(typeOf player in CLY_deadcharacters) then {
	_array=[];
	_index=0;
	{
		if (typeOf player in _x) then {_array=_x;_index=_forEachIndex};
	} forEach CLY_playerstates;
	if (count _array>0) then {
		_damage=_array select 2;
		_bandages=_array select 3;
		_magazines=_array select 4;
		_weapons=_array select 5;
		_items=_array select 6;
		
		//2/3 of the original magazines
		_newmagazines=[];
		{
			if !(_x in _newmagazines) then {
				_mag=_x;
				for "_x" from 1 to round (({_x==_mag} count _magazines)*0.66) do {
					_newmagazines set [count _newmagazines,_mag];
				};
			};
		} forEach _magazines;
		
		removeAllWeapons player;
		removeAllItems player;
		player setDamage _damage;
		{player addMagazine _x} forEach _newmagazines;
		{player addWeapon _x} forEach _weapons;
		if (count _weapons>0) then {
			_gun=_weapons select 0;
			_muzzles=getArray (configFile/"CfgWeapons"/_gun/"muzzles");
			_muzzle=if !("this" in _muzzles) then {_muzzles select 0} else {_gun};
			player selectWeapon _muzzle;
			if (vehicle player==player) then {
				_anim="";
				_guntype=getNumber (configFile/"CfgWeapons"/_gun/"type");
				if (_guntype in [1,5]) then {_anim="amovpercmstpsraswrfldnon"};
				if (_guntype==2) then {_anim="amovpercmstpsraswpstdnon"};
				if (_guntype==4) then {_anim="amovpercmstpsraswlnrdnon"};
				if (_anim!="") then {player switchMove _anim};
			};
		};
		{player addWeapon _x} forEach _items;
		CLY_playerstates set [_index,[player,typeOf player,_damage,_bandages,_newmagazines,_weapons,_items]];
		publicVariable "CLY_playerstates";
	};
};

//CLY Heal continued
[player,0.1,0,_bandages,false] execVM "cly_heal.sqf";

//CLY Spectate cameraView script (spectator sees aiming mode when player aims)
[] spawn {
	player setVariable ["cameraview","INTERNAL",true];
	while {true} do {
		if (alive player and cameraView!=(player getVariable "cameraview")) then {player setVariable ["cameraview",cameraView,true]};
		sleep 0.1;
	};
};

//Loot sparkle
if (!isDedicated) then {
	[] spawn {
		while {true} do {
			sleep 3;
			waitUntil {!CLY_cutscene};
			_unit=if (isNil {_x getVariable "spectating"}) then {player} else {_x getVariable "spectating"};
			_zombies=[];
			{
				if (_x distance player<50 and (count magazines _x>0 or count weapons _x>0 or count items _x>0 or count (getPosATL _x nearObjects ["HeliHEmpty",0.1])>0)) then {
					_zombies set [count _zombies,_x];
				};
			} forEach allDead;
			{
				[_x] spawn {
					_zombie=_this select 0;
					for "_x" from 1 to 10 do {
						if (count magazines _zombie>0 or count weapons _zombie>0 or count items _zombie>0) then {
							drop ["\ca\data\koulesvetlo","","Billboard",3,3,[-0.25+random 0.5,-0.25+random 0.5,0.1],[0,0,0],0,1.26,1,0,[0,0.015,0.01,0.005,0],[[1,1,0.5,1]],[0],0,0,"","",_zombie];
						};
						if (count (getPosATL _zombie nearObjects ["HeliHEmpty",0.1])>0) then {
							drop ["\ca\data\koulesvetlo","","Billboard",3,3,[-0.25+random 0.5,-0.25+random 0.5,0.1],[0,0,0],0,1.26,1,0,[0,0.015,0.01,0.005,0],[[1,0.25,0.25,1]],[0],0,0,"","",_zombie];
						};
						sleep 0.3;
					};
				};
			} forEach _zombies;
		};
	};
};

//Set players captive - prevents zombies from fleeing in MP
player setCaptive true;