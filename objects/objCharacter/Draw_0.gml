if (hurtFlash > 3)
{
	gpu_set_fog(true, #e5efef, 0, 1);
}

var xScale = drawXScale - hurtFlash * 0.05;
var yScale = 1 + hurtFlash * 0.025;
draw_sprite_ext(sprite_index, image_index, x, y, xScale, yScale, image_angle, image_blend, image_alpha);

if (hurtFlash > 3)
{
	gpu_set_fog(false, #e5efef, 0, 1);
}