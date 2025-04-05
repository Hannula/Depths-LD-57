zSpeed += zGravity;

z += zSpeed;

if ( z >= 0)
{
	instance_destroy();	
	
	repeat(10)
	{
		effect = instance_create_depth(x, y, depth - 100, objSingleAnimation);
		effect.sprite_index = sprWhiteParticle;
		effect.image_blend = choose(#533b41, #7d595d); 
		effect.image_speed = random_range(0.5, 2);
		effect.speed = random_range(3, 4.5);
		effect.direction = random(360);
		effect.friction = 0.35;
	}

	audio_play_sound(sndRockDestroy, 0.1, false, 0.5, 0, random_range(1.3, 1.5));
}

image_angle += rotSpeed;