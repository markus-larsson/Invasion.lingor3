/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Adds an addaction to create a rally point if the unit role is that of a teamleader as defined in units.sqf
*/

if ((typeOf player) in I_USMC_CLASS_TEAMLEADER) then {
	player addEventHandler ["Respawn", {
		player addAction ["<t color='#ffab1a'>Deploy Rallypoint</t>", I_fnc_createRallyPoint, nil, 6, false, false, "", "(vehicle _this) isEqualTo _target", -1, false, "", ""];
	}];
};
