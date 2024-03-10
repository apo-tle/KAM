#include "..\script_component.hpp"
/*
 * Author: apo_tle
 * Initializes unit variables.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call kat_otolaryngology_fnc_init
 *
 * Public: No
 */

 params ["_unit"];


 _unit setVariable [QGVAR(neckWound),false,true];
 _unit setVariable [QGVAR(neckWoundBleeding),false,true];