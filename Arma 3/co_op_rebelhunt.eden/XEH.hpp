// Extended Eventhandlers

class Extended_PreInit_EventHandlers {
  class FPARMA_Template {
    init = "[] call compile preProcessFileLineNumbers 'config.sqf'";
  };
};

class Extended_PostInit_EventHandlers {
  class FPARMA_Template {
    clientInit = "[] call compile preprocessFileLineNumbers 'fp\XEH_PostInit.sqf'";
  };
};

// Disable all units speaking / giving orders vocally
class Extended_InitPost_EventHandlers {
  class CAManBase {
    init = "if (local (_this select 0)) then {[(_this select 0), 'shut_up'] call ace_common_fnc_muteUnit}; _this call fp_civs";
  };

  class CUP_B_LAV25M240_USMC {
    serverInit = "_this call fp_lavLoadout";
  };
  class CUP_B_MTVR_USMC {
    serverInit = "_this call fp_truckLoadout";
  };
  class CUP_GuerillaCacheBox_EP1 {
    serverInit = "_this call fp_guerBox";
  };
  class CUP_TKSpecialWeapons_EP1 {
    serverInit = "_this call fp_guerBox";
  };
};

class Extended_DisplayLoad_EventHandlers {
  class RscDisplayArsenal {
    FPARMA_override = "if (!isNil 'FP_fnc_overrideArsenalExport') then {_this call FP_fnc_overrideArsenalExport};";
  };
};
