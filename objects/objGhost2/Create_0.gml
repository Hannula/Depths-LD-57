event_inherited();

xpNeeded = 10;
xpGiven = 2;
nextLevelCharacter = objGhost3;

avoidedObstacle = objWall;
isFlying = true;

hp = 16;
maxHp = hp;
hpPrevious = hp;

spd = 0.25;

knockbackMultiplier = 0.6;
friction = 0.1;

team = TEAM.Enemy;

targetingChance = 30;
movementTargetChance = 20;
preferredDistance = 60;

attackCooldown = 70;
canAttackTimer = 30;
attackChance = 30;
attackObject = objAttack;
attackDmg = 2;
attackRange = 80;
attackSpeed = 7;
attackSpread = 5;
attackKnockback = 0.2;
attackSound = sndAttackStab;
attackSprite = sprGhostOrb;
attackDamageReduction = 0.25;

drawHealth = true;
hpBarWidth = 4;
hpBarHeight = 18;
drawHp = 0;

bloodAmount = 5;
bloodColor = #7b234c;

pushedChance = 8;
pushAmount = 0.3;

goldAmount = 3;