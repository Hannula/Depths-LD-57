event_inherited();

image_speed = random_range(0.9, 1.1);

if (random(1) < 0.35)
{
	if (x < room_width && !place_meeting(x + 16, y, objEntity))
	{
		instance_create_depth(x + 16, y, depth, objWater);
	}
}

if (random(1) < 0.35)
{
	if (x > 0 && !place_meeting(x - 16, y, objEntity))
	{
		instance_create_depth(x - 16, y, depth, objWater);
	}
}

if (random(1) < 0.35)
{
	if (y < room_height && !place_meeting(x, y + 16, objEntity))
	{
		instance_create_depth(x, y + 16, depth, objWater);
	}
}

if (random(1) < 0.35)
{
	if (y > 0 && !place_meeting(x, y - 16, objWater))
	{
		instance_create_depth(x, y - 16, depth, objWater);
	}
}