#include "script_macros.hpp"

class PREFIX {
  class common {
    tag = QUOTE(PREFIX);
    file = "src\common";

    class sectorMarkersInit;
  };

  class client {
    tag = QUOTE(DOUBLES(PREFIX, client));
    file = "src\client";

  };

  class server {
    tag = QUOTE(DOUBLES(PREFIX, server));
    file = "src\server";

    class loadSave;
    class serverSetup;
    class updateSectorMarkersFromSave;
  };
};
