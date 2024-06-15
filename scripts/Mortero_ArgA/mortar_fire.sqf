/*******************************************************************************
                          Realizado por |ArgA|Vultur|Tte
*******************************************************************************/

if (hasInterface && !isServer) exitWith {false};		// Ensures only server or HC runs this script

ARGA_MortarEnemyCenter = compile preprocessFileLineNumbers "scripts\ArgA_Mortars\mortar_enemy_center.sqf";

params["_Mortar","_playerGroup","_Ammo",["_FireMode", "safe"],["_MinimalSafeDistance",100],["_typeRound", "light"],["_Is_warning_shot_fired", true]];
private ["_Position"];

// ["========================= START ========================="] call MIV_fnc_log;

_Position = [_Mortar, _playerGroup] call ARGA_MortarEnemyCenter;

if (_Mortar isEqualType "") then {
	if (_Mortar=="offmap") then {
		[_typeRound, _Position,_Ammo,_MinimalSafeDistance,_Is_warning_shot_fired] execVM "scripts\ArgA_Mortars\mortar_off_map.sqf";
	};
} else {
	[_Mortar, _Position, _Ammo,_FireMode,_MinimalSafeDistance] execVM "scripts\ArgA_Mortars\mortar_on_map.sqf";
};



// In trigger
// ["offmap", thisList, 2, "safe", 100, "light", true] execVM "scripts\mortar_fire.sqf";
// [mortar_1, thisList, 2, "safe", 100] execVM "scripts\mortar_fire.sqf";
// [mortar_1, thisList, 2, "unsafe"] execVM "scripts\mortar_fire.sqf";
