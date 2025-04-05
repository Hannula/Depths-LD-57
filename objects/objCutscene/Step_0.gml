if (canSkip > 0 && !keyboard_check_direct(vk_control)) 
{
	canSkip -= 1;
}
else if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left))
{
	instance_create_depth(0, 0, -10000, objBlink);
	audio_play_sound(sndCutsceneSkip, 0.5, false);
	canSkip = 30;
	if (image_index == 2)
	{
		audio_stop_sound(depths_intro);

		audio_play_sound(depths2_low, 0.99, true);
		
		room_goto_next();
	}
	image_index += 1;
}