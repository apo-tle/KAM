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
 * [bob] call kat_brain_fnc_init
 *
 * Public: No
 */

params ["_unit", ["_isRespawn", true]];

if (!local _unit) exitWith {};
if !(GVAR(enable)) exitWith {};

_unit setVariable [QGVAR(icp),15,true];
_unit setVariable [QGVAR(icpHandler),false];

_unit setVariable [QGVAR(concussion),0];

[_unit] call FUNC(handleICP);