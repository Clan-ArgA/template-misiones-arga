/*******************************************************************************
                          Realizado por |ArgA|Vultur|Tte
*******************************************************************************/

params ["_Position", "_SpreadDistance"];
Private ["_randomNumber","_sign","_Spread_x","_Spread_y","_Pos"];

_randomNumber = floor(random 2);
_sign = if (_randomNumber == 0) then {-1} else {1};
_Spread_x = round(random(_SpreadDistance))*_sign;

_randomNumber = floor(random 2);
_sign = if (_randomNumber == 0) then {-1} else {1};
_Spread_y = round(random(_SpreadDistance))*_sign;

_Pos = [(_Position select 0)+_Spread_x, (_Position select 1)+_Spread_y, _Position select 2];
//["_Pos sub: ", _Pos] call MIV_fnc_log;
_Pos
