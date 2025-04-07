event_inherited();

xpNeeded = 10;
xpGiven = 6;

hp = 400;
maxHp = 400;
hpPrevious = 400;

waterSpeed = 0.9;
lavaSpeed = 0.9;
spd = 0.4;
isFlying = true;

avoidedObstacle = noone;

knockbackMultiplier = 0.15;
friction = 0.1;

team = TEAM.Enemy;

targetingChance = 30;
movementTargetChance = 30;
preferredDistance = random_range(40, 90);

attackCooldown = max(20, 40 - objLevel.difficulty);
canAttackTimer = 60;
attackChance = 30;
attackObject = objAttack;
attackDmg = 10;
attackRange = 120;
attackSpeed = 7;
attackSpread = 10;
attackKnockback = 1.7;
attackSound = sndAttack;
attackSprite = sprAttackLarge;
attackDamageReduction = 0.5;
attackSound = sndLargeAttack;


drawHealth = true;
hpBarWidth = 15;
hpBarHeight = - 10;
drawHp = 0;

bloodAmount = 5;
bloodColor = #7b234c;

pushedChance = 30;
pushAmount = 2;

goldAmount = 10;