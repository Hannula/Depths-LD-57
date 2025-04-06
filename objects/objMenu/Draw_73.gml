draw_set_font(fntPixellari);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_color(#e1a845);

if ((round(current_time * 0.003) mod 6) != 1)
{
	DrawTextShadow(x, 100, "CLICK TO START");
}
	
if (clickSafeBuffer <= 0 && mouse_check_button_pressed(mb_left))
{
	audio_play_sound(sndSelect, 0.6, false);
	room_goto_next();
}


draw_set_font(fntPixeltype);
draw_set_alpha(1);
draw_set_halign(fa_right);
draw_set_color(#414453);
DrawTextShadow(room_width - 6, 168, "Ludum Dare 57 - Rama Hannula", #1a1f2e);

draw_sprite(sprCursor, 0, mouse_x, mouse_y);