if (objLevel.goldTimer < 55)
{
	instance_destroy();
	objLevel.AddGold(10);
	repeat(3)
	{
		var spark = instance_create_depth(x + random_range(-6, 6), y + random_range(-6, 6) + z, -100, objSparkle); 
	}
}