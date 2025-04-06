event_inherited();


if (canAct && irandom(20) == 1)
{
	var p = instance_create_depth(x, y, 0, objFireBolt);
	p.direction = random(360);
	p.speed = random_range(1.5, 2);
	p.image_angle = p.direction;
}
