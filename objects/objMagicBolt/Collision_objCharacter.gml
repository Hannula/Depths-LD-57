if (other.team != team)
{
	var targetHp = max(0, other.hp);
	other.TakeDamage(dmg);
	other.TakeKnockback(270, random_range(1.6, 1.8));
	
	if (dmg <= targetHp)
	{
		instance_destroy();	
	}
	dmg -= targetHp;
}
else if (other.team == team && other.hp < other.maxHp)
{
	other.hp += dmg;
	other.hp = min(other.maxHp, other.hp);
	other.hpPrevious = other.hp;
	audio_play_sound(sndHeal, 0.4, false, 1, 0, random_range(0.9, 1.1));
	repeat(4)
	{
		var effect = instance_create_depth(x, y, depth - 100, objSingleAnimation);
		effect.sprite_index = sprHealParticle;
		effect.image_speed = random_range(0.3, 0.5);
		effect.speed = random_range(0.5, 1);
		effect.direction = random(360);
		effect.friction = 0.1;
		effect.gravity = 0.08;
		effect.gravity_direction = 90;
	}
	instance_destroy();
}