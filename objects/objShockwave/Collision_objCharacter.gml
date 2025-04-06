if (other.team != team && !array_contains(hitCharacters, other.id))
{
	array_push(hitCharacters, other.id);
	other.TakeDamage(dmg);
	var kbDir = point_direction(x, y, other.x, other.y);
	other.TakeKnockback(kbDir, knockback);
	if (other.hp <= 0 && instance_exists(creator))
	{
		creator.xp += other.xpGiven;
	}
}