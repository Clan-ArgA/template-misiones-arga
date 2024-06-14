/*******************************************************************************
                          Realizado por |ArgA|Vultur|Tte
*******************************************************************************/

if (hasInterface && !isServer) exitWith {false};		// Ensures only server or HC runs this script
#include "mortar_setting.sqf"

params [["_MortarAmmoType",""],["_Position",[]],["_Ammo",_Ammo],["_MinimalSafeDistance",75],["_Is_warning_shot_fired", true]];
Private ["_isFlare","_indexSelect", "_Sound", "_Index"];

ARGA_MortarShell            	= compile preprocessFileLineNumbers "scripts\ArgA_Mortars\mortar_shell.sqf";
ARGA_MortarMark            	 	= compile preprocessFileLineNumbers "scripts\ArgA_Mortars\mortar_mark.sqf";
ARGA_MortarSafePositionFire 	= compile preprocessFileLineNumbers "scripts\ArgA_Mortars\mortar_safe_position_fire.sqf";
ARGA_MortarSpreadImpactPosition = compile preprocessFileLineNumbers "scripts\ArgA_Mortars\mortar_spread_impact_position.sqf";

["========================= OFF MAP ========================="] call MIV_fnc_log;

_MortarAmmoType = toLower _MortarAmmoType;

// Define Mortar Type
_indexSelect = _MortarTypeArray find _MortarAmmoType;
_isFlare = (_MortarAmmoType == "flare");
if (_isFlare) then {
	_Sound = "a3\missions_f_beta\data\sounds\Showcase_Night\flaregun_shoot.wss";
} else {
	_Sound = (_SoundTypes select _indexSelect);
};
_SoundOn = (_SoundOn select _indexSelect);
_MortarAmmoType = _round  select _indexSelect;

_Index = 0;
_TempPos = _Position;

while { _Ammo > 0} do
{
	_Pos = [_Position, _SpreadDistance] call ARGA_MortarSpreadImpactPosition;
	//["_Pos: ", _Pos] call MIV_fnc_log;
	if (_Index==0 && _Is_warning_shot_fired) then {
		[_Pos] spawn ARGA_MortarMark;
		// ["Disparo Bengala"] call MIV_fnc_log;
		_Ammo = _Ammo+1;
		_Index = _Index+1;
	} else {
		_TempPos = [_Pos, _MinimalSafeDistance] call ARGA_MortarSafePositionFire;
		[_TempPos, _MortarAmmoType, _Sound, _SoundOn, _TravelTime, _isFlare] Spawn ARGA_MortarShell;
		// ["Disparo granada"] call MIV_fnc_log;
	};
	_Ammo = _Ammo-1;
	sleep _IntervalFire;
}

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Tte
*******************************************************************************/
