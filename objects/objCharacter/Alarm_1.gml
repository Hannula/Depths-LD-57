if (!isFlying)
{
	alarm[1] = 10;	
	inLava = false;
	inWater = false;
	if (collision_point(x, y, objLava, false, true))
	{
		inLava = true;	
	}
	if (collision_point(x, y, objWater, false, true))
	{
		inWater = true;	
	}
}