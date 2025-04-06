canMove = true;
friction = 0.1;

mana = 100;
maxMana = 100;
shotManacost = 10;
manaRegen = 40 / 60;
regenDelay = 0;
manaDraw = 0;
canBeHurt = true;
hurtFlash = 0;
maxHp = 3;
hp = 3;


TakeDamage = function()
{
	if (instance_exists(objDragon) && hp > 0)
	{
		canBeHurt = false;
		hp = 0;
		hurtFlash = 15;	
		audio_play_sound(sndPlayerHurt, 0.8, false, 1, 0, random_range(0.9, 1.1));
		return;		
	}
	if (!canBeHurt)
		return;
	hp -= 1;
	hurtFlash = 15;	
	canBeHurt = false;
	audio_play_sound(sndPlayerHurt, 0.8, false, 1, 0, random_range(0.9, 1.1));
	
	with(objCharacter)
	{
		if (team == TEAM.Enemy)
		{
			hp = 0;
		}
	}
}

dyingTimer = 0;