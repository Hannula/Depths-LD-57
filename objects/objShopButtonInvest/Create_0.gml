event_inherited();

icon = sprInvestment;

name = "Invest";

cost = 30 * objLevel.difficulty;

goldAmount = cost * 1.3;

Buy = function()
{
	repeat(8)
	{
		var spark = instance_create_depth(x + random_range(-10, 10), y + random_range(-10, 10), -100, objSparkle); 
	}
	objLevel.gold -= cost;
	if (unit != undefined)
	{
		var goldToGive = goldAmount;
		var nuggetValue = 10;
		while(goldToGive > 0)
		{
			var g = instance_create_depth(x, y, 0, objGoldNugget);
			g.amount = nuggetValue;
			goldToGive -= nuggetValue;
			g.canBeCollected = false;
			
			nuggetValue += 10;
			nuggetValue = clamp(nuggetValue, 10, ceil(0.1 * goldToGive) * 10);
		}
	}
}