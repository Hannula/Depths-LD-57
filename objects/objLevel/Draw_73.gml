largeTextY = room_height * 0.8;
smallTextY = room_height * 0.9;

if (levelPhase == LEVEL_PHASE.Prepare)
{
	if ((round(current_time * 0.003) mod 6) != 1)
	{
		draw_set_font(fntPixellari);
		draw_set_alpha(1);
		draw_set_halign(fa_center);
		draw_set_color(#e1a845);
		DrawTextShadow(room_width * 0.5, largeTextY, "PREPARE FOR BATTLE!");
		draw_set_font(fntPixeltype);
		DrawTextShadow(room_width * 0.5, smallTextY, "Click here to begin.");
	}
	
	if (clickSafeBuffer <= 0 && mouse_check_button_pressed(mb_left) && mouse_y > largeTextY)
	{
		StartBattle();	
	}
}

if (levelPhase == LEVEL_PHASE.Cleared)
{
	if ((round(current_time * 0.003) mod 6) != 1)
	{
		draw_set_font(fntPixellari);
		draw_set_alpha(1);
		draw_set_halign(fa_center);
		draw_set_color(#e1a845);
		DrawTextShadow(room_width * 0.5, largeTextY, "THE BATTLE IS OVER!");
		draw_set_font(fntPixeltype);
		DrawTextShadow(room_width * 0.5, smallTextY, "Click here to continue.");
	}
	
	if (clickSafeBuffer <= 0 && mouse_check_button_pressed(mb_left) && mouse_y > largeTextY)
	{
		OpenShop();	
	}
}

if (levelPhase == LEVEL_PHASE.Shopping)
{
	if ((round(current_time * 0.003) mod 6) != 1)
	{
		draw_set_font(fntPixellari);
		draw_set_alpha(1);
		draw_set_halign(fa_center);
		draw_set_color(#e1a845);
		DrawTextShadow(room_width * 0.5, largeTextY, "SPEND GOLD TO SUMMON UNITS!");
		draw_set_font(fntPixeltype);
		DrawTextShadow(room_width * 0.5, smallTextY, "Click here to got to the next room.");
	}
	
	if (clickSafeBuffer <= 0 && mouse_check_button_pressed(mb_left) && mouse_y > largeTextY)
	{
		MoveScreen();	
	}
}

if (levelPhase == LEVEL_PHASE.GameOver && !instance_exists(objWizard))
{
	if ((round(current_time * 0.003) mod 6) != 1)
	{
		draw_set_font(fntPixellari);
		draw_set_alpha(1);
		draw_set_halign(fa_center);
		draw_set_color(#e1a845);
		DrawTextShadow(room_width * 0.5, room_height * 0.4, "GAME OVER!");
		draw_set_font(fntPixeltype);
		DrawTextShadow(room_width * 0.5, room_height * 0.5, "Click anywhere to restart game.");
	}
	
	if (clickSafeBuffer <= 0 && mouse_check_button_pressed(mb_left))
	{
		room_restart();
	}
}

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_color(#e1a845);
draw_set_font(fntPixeltype);
draw_sprite(sprGoldIcon, 0, 10, 10);
DrawTextShadow(18, 9, string(gold));

draw_sprite(sprIconFirepower, 0, 10, 22);
draw_set_color(#63c4cc);
DrawTextShadow(18, 21, string(firepower));

draw_sprite(sprCursor, cursorImage, mouse_x, mouse_y);