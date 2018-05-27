/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Every base 5 seconds this script checks if a boat patrol is active, if so it then runs a number of functions to determine
	an ambush location for friendly forces. It then spawns the infantry group and tasks it to destroy the blufor boat.
	
	Notes: 1.1~ sec execution time maximum on successful loop.
*/

[[], [], []] params ["_array", "_groups", "_positions"];

["RESTRICT_ACS_SEA", 0] call I_fnc_timedBool; // Initialize the bool

while {true} do {
	_array = ([6] call I_fnc_findHostileBoatPatrol);
	
	if (((missionNamespace getVariable "RESTRICT_ACS_SEA") isEqualTo false) and !(_array isEqualTo [])) then {
		{
			if ([(getPos _x), (getDir _x), 300] call I_fnc_findEmptyWaterLine) then {
				_positions = ([_x] call I_fnc_findAmbushLocation);
				
				if !(_positions isEqualTo []) then {
					_groups pushBack ([(selectRandom I_DEF_LAND_AMBUSH_GROUPS), selectRandom _positions] call I_fnc_createGroup);
					[(_groups select _forEachIndex), _x] call I_fnc_taskGroupAmbush;
					["RESTRICT_ACS_SEA", 900 - (random 300) + (random 300)] call I_fnc_timedBool;
				};
			};
		} forEach _array;
	};
	
	sleep 2;
};