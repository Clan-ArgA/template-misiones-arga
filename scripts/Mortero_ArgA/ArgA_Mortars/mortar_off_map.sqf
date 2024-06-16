/*******************************************************************************
                          Realizado por |ArgA|Vultur|Tte
*******************************************************************************/

if (hasInterface && !isServer) exitWith {false};		// Ensures only server or HC runs this script
#include "mortar_setting.sqf"

params [["_MortarAmmoType",""],["_Position",[]],["_Ammo",_Ammo],["_MinimalSafeDistance",75],["_Is_warning_shot_fired", true]];
Private ["_isFlare","_indexSelect", "_Index"];

ARGA_MortarShell            	= compile preprocessFileLineNumbers "scripts\ArgA_Mortars\mortar_shell.sqf";
ARGA_MortarMark            	 	= compile preprocessFileLineNumbers "scripts\ArgA_Mortars\mortar_mark.sqf";
ARGA_MortarSafePositionFire 	= compile preprocessFileLineNumbers "scripts\ArgA_Mortars\functions\fnc_safe_position_fire.sqf";
ARGA_MortarSpreadImpactPosition = compile preprocessFileLineNumbers "scripts\ArgA_Mortars\functions\fnc_spread_impact_position.sqf";

//["========================= OFF MAP ========================="] call MIV_fnc_log;

_MortarAmmoType = toLower _MortarAmmoType;

// Define Mortar Type
_indexSelect = _MortarTypeArray find _MortarAmmoType;
_isFlare = (_MortarAmmoType == "flare");
_MortarAmmoType = _round  select _indexSelect;

_Index = 0;
_TempPos = _Position;

while { _Ammo > 0} do
{
	_Pos = [_Position, _SpreadDistance] call ARGA_MortarSpreadImpactPosition;

	if (_Index==0 && _Is_warning_shot_fired) then {
		[_Pos] spawn ARGA_MortarMark;
		_Ammo = _Ammo+1;
		_Index = _Index+1;
		sleep 25;
	} else {
		_TempPos = [_Pos, _MinimalSafeDistance] call ARGA_MortarSafePositionFire;
		[_TempPos, _MortarAmmoType, _isFlare] Spawn ARGA_MortarShell;
	};
	_Ammo = _Ammo-1;
	sleep _IntervalFire;
}

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Tte
*******************************************************************************/

		//["Bengala _Ammo", _Ammo] call MIV_fnc_log;
