#include "../script_component.hpp"

private _sector =  [player, CONFIG("SECTOR_ACTIVATE_DIST")] = call EFUNC(common,getNearestSector);
if (!(_sector select 0) call EFUNC(common,canSectorActivate)) exitWith {false};
