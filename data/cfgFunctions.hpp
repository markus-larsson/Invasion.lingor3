class I
{
	class restrictions
	{
		file = "library\restrictions";
		class vehicularEligibility;
		class timedBool;
		class setVariable;
	};
	class visual
	{
		file = "library\visual";
		class notification;
	};
	class objects
	{
		file = "library\objects";
		class createVehicle;
		class createGroup;
		class findPlayers;
	};
	class acs
	{
		file = "library\acs";
		class findHostileForce;
		class findHostileBoatPatrol;
		class findHostileAir;
	};
	class positional
	{
		file = "library\positional";
		class findNearestWater;
		class findAAPos;
		class findEmptyLine;
		class findEmptyWaterLine;
		class findAmbushLocation;
		class findTowns;
	};
	class ai
	{
		file = "library\ai";
		class taskGroupAssault;
		class taskGroupAmbush;
		class aiSkill;
		class deleteInactive;
	};
};