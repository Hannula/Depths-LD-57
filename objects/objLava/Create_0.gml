event_inherited();

image_speed = random_range(0.9, 1.1);

if (instance_number(objLava) > 20)
{
	exit;
}

if (random(1) < 0.35)
{
	if (x < room_width && !place_meeting(x + 16, y, objEntity))
	{
		instance_create_depth(x + 16, y, depth, objLava);
	}
}

if (random(1) < 0.35)
{
	if (x > 0 && !place_meeting(x - 16, y, objEntity))
	{
		instance_create_depth(x - 16, y, depth, objLava);
	}
}

if (random(1) < 0.25)
{
	if (y < room_height && !place_meeting(x, y + 16, objEntity))
	{
		instance_create_depth(x, y + 16, depth, objLava);
	}
}

if (random(1) < 0.25)
{
	if (y > objLevel.roomHeight + 60 && !place_meeting(x, y - 16, objEntity))
	{
		instance_create_depth(x, y - 16, depth, objLava);
	}
}