
/*waitUntil{!(isNil "BIS_fnc_init")};
sleep 1;
["YourTextHere", "YourTextHere", str(date select 2) + "." + str(date select 1) + "." + str(date select 0)] call BIS_fnc_infoText;
sleep 1;
["You can continue text here", "and here"] call BIS_fnc_infoText;
sleep 1;	
["and here", "and here"] call BIS_fnc_infoText;*/

if (isServer) then {
	0 = [] execvm "LHDspawnscript.sqf";
	}; 
	
	
	titleCut ["", "BLACK FADED", 999];
	[] Spawn {
	waitUntil{!(isNil "BIS_fnc_init")};

	titleText ["We followed our leaders faithfully. . .","PLAIN DOWN"]; 
	titleFadeOut 7;
	sleep 3;

	titleText ["Each of their orders. . . ","PLAIN"];
	titleFadeOut 7;
	sleep 3;

	titleText ["Every command. . .","PLAIN DOWN"];
	titleFadeOut 12;
	sleep 3;

	titleText ["Where did it get us?","PLAIN"];
	titleFadeOut 9;
	sleep 4;

	titleText ["Lost,\n\naway from home,\n\ndestined to die alone. . .","PLAIN"];
	titleFadeOut 12;
	sleep 6;

	// Info text
	[str ("Flare Up '58"), str("I-Day"), str("June 18, 1958")] spawn BIS_fnc_infoText;

	sleep 3;
	"dynamicBlur" ppEffectEnable true;   
	"dynamicBlur" ppEffectAdjust [6];   
	"dynamicBlur" ppEffectCommit 0;     
	"dynamicBlur" ppEffectAdjust [0.0];  
	"dynamicBlur" ppEffectCommit 5;  

	titleCut ["", "BLACK IN", 5];
	};


sleep 2;

if (isServer) then {
		360 setOvercast 1;
		60 setRain 1;
		0 setFog [0.8, 0.04, 0];
		forceWeatherChange;
		plane1 enablesimulationglobal true;
		plane2 enablesimulationglobal true;
		plane3 enablesimulationglobal true;
		plane4 enablesimulationglobal true;
		plane5 enablesimulationglobal true;
		plane6 enablesimulationglobal true;
		plane7 enablesimulationglobal true;
		plane8 enablesimulationglobal true;
		plane9 enablesimulationglobal true;
		plane10 enablesimulationglobal true;
};

