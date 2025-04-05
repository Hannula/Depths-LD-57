size += spd;
spd *= 1.4;

if (closing)
{
	if (size >= 1)
	{
		closing = false;
		spd = -0.015;
	}
}
else
{
	// Is opening
	if (size <= 0)
	{
		instance_destroy();
	}
}

draw_set_color(c_black);
draw_set_alpha(1);
draw_rectangle(0, 0, room_width, room_height * size * 0.5, false);
draw_rectangle(0, room_height, room_width, room_height - room_height * size * 0.5, false);