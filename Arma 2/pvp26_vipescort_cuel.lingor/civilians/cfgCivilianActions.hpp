
// ArmA 2 OA
class CfgCivilianActions_EP1
{
	// Subcategory - designer can choose which ones he wanna use
	class BON_CUSTOM_CIVLIAN_ACTION
	{
		// First listed action is always default
		class drive
		{
			condition = "_twnthreat <= 1 && _twnthreat >= 0 && !isnil 'bis_silvie_mainscope' && {_x getvariable 'ALICE_threat' <= 1} count _nearbyTowns > 0 && getnumber(configfile >> 'cfgvehicles' >> typeof (_this select 0) >> 'woman') == 0;";
			fsm = "civilians\safe_drive.fsm";
			rarity = 1000;
			locked = 1;
			canRepeat = 0;
		};
	};
};



// ArmA 2
class CfgCivilianActions
{
	// Subcategory - designer can choose which ones he wanna use
	class BON_CUSTOM_CIVLIAN_ACTION
	{
		// First listed action is always default
		class drive
		{
			condition = "_twnthreat <= 1 && _twnthreat >= 0 && !isnil 'bis_silvie_mainscope' && {_x getvariable 'ALICE_threat' <= 1} count _nearbyTowns > 0 && getnumber(configfile >> 'cfgvehicles' >> typeof (_this select 0) >> 'woman') == 0;";
			fsm = "ca\modules\alice\data\actions\safe_drive.fsm";
			rarity = 1000;
			locked = 1;
			canRepeat = 0;
		};
	};
};