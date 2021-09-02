/*******************************************************************************
                          Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/

params[ ["_authorizedUID",[] ],"_teleport_data","_callObject","_time","_scriptTarget"];

if(isNil "_callObject") exitWith {};

removeAllActions _callObject;

if (count _authorizedUID == 0 || (hasInterface && (getPlayerUID player in _authorizedUID))) then {
	_callObject addAction [
		"<t color='#00FF00'>Iniciar transporte</t>",
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			_arguments params ["_teleport_data","_time","_scriptTarget"];
			
			removeAllActions _target;
			hint "Transporte en camino";
			
			[[_teleport_data,_time,_scriptTarget], "scripts\teleport\teleport_server.sqf"] remoteExec ["BIS_fnc_execVM", 2, false];

		}, [_teleport_data, _time, _scriptTarget], 1.5, true, true, "", "true", 50, false, "", ""
	];
}

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/