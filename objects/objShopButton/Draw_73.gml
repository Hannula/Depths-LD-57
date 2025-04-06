draw_sprite(icon, 0, x, y);

draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_color(#b8a1c2);
if (objLevel.gold < cost)
{
	draw_set_color(#7e659b);
}
draw_set_font(fntPixeltype);
draw_set_valign(fa_bottom);
DrawTextShadow(x, y + 16, name);
draw_set_valign(fa_top);
draw_set_color(#e1a845);
var goldW = sprite_get_width(sprGoldIcon) + 2;
var w = goldW + string_width(string(cost));
draw_sprite(sprGoldIcon, 0, x - w / 2, y + 19);
draw_set_halign(fa_left);
if (objLevel.gold < cost)
{
	draw_set_color(#8d3649);
}
DrawTextShadow(x - w / 2 + goldW, y + 16, string(cost));