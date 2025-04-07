if (team == TEAM.Player)
{
	///hpColor = #c2d64f;
	//hpBarColor = #4d6659;

	goldAmount = 0;
	hp *= 1.5;
	maxHp = hp;
	hpPrevious = hp;
}
else
{
	hpColor = #c33c40;
	hpBarColor = #4e1a49;
	
	if (objLevel.difficulty > objLevel.finalLevelDifficulty)
	{
		var levelsAbove = objLevel.difficulty - objLevel.finalLevelDifficulty;
		hp *= 1 + levelsAbove * 0.1;
		maxHp = hp;
		hpPrevious = hp;	
		attackDmg *= 1 + levelsAbove * 0.1;
	}
}