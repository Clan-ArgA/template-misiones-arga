/*******************************************************************************
                          	Modify by |ArgA|Vultur|Tte
*******************************************************************************/

params ["_Position","_MortarType","_isFlare"];
Private ["_Height","_FallSpeed", "_FakeFiredRound", "_PositionFakeFiredRound"];

// ["========================= MORTAR SHELL ========================="] call MIV_fnc_log;

["_MortarType:", _MortarType, "_Position:", _Position ,"_isFlare:", _isFlare] call MIV_fnc_log;

_FakeFiredRound = CreateVehicle ["Land_HelipadEmpty_F", [_Position select 0, _Position select 1, ((_Position select 2) + 50)], [], 0, "CAN_COLLIDE"];

// ["_FakeFiredRound:", _FakeFiredRound] call MIV_fnc_log;

if (_isFlare) then {
	_Height = 140; 
	_FallSpeed = -10;
	UIsleep 3.1;
	_Sound = "a3\missions_f_exp\data\sounds\exp_m04_flare.wss";
	_PositionFakeFiredRound = [((getPosATL _FakeFiredRound) select 0), ((getPosATL _FakeFiredRound) select 1), ((GetPosATL _FakeFiredRound) select 2) + _Height];
	playSound3D [_Sound, _FakeFiredRound, false, _PositionFakeFiredRound, 8, 1, 1000];
} else {
	_Height = 300;
	_FallSpeed = -10;
	UIsleep 3.1;
};

_FiredRoundPosition = [((getPosATL _FakeFiredRound) select 0), ((getPosATL _FakeFiredRound) select 1), ((GetPosATL _FakeFiredRound) select 2) + _Height];
_FiredRound = CreateVehicle [_MortarType, _FiredRoundPosition, [], 0, "CAN_COLLIDE"];
_FiredRound setVelocity [0,0,_FallSpeed];
// ["_Height:", _Height] call MIV_fnc_log;
// ["_FiredRound:", _FiredRound] call MIV_fnc_log;
// ["_FiredRoundPosition:", _FiredRoundPosition] call MIV_fnc_log;

DeleteVehicle _FakeFiredRound;

/*******************************************************************************
                          	Modify by |ArgA|Vultur|Tte
*******************************************************************************/
