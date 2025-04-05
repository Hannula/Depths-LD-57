draw_self();
var w = 10;
var t = mana / maxMana;
draw_set_color(#2f4c6c);
draw_rectangle(x - w, y + 5, x + w, y + 6, false);

draw_set_color(#e5efef);
draw_rectangle(x - w, y + 5, x - w + manaDraw * w * 2, y + 6, false);

manaDraw = lerp(manaDraw, t, 0.05);

draw_set_color(#63c4cc);
draw_rectangle(x - w, y + 5, x - w + t * w * 2, y + 6, false);


if (hp < maxHp)
{
	var gap = 7;
	for(var i = 0; i < maxHp; i++)
	{
		var xScale = 1;
		var yScale = 1;
		var index = i < hp ? 0 : 2;
		if (hurtFlash > 0 && i == hp)
		{
			hurtFlash -= 1;
			if (hurtFlash > 6)
			{
				index = 1;
			}
			xScale = 1 - hurtFlash * 0.05
			yScale = 1 + hurtFlash * 0.05;
		}
		draw_sprite_ext(sprHeart, index, x - gap + gap * i, y - 18, xScale, yScale, 0, c_white, 1);
	}
}