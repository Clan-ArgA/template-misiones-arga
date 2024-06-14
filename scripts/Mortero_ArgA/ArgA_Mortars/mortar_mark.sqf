/*******************************************************************************
                          	Modify by |ArgA|Vultur|Tte
*******************************************************************************/

params ["_Position"];
Private ["_Daytime","_Temp","_SunRise","_SunSet","_sunriseSunsetTime"];

#include "mortar_setting.sqf"
// Ver https://community.bistudio.com/wiki/BIS_fnc_sunriseSunsetTime
_sunriseSunsetTime = date call BIS_fnc_sunriseSunsetTime;
_Sunrise = _sunriseSunsetTime select 0;
_Sunset = _sunriseSunsetTime select 1;

if ((dayTime > _Sunrise) and (dayTime < _Sunset)) then {_DayTime = True} else {_Daytime = False};

if (_Daytime) then
{
	_Temp = createVehicle [_MarkSmoke, [(_Position select 0), (_Position select 1), ((_Position select 2) + 100)], [], 20, "CAN_COLLIDE"];
	sleep 1;
	_Temp SetVelocity [0,0,-50];
} else {
	_Temp = createVehicle [_MarkFlare, [(_Position select 0), (_Position select 1), ((_Position select 2) + 140)], [], 20, "CAN_COLLIDE"];
	_Temp setVelocity [0,0,-10];
	UIsleep 3.1;
	playSound3D ["a3\missions_f_beta\data\sounds\Showcase_Night\flaregun_shoot.wss", _round select 4, false, [(_Position select 0), (_Position select 1), (_Position select 2) + 140], 8, 1, 300];
};

/*******************************************************************************
                          	Modify by |ArgA|Vultur|Tte
*******************************************************************************/