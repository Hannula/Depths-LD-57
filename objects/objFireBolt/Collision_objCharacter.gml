if (other.team != team)
{
	var targetHp = max(0, other.hp);
	other.TakeDamage(dmg);
	other.TakeKnockback(image_angle, random_range(2.5, 2.7));
	
	if (dmg <= targetHp)
	{
		instance_destroy();	
	}
	dmg -= targetHp;
}