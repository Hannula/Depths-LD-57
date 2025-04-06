if (hurtTimer > 0)
{
	gpu_set_fog(true, #e5efef, 0, 1);
}

draw_self();

if (gold > 0)
{
	draw_sprite_ext(sprGoldVein, gold - 1, x + goldOffsetX, y + goldOffsetY, 1, 1, goldRotation, c_white, 1);	
}

if (hurtTimer > 0)
{
	gpu_set_fog(false, #e5efef, 0, 1);
}