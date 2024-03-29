/*
	Author: Panda
	
	Description:
	Creates a crate which can be unpacked into a tent.
	
	Parameters:
	_this select 0: PositionATL
	
	Returns:
	NOTHING.
	
	Example:
	_call = [[0,0,0]] call I_fnc_createEngineerTent;
*/

params
[
	["_tentPos",[],[[]]]
];

/*if (_tentPos isEqualTo []) exitWith {
	diag_log "I_fnc_createTent: no position provided.";
};*/

private ["_crateObject","_tentObject"];

_crateObject = createVehicle ["CargoNet_01_box_F", _tentPos, [], 0, "CAN_COLLIDE"];

if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {
	[_crateObject,true,[0,1.8,0]] remoteExecCall ["ace_dragging_fnc_setDraggable",0,true];
	[_crateObject, 5] remoteExecCall ["ace_cargo_fnc_setSize",0,true];
	_crateObject enableRopeAttach false;
};

["I_TENT_ENGINEER_ACTIVE", false] call I_fnc_setVariable;

[
	[_crateObject],
	{
		[
			(_this select 0),
			"Assemble Engineer Tent",
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
			"_this distance _target < 5",
			"_caller distance _target < 5",
			{}, // Executed on action start.
			{},	// Code executed on every progress tick						
			{
				private ["_crateObject","_nearestTents","_commandTentCheck","_nearestTerrainObj","_surfaceIsWater","_isTouchingGround","_tentObject","_tentInterior","_tentInteriorArray"];
				_crateObject = (_this select 3 select 0);
				_nearestTents = nearestObjects [_crateObject, ["Land_tent_east", "USMC_WarfareBFieldhHospital","CampEast_EP1"], 20];
				_commandTentCheck = ["I_TENT_COMMAND_ACTIVE", [false, objNull]] call I_fnc_getVariable;
				
				_nearestTerrainObj = nearestTerrainObjects [_crateObject, ["TREE","SMALL TREE","BUILDING","HOUSE"], 15];
				_surfaceIsWater = (surfaceIsWater (getPos _target));
				_isTouchingGround = (getPosATL _crateObject select 2);

				if ((count _nearestTerrainObj) < 1 && _surfaceIsWater isEqualTo false && _isTouchingGround < 1) then {
					if (_nearestTents isEqualTo []) then {
						if ((_commandTentCheck select 0) isEqualTo true) then {
							if ((_commandTentCheck select 1) distance _crateObject < 100) then {

								_tentObject = createVehicle ["Land_tent_east", (getPos _crateObject), [], 0, "CAN_COLLIDE"];
								_tentObject attachTo[_crateObject,[0,0,1.3]];
								_tentObject allowDamage false;

								if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {
									_tentObject setVariable ["ACE_isRepairFacility",true,true];
								};

								deleteVehicle _crateObject;

								_tentInteriorArray = [];

								{
									_tentInterior = createVehicle [_x select 0, (getPos _tentObject), [], 0, "CAN_COLLIDE"];
									_tentInterior attachTo [_tentObject, _x select 1];
									_tentInterior setDir (_x select 2);
									_tentInterior allowDamage false;
									_tentInteriorArray pushBack _tentInterior;
								}forEach I_TENT_ENGINEER_OBJECTS;
								
								["I_TENT_ENGINEER_ACTIVE", true] call I_fnc_setVariable;

								[format["I_TENT_%1",(str _tentObject)], (getPos _tentObject), "hd_flag", "ColorWEST","Engineer Tent"] call I_fnc_createMarkerIcon;

								[
									[_tentObject,_tentInteriorArray],
									{
										[
											(_this select 0),
											"Disassemble Engineer Tent",
											"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
											"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
											"_this distance _target < 5",
											"_caller distance _target < 5",
											{}, // Executed on action start.
											{},	// Code executed on every progress tick						
											{
												private ["_tentObject","_tentInteriorObjects"];
												_tentObject = (_this select 3 select 0);
												_tentInteriorObjects = (_this select 3 select 1);

												[(getPos _tentObject)] call I_fnc_createCommandTent;

												if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {
													_tentObject setVariable ["ACE_isRepairFacility",nil,true];
												};

												{
													deleteVehicle _x;
												}forEach _tentInteriorObjects;

												["I_TENT_ENGINEERL_ACTIVE", false] call I_fnc_setVariable;

												deleteVehicle _tentObject;
												deleteMarker (format["I_TENT_%1",(str _tentObject)]);
											}, // Code executed on completion
											{},	// Code executed on interrupted
											[(_this select 0),(_this select 1)],
											2,
											0,
											false,
											false
										] call BIS_fnc_holdActionAdd;
									}
								] remoteExec ["bis_fnc_call",0,true];
							} else {
								["Unable to place Engineer Tent. You must be within 100 meters of a Command Tent."] call I_fnc_notification;
							};
						} else {
							["Unable to place Engineer Tent. A Command Tent must be active nearby."] call I_fnc_notification;
						};
					} else {
						["Unable to place Engineer Tent, nearby tent too close."] call I_fnc_notification;
					};
				} else {
					["Unable to place Engineer Tent, invalid area space."] call I_fnc_notification;
				};
			}, // Code executed on completion
			{},	// Code executed on interrupted
			[(_this select 0)],
			2,
			0,
			false,
			false
		] call BIS_fnc_holdActionAdd;
	}
] remoteExec ["bis_fnc_call", 0,true];