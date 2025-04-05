event_inherited();
team = TEAM.Player;

hpColor = #c33c40;
hpBarColor = #4e1a49;


FindTarget = function()
{
	var closestEnemy = 	noone;
	var closestDistance = 10000;
	
	with(objCharacter)
	{
		if (team != other.team)
		{
			var dist = point_distance(x, y, other.x, other.y);
			if (dist < closestDistance)
			{
				closestDistance = dist;
				closestEnemy = id;
			}
		}
	}
	
	target = closestEnemy;
	
	if (!instance_exists(target))
	{
		target = objWizard;
		preferredDistance = 0;
	}
}