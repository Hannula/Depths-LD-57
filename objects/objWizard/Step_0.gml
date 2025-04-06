depth = -y;

canMove = false;

if (objLevel.levelPhase == LEVEL_PHASE.Battle || objLevel.levelPhase  == LEVEL_PHASE.ScreenMoving)
{
	canMove = true;	
}

if (regenDelay > 0)
{
	regenDelay -= 1;
	if (regenDelay <= 0)
	{
		audio_play_sound(sndManaRegen, 0.6, false);
	}
}
if (mana < maxMana && regenDelay <= 0)
{
	mana += manaRegen;
	if (mana >= maxMana)
	{
		audio_play_sound(sndManaFull, 0.6, false);
	}
}

if (hp <= 0)
{
	dyingTimer += 1;
	
	if (dyingTimer > 240)
	{
		instance_destroy();
		repeat(7)
		{
			var xx = x + random_range(-16, 16);
			var yy = y + random_range(-20, 20);	
			var effect = instance_create_depth(xx, yy, depth - 100, objSingleAnimation);
			effect.sprite_index = sprMagicExplosion;
			effect.image_speed = random_range(0.9, 1.1);
		}
		repeat(25)
		{
			effect = instance_create_depth(xx, yy, depth - 100, objSingleAnimation);
			effect.sprite_index = sprMagicParticle;
			effect.image_speed = random_range(0.5, 2);
			effect.speed = random_range(3, 9);
			effect.direction = random(360);
			effect.friction = 0.35;
		}
		audio_play_sound(sndPlayerDeath, 0.99, false, 1, 0, random_range(0.9, 1.1));
	}
	sprite_index = sprWizardHurt;
	
	if (irandom(8) == 1)
	{
		var xx = x + random_range(-10, 10);
		var yy = y + random_range(-14, 4);	
		var effect = instance_create_depth(xx, yy, depth - 100, objSingleAnimation);
		effect.sprite_index = sprMagicExplosion;
		effect.image_speed = random_range(0.9, 1.1);

		repeat(10)
		{
			effect = instance_create_depth(xx, yy, depth - 100, objSingleAnimation);
			effect.sprite_index = sprMagicParticle;
			effect.image_speed = random_range(0.5, 2);
			effect.speed = random_range(3, 4.5);
			effect.direction = random(360);
			effect.friction = 0.35;
		}
		audio_play_sound(sndMediumExplosion, 0.3, false, 1, 0, random_range(0.8, 1.2));
	}
	
	
}

if (canMove)
{
	targetX = mouse_x;
	targetY = 25;
	var dir = point_direction(x, y, targetX, targetY);
	motion_add(dir, 0.2);
	
	hspeed = clamp(hspeed, -3, 3);
	if (x < targetX)
	{
		hspeed = max(hspeed, 0);
	}
	else if (x > targetX)
	{
		hspeed = min(hspeed, 0);
	}
	
	if (mouse_check_button_pressed(mb_left))
	{
		if (mana >= shotManacost)
		{
			mana -= shotManacost;
			regenDelay = 120;
			audio_play_sound(sndMagicSpell, 0.4, false, 1, 0, random_range(0.9, 1.1));
			instance_create_depth(x, y, depth - 1, objMagicBolt);
			sprite_index = sprWizardFire;
			image_index = 0;
			image_speed = 1;
		}
		else
		{
			audio_play_sound(sndNoMana, 0.6, false);
		}
	}
	
	if (sprite_index == sprWizard)
	{
		image_speed = 0.75 + speed / 2;
	}

}
else
{
	hspeed = 0;	
}

x = clamp(x, 20, room_width - 20);