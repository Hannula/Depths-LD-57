zSpeed += zGravity;

z += zSpeed;

if ( z >= 0)
{
	z = 0;
	zSpeed = 0;
}
else
{
	image_angle += rotSpeed;
}

if (random(120) < 1)
{
	var spark = instance_create_depth(x + random_range(-6, 6), y + random_range(-6, 6) + z, -100, objSparkle); 
}

if (objLevel.levelPhase != LEVEL_PHASE.Battle && objLevel.levelPhase != LEVEL_PHASE.Cleared && instance_exists(objWizard))
{
	if (canBeCollected)
	{
		var dir = point_direction(x, y, objWizard.x, objWizard.y);
		motion_add(dir, 0.25);	
	}
}

if (objLevel.levelPhase != LEVEL_PHASE.Shopping && objLevel.levelPhase != LEVEL_PHASE.Prepare)
{
	canBeCollected = true;	
}

depth = -y + 3;