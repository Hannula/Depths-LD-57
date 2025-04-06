event_inherited();

xpNeeded = 10;
xpGiven = 3;
nextLevelCharacter = objBogslium3;

hp = 70;
maxHp = hp;
hpPrevious = hp;

waterSpeed = 0.5;
lavaSpeed = 0.5;
spd = 0.1;

knockbackMultiplier = 0.2;
friction = 0.1;

team = TEAM.Enemy;

targetingChance = 30;
movementTargetChance = 30;
preferredDistance = 15;

attackCooldown = 200;
canAttackTimer = 60;
attackChance = 30;
attackObject = objShockwave;
attackDmg = 2;
attackRange = 60;
attackSpeed = 0;
attackSpread = 0;
attackKnockback = 2;
attackSprite = sprShockwave;
attackDamageReduction = 1;
attackSound = sndShockwave;


drawHealth = true;
hpBarWidth = 9;
hpBarHeight = 25;
drawHp = 0;

bloodAmount = 5;
bloodColor = #7b234c;

pushedChance = 10;
pushAmount = 0.8;

goldAmount = 6;

TakeDamage = function(dmg)
{
	hp -= dmg;	
	
	repeat(bloodAmount)
	{
		var g = instance_create_depth(x,y, depth - 1, objGore);
		g.image_blend = bloodColor;
		g.color = bloodColor;
	}
	
	canAttackTimer -= dmg * 3;
}