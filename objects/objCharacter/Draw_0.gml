if (hurtFlash > 3)
{
	gpu_set_fog(true, #e5efef, 0, 1);
}

var xScale = drawXScale - hurtFlash * 0.05;
var yScale = 1 + hurtFlash * 0.025;
var w = sprite_get_width(sprite_index);
var h = sprite_get_bbox_bottom(sprite_index);
var xx = x - sprite_get_xoffset(sprite_index) * xScale;
var yy = y - sprite_get_yoffset(sprite_index) * yScale;
if (inWater)
{
	h -= 7;
	yy += 4;
}
else if (inLava)
{
	h -= 3;	
	yy += 2;
}
draw_sprite_part_ext(sprite_index, image_index, 0, 0, w, h, xx, yy, xScale, yScale, image_blend, image_alpha);
//draw_sprite_ext(sprite_index, image_index, x, y, xScale, yScale, image_angle, image_blend, image_alpha);

if (hurtFlash > 3)
{
	gpu_set_fog(false, #e5efef, 0, 1);
}