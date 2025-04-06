function DrawTextShadow(x, y, str, shadowColor = #282e3b)
{
	var c = draw_get_color();
	draw_set_color(shadowColor);
	draw_text(x + 1, y + 1, str);
	draw_set_color(c);
	draw_text(x, y, str);
}

function CurveEvaluate(curve, t, channel = 0)
{
	var c = animcurve_get_channel(curve, channel);
	return animcurve_channel_evaluate(c, t);
}
