/*******************************************************************************
                          Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/

params ["_teleport_data", [ "_time",[] ], [ "_scriptTarget",""] ];

{
	_x params["_startTrigger","_destinationMarker"];

	private _startPosition = getPos _startTrigger;
	private _newPosition   = getMarkerPos _destinationMarker;
	
	[[_startTrigger], "scripts\teleport\teleport_sound.sqf"]   remoteExec ["BIS_fnc_execVM", 0, false];
	[[_startTrigger], "scripts\teleport\teleport_message.sqf"] remoteExec ["BIS_fnc_execVM", 0, false];

	sleep 5;
	{
		_x setPos 
			[
				(_startPosition select 0) - ((getPos _x) select 0) + (_newPosition select 0),
				(_startPosition select 1) - ((getPos _x) select 1) + (_newPosition select 1),
				(_startPosition select 2) - ((getPos _x) select 2) + (_newPosition select 2)
			];
	} forEach (playableUnits inAreaArray _startTrigger);

} forEach _teleport_data;

if (count _time > 0) then { 
	setDate _time;	
};

if (count _scriptTarget > 0) then {
	execVM _scriptTarget;
};

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/