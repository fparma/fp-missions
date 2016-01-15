#define addFunction(funcName) class funcName {headerType =-1;}

version = 1.0;
createShortcuts = 1;
class FP {
	tag = "FP";
	class api {
		file = "src\API";
		addFunction(switchMove);
		addFunction(addAction);
		addFunction(removeAction);
		addFunction(hint);
		addFunction(getCurrentScript);
		addFunction(getGear);
	};
	class local {
		file = "src\API\local";
		addFunction(local_switchMove);
		addFunction(local_addAction);
		addFunction(local_hint);
		addFunction(local_removeAction);
	};
};
