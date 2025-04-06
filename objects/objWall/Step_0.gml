event_inherited();

if (random(300) < gold)
{
	var spark = instance_create_depth(x + random_range(-6, 6), y + random_range(-6, 6), -100, objSparkle); 
}

depth = -y;