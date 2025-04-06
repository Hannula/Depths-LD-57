largeTextY = room_height * 0.8;
smallTextY = room_height * 0.9;

if (levelPhase == LEVEL_PHASE.Prepare)
{
	draw_set_font(fntPixellari);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_color(#e1a845);
	DrawTextShadow(room_width * 0.5, largeTextY, "POSITION YOUR ARMY!");
	if ((round(current_time * 0.003) mod 6) != 1)
	{
		draw_set_font(fntPixeltype);
		DrawTextShadow(room_width * 0.5, smallTextY, "Click here to begin battle.");
	}
	
	if (clickSafeBuffer <= 0 && mouse_check_button_pressed(mb_left) && mouse_y > largeTextY)
	{
		StartBattle();	
	}
}

if (levelPhase == LEVEL_PHASE.PayingDebt)
{
	draw_set_font(fntPixellari);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_color(#e5efef);
	DrawTextShadow(room_width * 0.5, 60, "PAY YOUR DEBT!");
	if ((round(current_time * 0.003) mod 6) != 1)
	{
		draw_set_font(fntPixeltype);
		DrawTextShadow(room_width * 0.5, 75, "Click here to pay.");
	}
	
	if (clickSafeBuffer <= 0 && mouse_check_button_pressed(mb_left) && mouse_y > 60)
	{
		totalGoldCollected += 100000;
		with(objGoldPile)
		{
			alarm[0] = irandom_range(5, 120);
		}
		levelPhase = LEVEL_PHASE.Cleared;
		audio_play_sound(sndSelect, 1, false);
		clickSafeBuffer = 60;
	}
}

if (levelPhase == LEVEL_PHASE.Cleared)
{
	draw_set_font(fntPixellari);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_color(#e1a845);
	var text = "THE BATTLE IS OVER!";
	if (difficulty == finalLevelDifficulty + 1)
	{
		text = "CONGRATULATIONS! THE DEBT IS PAID!";
	}
	DrawTextShadow(room_width * 0.5, largeTextY, text);
	if ((round(current_time * 0.003) mod 6) != 1)
	{
		text = "Click here to continue.";
		if (difficulty == finalLevelDifficulty + 1)
		{
			text = "Click here to continue adventuring!";
		}
		draw_set_font(fntPixeltype);
		DrawTextShadow(room_width * 0.5, smallTextY, text);
	}
	
	if (clickSafeBuffer <= 0 && mouse_check_button_pressed(mb_left) && mouse_y > largeTextY)
	{
		if (difficulty == finalLevelDifficulty)
		{
			MoveScreen();
		}
		else
		{
			OpenShop();
		}
	}
}

if (levelPhase == LEVEL_PHASE.Shopping)
{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, room_width, room_height, #2f193e, #2f193e, #2f193e, #2f193e, false);
	draw_set_font(fntPixellari);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_color(#e1a845);
	DrawTextShadow(room_width * 0.5, largeTextY, "SPEND GOLD TO SUMMON UNITS!");
	if ((round(current_time * 0.003) mod 6) != 1)
	{
		draw_set_font(fntPixeltype);
		DrawTextShadow(room_width * 0.5, smallTextY, "Click here to finish summoning.");
	}
	
	if (clickSafeBuffer <= 0 && mouse_check_button_pressed(mb_left) && mouse_y > largeTextY)
	{
		MoveScreen();	
	}
}

if (levelPhase == LEVEL_PHASE.GameOver && !instance_exists(objWizard))
{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_set_font(fntPixellari);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_color(#e1a845);
	DrawTextShadow(room_width * 0.5, room_height * 0.3, "GAME OVER!");
	draw_set_font(fntPixeltype);
	DrawTextShadow(room_width * 0.5, room_height * 0.45, "Level Reached: " + string(difficulty) + "/" + string(finalLevelDifficulty));
	DrawTextShadow(room_width * 0.5, room_height * 0.5, "Gold Collected: " + string(totalGoldCollected));
	
	if ((round(current_time * 0.003) mod 6) != 1)
	{		
		DrawTextShadow(room_width * 0.5, room_height * 0.65, "Click anywhere to restart game.");
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

draw_set_halign(fa_right);
draw_set_color(#e1a845);
DrawTextShadow(room_width - 9, 9, "Level " + string(difficulty) + "/" + string(finalLevelDifficulty));

draw_sprite(sprCursor, cursorImage, mouse_x, mouse_y);