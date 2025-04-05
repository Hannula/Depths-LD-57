if (other.team != team)
{
	var targetHp = max(0, other.hp);
	other.TakeDamage(dmg);
	other.TakeKnockback(270, random_range(1.2, 1.4));
	
	if (dmg <= targetHp)
	{
		instance_destroy();	
	}
	dmg -= targetHp;
}