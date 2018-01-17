#include "script_component.hpp"

LOG("Postinit common");
[] call compile preprocessFileLineNumbers "components\common\XEH_postInit.sqf";

if (hasInterface) then {
  LOG("Postinit client");
  [] call compile preprocessFileLineNumbers "components\client\XEH_postInit.sqf";
};
