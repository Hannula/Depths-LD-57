event_inherited();

//image_angle = choose(0, 90, 180, 270);
image_xscale = choose(-1, 1);
image_speed = 0;
image_index = irandom(1000);

hp = 2;
gold = 0;

hurtTimer = 0;

TakeDamage = function(dmg)
{
	hp -= dmg;
	hurtTimer = 4;
	
	if (hp <= 0)
	{
		Destroy();
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

Destroy = function()
{
	
}

var goldChance = 1;
if (objLevel.currentBiome == BIOME.Inferno)
{
	goldChance = 0.25;
}

if (objLevel.currentBiome == BIOME.DragonsLair)
{
	goldChance = 0.1;
}

if (irandom(150 * goldChance) == 1)
{
	gold = 1;	
}

if (irandom(25 * goldChance) == 1)
{
	gold = 2;
}

if (irandom(40 * goldChance) == 1)
{
	gold = 3;
}

goldRotation = random(360);
goldOffsetX = random_range(-4, 4);
goldOffsetY = random_range(-4, 4);