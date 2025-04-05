event_inherited();
if (drawHealth)
{
	draw_set_alpha(1);

	var t = max(0, hp / maxHp);

	draw_set_color(hpBarColor);
	draw_rectangle(x - hpBarWidth, y - hpBarHeight , x + hpBarWidth, y - hpBarHeight, false);


	draw_set_color(#e5efef);
	drawHp = lerp(drawHp, t, 0.05);
	draw_rectangle(x - hpBarWidth, y - hpBarHeight , x - hpBarWidth + hpBarWidth* 2 * drawHp, y - hpBarHeight, false);

	draw_set_color(hpColor);
	draw_rectangle(x - hpBarWidth, y - hpBarHeight , x - hpBarWidth + hpBarWidth* 2 * t, y - hpBarHeight, false);
}