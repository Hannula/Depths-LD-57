event_inherited();

xpNeeded = 5;
xpGiven = 1;
nextLevelCharacter = objBatilisk2;

avoidedObstacle = objWall;
isFlying = true;

hp = 8;
maxHp = hp;
hpPrevious = hp;

spd = 0.45;

knockbackMultiplier = 1.5;
friction = 0.1;

team = TEAM.Enemy;

targetingChance = 30;
movementTargetChance = 20;
preferredDistance = 16;

attackCooldown = 10;
canAttackTimer = 30;
attackChance = 20;
attackObject = objAttack;
attackDmg = 1;
attackRange = 50;
attackSpeed = 3;
attackSpread = 5;
attackKnockback = 0.7;
attackSound = sndAttackStab;
attackSprite = sprAttackStab;
attackDamageReduction = 0.25;

drawHealth = true;
hpBarWidth = 3;
hpBarHeight = 18;
drawHp = 0;

bloodAmount = 5;
bloodColor = #7b234c;

pushedChance = 8;
pushAmount = 0.3;

goldAmount = 1;