event_inherited();

icon = sprIconFirepower;

name = "Spellpower";

cost = objLevel.firepower * 50;

Buy = function()
{
	audio_play_sound(sndFirepower, 0.5, false);
	repeat(8)
	{
		var spark = instance_create_depth(x + random_range(-10, 10), y + random_range(-10, 10), -100, objSparkle); 
	}
	objLevel.gold -= cost;
	objLevel.firepower += 1;
	cost = objLevel.firepower * 50;
}