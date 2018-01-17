#include "script_component.hpp"

LOG("Preinit common");
[] call compile preprocessFileLineNumbers "components\common\XEH_preInit.sqf";

if (hasInterface) then {
  LOG("Preinit client");
  [] call compile preprocessFileLineNumbers "components\client\XEH_preInit.sqf";
};

if (isServer) then {
  LOG("Preinit server");
  [] call compile preprocessFileLineNumbers "components\server\XEH_preInit.sqf";
};
