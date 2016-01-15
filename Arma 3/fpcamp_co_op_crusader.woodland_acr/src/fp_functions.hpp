version = 1.1;
createShortcuts = 1;

#include "JRM\funcs.hpp"

class FP {
	class loadout {
		file = "src\gear";
		class getKit;
	};
	class api {
		file = "src\API";
		class intelHQ;
		class switchMove;
		class addAction;
		class removeAction;
		class hint;
		class getCurrentScript;
		class addCuratorObject;
		class weaponsColdAndUnitLock;
	};
	class local {
		file = "src\API\local";
		class local_intelHQ;
	};
	class spawn {
		file = "src\spawn";
		class getUnits;
		class spawnGroup;
		class UPS;
		class spawnVehicle;
		class spawnGroupWP;
		class spawnHousePatrol;
		class spawnDefense;
		class spawnPatrol;
		class spawnPara;
		class spawnGarrison;
		class dropPara;
		class spawnHeliExtraction;
	};
};

class F {
	tag="F";
	class fspectator
	{
		file = "src\spect";
		class CamInit{};
		class OnUnload{};
		class DrawTags{};
		class EventHandler{};
		class FreeCam{};
		class GetPlayers{};
		class ReloadModes{};
		class UpdateValues{};
		class HandleCamera{};
		class ToggleGUI{};
		class OnMapClick{};
		class DrawMarkers{};
		class ForceExit{};
		class HandleMenu{};
	};
};
