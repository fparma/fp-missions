#include "macros.hpp"
if (!isServer) exitWith {};

LOG("Server init");
[] call FUNC(loadSave);
[] call FUNC(sectorMarkersInit);
[] call FUNC(updateSectorMarkersFromSave);
