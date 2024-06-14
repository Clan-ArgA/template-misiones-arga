/*******************************************************************************
                          Realizado por |ArgA|Vultur|Tte
*******************************************************************************/

params ["_Position", "_MinimalSafeDistance"];
Private ["_posToFireAt","_isSafe"];

_posToFireAt = [_Position, _MinimalSafeDistance, (random 360)] call BIS_fnc_relPos;
_isSafe = False;

while {!_isSafe} do {
	_isSafe = True;
	{
		if (((position _x) distance _posToFireAt) < _MinimalSafeDistance) exitWith {_isSafe = False};
	} forEach playableUnits;
	
	if (!_isSafe) then {
		_posToFireAt = [_Position, _MinimalSafeDistance, (random 360)] call BIS_fnc_relPos;
	};
};
_posToFireAt


/*******************************************************************************
                          Realizado por |ArgA|Vultur|Tte
*******************************************************************************/