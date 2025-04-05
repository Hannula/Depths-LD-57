if (irandom(4) == 1)
{
	var effect = instance_create_depth(x, y, depth - 100, objSingleAnimation);
	effect.sprite_index = sprMagicParticle;
	effect.image_speed = random_range(0.6, 2);
	effect.speed = random(0.15);
	effect.direction = random(360);
}