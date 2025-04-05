event_inherited();

icon = sprInvestment;

name = "Invest";

cost = 30 * objLevel.difficulty;
amount = cost / 7;

Buy = function()
{
	repeat(8)
	{
		var spark = instance_create_depth(x + random_range(-10, 10), y + random_range(-10, 10), -100, objSparkle); 
	}
	objLevel.gold -= cost;
	if (unit != undefined)
	{
		repeat(amount)
		{
			var g = instance_create_depth(x, y, 0, objGoldNugget);
			g.canBeCollected = false;
		}
	}
}