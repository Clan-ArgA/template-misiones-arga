/*******************************************************************************
                          Realizado por |ArgA|Vultur|Tte
*******************************************************************************/

params["_Mortar","_playerGroup"];
private _centerPos = [0,0,0];

//-- Add all player positions
{
	_centerPos = _centerPos vectorAdd (getPos _x);
} forEach _playerGroup; // array of players

_position = _centerPos;

if (!(_Mortar isEqualType "")) then {
	//-- Divide sums by count of players
	_centerPos = _centerPos vectorMultiply (1 / count _playerGroup); 
	_position = [_centerPos, random[30,45,60], _centerPos getDir (position _Mortar)] call BIS_fnc_relPos;
};

_position

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Tte
*******************************************************************************/