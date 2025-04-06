timer += 1 / 60
clickSafeBuffer -= 1;

y += sin(timer) * 0.05;

if (random(10) < 1)
{
	var spark = instance_create_depth(x + random_range(-80, 80), y + random_range(-30, 30), -200, objSparkle); 
}