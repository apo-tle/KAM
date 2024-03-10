#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Calculate the total blood loss of a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Total blood loss of unit (litres/second) <NUMBER>
 *
 * Example:
 * [player] call ace_medical_status_fnc_getBloodLoss
 *
 * Public: No
 */

params ["_unit"];

private _woundBleeding = GET_WOUND_BLEEDING(_unit);
private _neckBleeding = _unit getVariable [QEGVAR(otolaryngology,neckWoundBleeding),false];

if (_woundBleeding == 0 && !(_neckBleeding)) exitWith {0};

if (_neckBleeding) then {
	_woundBleeding = _woundBleeding + 0.5; //todo change to setting for neck wound
};

private _cardiacOutput = [_unit] call ACEFUNC(medical_status,getCardiacOutput);
private _alphaAction = _unit getVariable [QGVAR(alphaAction), 1];

// even if heart stops blood will still flow slowly (gravity)
(_woundBleeding * (_cardiacOutput max EGVAR(circulation,cardiacArrestBleedRate)) * ACEGVAR(medical,bleedingCoefficient) * _alphaAction)
