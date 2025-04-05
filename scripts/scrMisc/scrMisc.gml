function DrawTextShadow(x, y, str, shadowColor = #282e3b)
{
	var c = draw_get_color();
	draw_set_color(shadowColor);
	draw_text(x + 1, y + 1, str);
	draw_set_color(c);
	draw_text(x, y, str);
}

function CurveEvaluate(curve, t, channel = 0)
{
	var c = animcurve_get_channel(curve, channel);
	return animcurve_channel_evaluate(c, t);
}

function GenerateLevel()
{
	var cellSize = 16;
	for(var xx = 0; xx <= room_width; xx += cellSize)
	{
		for(var yy = 0; yy < objLevel.roomHeight; yy += cellSize)
		{
			var spawnX = xx;
			var spawnY = objLevel.roomHeight + yy;
			var distToCenter = abs(room_width * 0.5 - xx);
			
			var chance = power(distToCenter / 160, 2);
			if (yy < 60 && xx > 32 && xx < room_width -32)
			{
				chance = 0;
			}
			if (yy > 160)
			{
				chance = 1;
			}
			
			if (random(1) < chance)
			{
				if (!collision_point(spawnX, spawnY, objEntity, false, true))
				{
					instance_create_depth(spawnX, spawnY, 0, objWall);
				}
			}
		}
	}
	
}