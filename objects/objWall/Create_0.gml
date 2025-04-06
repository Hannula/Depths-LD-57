event_inherited();

//image_angle = choose(0, 90, 180, 270);
image_xscale = choose(-1, 1);
image_speed = 0;
image_index = irandom(1000);

hp = 1;
gold = 0;

hurtTimer = 0;

TakeDamage = function(dmg)
{
	hp -= dmg;
	hurtTimer = 4;
	
	if (hp <= 0)
	{
		instance_destroy();
		audio_play_sound(sndRockDestroy, 0.5, false, 1, 0, random_range(0.8, 1));
		repeat(3)
		{
			instance_create_depth(x, y, depth - 10, objRockParticle);	
		}
		
		repeat(gold)
		{
			instance_create_depth(x, y, depth - 10, objGoldNugget);	
		}
	}
}

if (irandom(150) == 1)
{
	gold = 1;	
}

if (irandom(25) == 1)
{
	gold = 2;
}

if (irandom(40) == 1)
{
	gold = 3;
}

goldRotation = random(360);
goldOffsetX = random_range(-4, 4);
goldOffsetY = random_range(-4, 4);