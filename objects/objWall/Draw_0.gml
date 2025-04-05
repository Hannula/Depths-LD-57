draw_self();


if (gold > 0)
{
	draw_sprite_ext(sprGoldVein, gold - 1, x + goldOffsetX, y + goldOffsetY, 1, 1, goldRotation, c_white, 1);	
}