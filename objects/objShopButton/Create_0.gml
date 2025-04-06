icon = sprSkeleton;

name = "Skeleton";

cost = 40;

unit = objSkeleton1;

Buy = function()
{
	repeat(8)
	{
		var spark = instance_create_depth(x + random_range(-10, 10), y + random_range(-10, 10), -100, objSparkle); 
	}
	objLevel.gold -= cost;
	if (unit != undefined)
	{
		var u = instance_create_depth(x, y, 0, unit);	
		u.team = TEAM.Player;
	}
	instance_destroy();
}