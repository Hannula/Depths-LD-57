var effect = instance_create_depth(x, y, depth - 100, objSingleAnimation);
effect.sprite_index = sprMagicExplosion;
effect.image_speed = random_range(0.9, 1.1);

repeat(10)
{
	effect = instance_create_depth(x, y, depth - 100, objSingleAnimation);
	effect.sprite_index = sprMagicParticle;
	effect.image_speed = random_range(0.5, 2);
	effect.speed = random_range(3, 4.5);
	effect.direction = random(360);
	effect.friction = 0.35;
}

audio_play_sound(sndSmallExplosion, 0.1, false, 1, 0, random_range(0.9, 1.1));