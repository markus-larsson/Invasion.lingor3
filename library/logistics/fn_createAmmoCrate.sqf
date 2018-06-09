/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Creates a crate filled with ammo.
	
	Parameters:
	_this select 0: PositionATL
	
	Returns:
	OBJECT
	
	Example:
	_call = [[2500, 2500, 10]] call I_fnc_createAmmoCrate;
*/

[_this select 0, objNull] params [["_pos", []], "_return"];

sleep 2;

if (_pos isEqualTo []) exitWith {
	diag_log "I_fnc_createAmmoCrate: no position provided.";
};

_return = createVehicle ["CargoNet_01_box_F", _pos, [], 0, "CAN_COLLIDE"];

{
	_return addMagazineCargoGlobal [_x select 0, _x select 1];
} forEach I_USMC_MAGAZINES;

_return