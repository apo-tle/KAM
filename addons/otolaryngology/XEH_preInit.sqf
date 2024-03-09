#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#define CBA_SETTINGS_CAT "KAT - ADV Medical: Otolaryngology"

//Enable penetrating neck injuries
[
	QGVAR(enableNeck),
	"CHECKBOX",
	LLSTRING(SETTING_enableNeck),
	[CBA_SETTINGS_CAT, ELSTRING(GUI,SubCategory_Basic)],
	[true],
	true
] call CBA_Settings_fnc_init;

ADDON = true;