if (team == TEAM.Enemy)
{
	var alliesExist = false;

	with(objCharacter)
	{
		if (team == TEAM.Player)
		{
			alliesExist = true;
			break;
		}
	}
	
	if (!alliesExist)
		other.TakeDamage();
}