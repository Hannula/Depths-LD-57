event_inherited();
hp = 2;

Destroy = function()
{
	audio_play_sound(sndExplosion, 0.5, false, 1, 0, random_range(0.9, 1.1));
	var e = instance_create_depth(x, y, -200, objExplosion);
	e.dmg = 8;
	e.knockback = 3;
	e.team = TEAM.Independent;
}