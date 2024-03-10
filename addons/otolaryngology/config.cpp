#include "script_component.hpp"

class CfgPatches {
    class ADDON    {
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        units[] = {};
        weapons[] = {

        };
        magazines[] = { };
        requiredAddons[] = {
            "kat_main",
            "cba_settings",
            "ace_medical_gui"
        };
        author = "apo_tle";
        authors[] = {"apo_tle"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
//#include "CfgWeapons.hpp"
//#include "ACE_Medical_Treatment_Actions.hpp"