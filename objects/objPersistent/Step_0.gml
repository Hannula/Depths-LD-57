if (keyboard_check(vk_control))
{
	// Debug cheat stuff	
	if (keyboard_check_pressed(ord("R")))
	{
		game_restart();
	}
	
	if (keyboard_check_pressed(ord("D")))
	{
		objWizard.TakeDamage();
	}
	

	if (keyboard_check_pressed(ord("N")))
	{
		objLevel.MoveScreen();
	}
}

var isBrowser = (os_browser != browser_not_a_browser);

var ww = window_get_width();
var wh = window_get_height();
if (isBrowser) {
    var dw = display_get_width();
    var dh = display_get_height();
    if (ww != dw || wh != dh) {
        window_set_size(dw, dh);
    }
}
windowWidthPrevious = window_get_width();
windowHeightPrevious = window_get_width();