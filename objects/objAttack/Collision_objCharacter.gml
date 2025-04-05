if (other.team != team && !array_contains(hitCharacters, other.id))
{
	array_push(hitCharacters, other.id);
	other.TakeDamage(dmg);
	other.TakeKnockback(image_angle, knockback);
	if (other.hp <= 0 && instance_exists(creator))
	{
		creator.xp += other.xpGiven;
	}
}