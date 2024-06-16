/*******************************************************************************
                          	Modify by |ArgA|Vultur|Tte
*******************************************************************************/

params ["_Position"];
Private ["_Daytime","_SunRise","_SunSet","_sunriseSunsetTime"];

#include "mortar_setting.sqf"

_sunriseSunsetTime = date call BIS_fnc_sunriseSunsetTime;
_Sunrise = _sunriseSunsetTime select 0;
_Sunset = _sunriseSunsetTime select 1;

if ((dayTime > _Sunrise) and (dayTime < _Sunset)) then {_DayTime = True} else {_Daytime = False};

if (_Daytime) then
{
	_Smoke = createVehicle [_MarkSmoke, [(_Position select 0), (_Position select 1), ((_Position select 2) + 100)], [], 20, "CAN_COLLIDE"];
	sleep 1;
	_FallSpeed = -50;
	_Smoke SetVelocity [0,0,_FallSpeed];
} else {
	_Height = 140;
	_FakeFiredRound = CreateVehicle ["Land_HelipadEmpty_F", [_Position select 0, _Position select 1, ((_Position select 2) + 50)], [], 0, "CAN_COLLIDE"];
	_Sound = "a3\missions_f_exp\data\sounds\exp_m04_flare.wss";
	_PositionFakeFiredRound = [((getPosATL _FakeFiredRound) select 0), ((getPosATL _FakeFiredRound) select 1), ((GetPosATL _FakeFiredRound) select 2) + _Height];
	
	playSound3D [_Sound, _FakeFiredRound, false, _PositionFakeFiredRound, 8, 1, 1000];
	_Flare = createVehicle [_MarkFlare, _PositionFakeFiredRound, [], 20, "CAN_COLLIDE"];
	_FallSpeed = -10;
	_Flare setVelocity [0,0,_FallSpeed];
};

/*******************************************************************************
                          	Modify by |ArgA|Vultur|Tte
*******************************************************************************/