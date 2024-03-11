#include "..\script_component.hpp"
/*
 * Author: apo_tle
 * Called when a unit is damaged
 *
* Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Damage done to each body part <ARRAY>
 *  0: Damage <NUMBER>
 *  1: Bodypart <STRING>
 * 2: Shooter <OBJECT>
 * 3: Ammo classname or damage type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, [1, "Head"], objNull, "bullet"] call kat_breathing_fnc_handlePulmoHit;
 *
 * Public: No
 */

params ["_unit", "_allDamages", "", "_dmgType"];
_allDamages select 0 params ["_damage", "_bodyPart"];

if (!(GVAR(enableNeck)) || !(_bodyPart isEqualTo "Head") || !((_dmgType == "bullet") || (_dmgType == "grenade") || (_dmgType == "shell") || (dmgType == "explosive") || (dmgType == "stab"))) exitWith {};

private _npiDebug = true;//temp

private _damageThreshold = 0.5; // todo move these to preInit
private _scaleChanceWithDamage = true;
private _defaultChance = 5;

private _chanceIncrease = 0;
if (_scaleChanceWithDamage) then {
	_chanceIncrease = _chanceIncrease + ([0,linearConversion [(_damageThreshold),3,_damage,0,9,true]] select (_dmgType isEqualTo "bullet"));
	_chanceIncrease = _chanceIncrease + ([0,linearConversion [(_damageThreshold),3,_damage,0,18,true]] select (_dmgType isEqualTo "grenade"));
	_chanceIncrease = _chanceIncrease + ([0,linearConversion [(_damageThreshold),3,_damage,0,30,true]] select (_dmgType isEqualTo "shell"));
	_chanceIncrease = _chanceIncrease + ([0,linearConversion [(_damageThreshold),3,_damage,0,18,true]] select (_dmgType isEqualTo "explosive"));
	_chanceIncrease = _chanceIncrease + ([0,linearConversion [(_damageThreshold),3,_damage,0,9,true]] select (_dmgType isEqualTo "stab"));
};

if ((floor (random 100)) <= _chanceIncrease || _npiDebug) then {
	//handle incap
	_unit setVariable [QGVAR(neckWound),true,true];
	_unit setVariable [QGVAR(neckWoundBleeding),true,true];
	[QACEGVAR(medical,CriticalInjury), _unit] call CBA_fnc_localEvent;
	//[_unit] call EFUNC(circulation,updateInternalBleeding);

	//todo set airway obstruction
	//todo set random chance for severe airway obstruction
};