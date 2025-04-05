event_inherited();
depth = -y;
y = max(y, 15);

if (team == TEAM.Player)
{
	if (objLevel.levelPhase != LEVEL_PHASE.Battle)
	{
		hp = maxHp;
		hpPrevious = hp;
		
		if (y > 30)
			y -= 2.5;
	}
}

if (irandom(pushedChance) == 1)
{
	var col = collision_point(x, y, objCharacter, false, true);
	if (instance_exists(col))
	{
		TakeKnockback(point_direction(col.x, col.y, x, y), col.pushAmount);
	}
}

if (speed > 0)
{
	if (place_meeting(x + hspeed, y, objWall))
	{
			hspeed *= -0.5;
	}
	if (place_meeting(x, y + vspeed, objWall))
	{
			vspeed *= -0.5;
	}
}


if (hurtFlash > 0)
{
	hurtFlash -= 1;
}

canAct = objLevel.levelPhase == LEVEL_PHASE.Battle;

if (!canAct)
	exit;

if (irandom(targetingChance) == 1)
{
	FindTarget();
}


if (instance_exists(target))
{
	if (irandom(movementTargetChance) == 1)
	{
		var dir = point_direction(target.x, target.y, x, y) + random_range(-30, 30);
		var dist = preferredDistance * random_range(0.8, 1.5);
		targetX = target.x + lengthdir_x(dist, dir);
		targetY = target.y + lengthdir_y(dist, dir);
	}
}

if (knockedBack)
{
	if (speed < 0.1)
	{
		knockedBack = false;
	}
}
else
{
	var dist = point_distance(x, y, targetX, targetY);
	if (dist > 3)
	{
		
		mp_potential_step_object(targetX, targetY, spd, objWall);
	}
	
	if (instance_exists(target))
	{
		drawXScale = target.x < x ? -1 : 1;
	}
		
}

if (hp < hpPrevious)
{
	hpPrevious = hp;
	hurtFlash = 10;
}

if (canAttackTimer <= 0)
{
	if (instance_exists(target))
	{
		var distToTarget = point_distance(x,y, target.x, target.y);
		if (distToTarget <= attackRange && irandom(attackChance) == 1)
		{
			var dirToTarget = point_direction(x, y, target.x, target.y);
			Attack(dirToTarget);
		}
	}
}
else
{
	canAttackTimer -= 1;
}

if (hp <= 0)
{
	Die();
	audio_play_sound(sndDeath, 0.4, false, 1, 0, random_range(0.8, 1.2));
	instance_destroy();	
}

if (xp >= xpNeeded && nextLevelCharacter != undefined)
{
	var c = instance_create_depth(x, y, depth, nextLevelCharacter);
	c.team = team;
	instance_destroy();
}
	