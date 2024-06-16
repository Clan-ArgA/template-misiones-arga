/*******************************************************************************
							Publicado por |ArgA|Varese. 
							Con la colaboración de |ArgA|Reynols
*******************************************************************************/

//  https://foro.clanarga.com.ar/viewtopic.php?f=53&p=78660&sid=740a74ad6923ebe59e89984dbc502012#p78660
//
//	
//	(https://community.bistudio.com/wiki/Arma_3_CfgMagazines#8Rnd_82mm_Mo_shells)   Mortar class names

/*******************************************************************************
                          	Modify by |ArgA|Vultur|Tte
*******************************************************************************/

if (hasInterface && !isServer) exitWith {false};		// Ensures only server or HC runs this script
#include "mortar_setting.sqf";

ARGA_MortarSafePositionFire 	= compile preprocessFileLineNumbers "scripts\ArgA_Mortars\functions\fnc_safe_position_fire.sqf";
ARGA_MortarSpreadImpactPosition = compile preprocessFileLineNumbers "scripts\ArgA_Mortars\functions\fnc_spread_impact_position.sqf";

params ["_Mortar",["_Position",[]],["_Ammo", 20],["_FireMode", "safe"],["_MinimalSafeDistance", 100]];
private ["_Rounds","_AmmoType","_IsThereAmmo"];

// ["========================= ON MAP ========================="] call MIV_fnc_log;

_Rounds = 1;
_AmmoType = getArtilleryAmmo [_Mortar] select 0;
_FireMode = toLower _FireMode;
_IsThereAmmo = true;

while {_IsThereAmmo} do 
{
    _Pos = [_Position, _SpreadDistance] call ARGA_MortarSpreadImpactPosition;
	if (_FireMode=="safe") then {
		_Pos = [_Pos, _MinimalSafeDistance] call ARGA_MortarSafePositionFire;
	};
	//["Distancia: ", ((position granadero) distance _Pos)] call MIV_fnc_log;
    _Mortar doArtilleryFire [_Pos, _AmmoType, _Rounds];
    sleep _IntervalFire;
	if (_Ammo isEqualType 0) then {
		_Ammo = _Ammo-1;
		if (_Ammo<=0) then {_IsThereAmmo = false};
	};
};

if (!isNull _Mortar && {alive _Mortar}) then {
    _Mortar setVehicleAmmo 0.0;
};

/*******************************************************************************
                          	Modify by |ArgA|Vultur|Tte
*******************************************************************************/
