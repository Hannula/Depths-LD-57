event_inherited();


enum TEAM
{
	Player,
	Enemy,
	Independent
}

lavaHurtChance = 30;
inWater = false;
inLava = false;

waterSpeed = 0.33;
lavaSpeed = 0.6;

isFlying = false;
canAct = false;

xpNeeded = 5;
xp = 0;
xpGiven = 1;
nextLevelCharacter = undefined;

hp = 5;
maxHp = 5;
hpPrevious = 5;

hurtFlash = 0;

spd = 0.4;

target = noone;
targetX = x;
targetY = y;
avoidedObstacle = objObstacleSmartAvoid;

startingX = x;
startingY = 35;

knockedBack = false;
knockbackMultiplier = 1.0;
friction = 0.1;

team = TEAM.Enemy;

targetingChance = 30;
movementTargetChance = 30;
preferredDistance = 10;

attackCooldown = 60;
canAttackTimer = 60;
attackChance = 60;
attackObject = objAttack;
attackDmg = 1;
attackRange = 30;
attackSpeed = 3.3;
attackSpread = 10;
attackKnockback = 2;
attackSound = sndAttack;
attackSprite = sprAttackSwing;
attackDamageReduction = 0.5;

deathSound = sndDeath;

drawXScale = 1;

drawHealth = true;
hpBarWidth = 3;
hpBarHeight = 19;
drawHp = 0;
hpColor = #c2d64f;
hpBarColor = #4d6659;

bloodAmount = 5;
bloodColor = #7b234c;

pushedChance = 5;
pushAmount = 0.5;

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
	
	if (!instance_exists(target) && team == TEAM.Enemy)
	{
		target = objWizard;
		preferredDistance = 0;
	}
}

TakeDamage = function(dmg)
{
	hp -= dmg;	
	
	repeat(bloodAmount)
	{
		var g = instance_create_depth(x,y, depth - 1, objGore);
		g.image_blend = bloodColor;
		g.color = bloodColor;
	}
}

TakeKnockback = function(dir, amount)
{
	knockedBack = true;
	motion_set(dir, amount * knockbackMultiplier);
}

Attack = function(dir)
{
	canAttackTimer = attackCooldown;
	var attack = instance_create_depth(x, y, depth - 10, attackObject);
	attack.team = team;
	attack.dmg = attackDmg;
	attack.knockback = attackKnockback;
	attack.sprite_index = attackSprite;
	attack.image_angle = dir + random_range(-attackSpread, attackSpread);
	attack.direction = attack.image_angle;
	attack.speed = attackSpeed;
	attack.creator = id;
	attack.damageReduction = attackDamageReduction;
	audio_play_sound(attackSound, 0.5, false, 1, 0, random_range(0.9, 1.1));
}

Die = function()
{
	repeat(goldAmount)
	{
		instance_create_depth(x, y, depth, objGoldNugget);
	}
}

goldAmount = 1;

alarm[0] = 1;

alarm[1] = irandom(10);