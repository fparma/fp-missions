/*******************************************************************
*
*    __| _ \ __|   \__ __| __| _ \    _ )\ \  /   _ )__ __| |  /
*   (      / _|   _ \  |   _|  |  |   _ \ \  /    _ \   |   . < 
*  \___|_|_\___|_/  _\_|  ___|___/   ___/  _|    ___/  _|  _|\_\
*
*
*  Add and/or use gasmask. Works for both player and AI's.
*  
*  Execute from Unit init:
*  BTK = [this,"Add"] execVM "BTK\Gasmask\Gasmask.sqf";
*  
*  Parameter:
*  "Add" - Add a gasmask.
*  "Use" - Add (if necessary) a gasmask and use it.
*
*******************************************************************/


// ---- Locality and create variables
_Unit = _this select 0;
_Execute = _this select 1;
if (local player) then { if (player != _Unit) exitWith {}; };
_Unit setVariable ["ACE_Identity", "ACE_Original_Identity"];


// ---- Initialized?
if (isNil "BTK_GasmaskInit") then { waitUntil {!(isNil "BTK_GasmaskInit")}; };


// ---- Execute the given (incl. fix for hosted games)
if (_Execute == "Add") exitWith { _Unit addWeapon BTK_Gasmask_GasmasksqfType; sleep 0.9; [_Unit] execFSM "x\ace\addons\sys_goggles\remove_glasses.fsm"; };
if (_Execute == "Use") exitWith { if (!(_Unit hasWeapon BTK_Gasmask_GasmasksqfType)) then { _Unit addWeapon BTK_Gasmask_GasmasksqfType; }; [_Unit, "ACE_GlassesGasMask_US"] execFSM "x\ace\addons\sys_goggles\use_glasses.fsm"; };