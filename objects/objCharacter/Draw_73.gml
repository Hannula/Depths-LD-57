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
	
	if (objLevel.levelPhase != LEVEL_PHASE.Battle && xp > 0 && nextLevelCharacter != undefined)
	{
		t = max(0, xp / xpNeeded);

		draw_set_color(#2f4c6c);
		draw_rectangle(x - hpBarWidth, y + 3 , x + hpBarWidth, y + 3, false);
		draw_set_color(#3d80a3);
		draw_rectangle(x - hpBarWidth, y + 3 , x - hpBarWidth + hpBarWidth* 2 * t,  y + 3, false);
	}
}