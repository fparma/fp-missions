// F2 - ShackTactical Group Markers
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f-2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================
if (!isNil "SIERRA1a") then {[SIERRA1a, 0, " SL1/SL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};
if (!isNil "SIERRA1b") then {[SIERRA1b, 0, " SL2/SL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};	

if (!isNil "ALPHA1a") then {[ALPHA1a, 0, " A1/SL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};	
if (!isNil "ALPHA2a") then {[ALPHA2a, 0, " A2/SL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};	
if (!isNil "ALPHA3a") then {[ALPHA3a, 0, " A3/SL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};	

if (!isNil "BRAVO1a") then {[BRAVO1a, 0, " B1/SL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};	
if (!isNil "BRAVO2a") then {[BRAVO2a, 0, " B2/SL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};	
if (!isNil "BRAVO3a") then {[BRAVO3a, 0, " B3/SL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};	

if (!isNil "CHARLIE1a") then {[CHARLIE1a, 0, " C1/SL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};	
if (!isNil "CHARLIE2a") then {[CHARLIE2a, 0, " C2/SL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};	
if (!isNil "CHARLIE3a") then {[CHARLIE3a, 0, " C3/SL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};	

if (!isNil "INDIA1a") then {[INDIA1a, 0, " IA/SL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};	

if (!isNil "WHISKEY1a") then {[WHISKEY1a, 0, " WL-1/WL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};	

if (!isNil "TANK1a") then {[TANK1a, 0, " QL-1/QL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};	
if (!isNil "TANK2a") then {[TANK2a, 0, " QL-2/QL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};	

if (!isNil "EAGLE1a") then {[EAGLE1a, 3, " EAGLE-1/VL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};
if (!isNil "EAGLE2a") then {[EAGLE2a, 1, " EAGLE-2/VL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};

if (!isNil "VANGUARD1a") then {[VANGUARD1a, 1, " VANGUARD-1/VL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};
if (!isNil "VANGUARD2a") then {[VANGUARD2a, 2, " VANGUARD-2/VL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};

if (!isNil "MED1") then {[MED1, 3, " MED-1/SL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};
if (!isNil "MED2") then {[MED2, 3, " MED-2/SL", "ColorBlue"] execVM "source\Markers\ShackTac_localMarker.sqf";};
// ====================================================================================
