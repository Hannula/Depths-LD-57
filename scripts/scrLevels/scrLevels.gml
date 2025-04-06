function GenerateLevel()
{
	if (objLevel.currentBiome == BIOME.Inferno)
	{
		GenerateLava(irandom_range(2, 6));
	}
	else if (objLevel.currentBiome == BIOME.Cavern)
	{
		if (objLevel.difficulty > 6 && irandom(4) == 1)
		{
			GenerateLava(irandom(4));
		}
		else if (objLevel.difficulty > 3)
		{
			GenerateWater(irandom(5));
		}
	}
	else if (objLevel.currentBiome == BIOME.Swamp)
	{
		GenerateWater(irandom_range(3, 7));
	}
	
	
	var cellSize = 16;
	for(var xx = 0; xx <= room_width; xx += cellSize)
	{
		for(var yy = 0; yy < objLevel.roomHeight; yy += cellSize)
		{
			var spawnX = xx;
			var spawnY = objLevel.roomHeight + yy;
			var distToCenter = abs(room_width * 0.5 - xx);
			
			var chance = power(distToCenter / 160, 2);
			if (yy < 60 && xx > 16 && xx < room_width -16)
			{
				chance = 0;
			}
			if (yy > 160)
			{
				chance = 1;
			}
			
			if (random(1) < chance)
			{
				if (!collision_point(spawnX, spawnY, objEntity, false, true))
				{
					instance_create_depth(spawnX, spawnY, 0, objWall);
				}
			}
		}
	}
	if (objLevel.difficulty == objLevel.finalLevelDifficulty +1)
	{
		repeat(50)
		{
			var xx = irandom(room_width / cellSize);
			var yy = irandom_range(3, room_height / cellSize);
	
			var spawnX = xx * cellSize;
			var spawnY = yy * cellSize + objLevel.roomHeight;
			if (!collision_point(spawnX, spawnY, objEntity, false, true))
			{
				instance_create_depth(spawnX, spawnY, 0, objGoldPile);
			}
		}
	}
	else
	{
		SpawnEnemies();
	}
	
}

function GenerateLava(amount)
{
	var cellSize = 16;
	repeat(amount)
	{
		var xx = irandom(room_width / cellSize);
		var yy = irandom_range(4, room_height / cellSize);
	
		var spawnX = xx * cellSize;
		var spawnY = yy * cellSize + objLevel.roomHeight;
	
		if (!collision_point(spawnX, spawnY, objEntity, false, true))
		{
			instance_create_depth(spawnX, spawnY, 0, objLava);
		}
	}
}

function GenerateWater(amount)
{
	var cellSize = 16;
	repeat(amount)
	{
		var xx = irandom(room_width / cellSize);
		var yy = irandom_range(3, room_height / cellSize);
	
		var spawnX = xx * cellSize;
		var spawnY = yy * cellSize + objLevel.roomHeight;
	
		if (!collision_point(spawnX, spawnY, objEntity, false, true))
		{
			instance_create_depth(spawnX, spawnY, 0, objWater);
		}
	}
}


function SpawnEnemies()
{
	var quota = power(1 + difficulty, 1.35);
	var baseEnemy = choose(objSkeleton1, objSkeleton1, objSkeleton1, objGoblin1);
	var elite1 = choose(objSkeleton2, objSkeleton2, objGoblin2, objMinotaur1, objLizard1, objBatilisk1);
	var elite2 = choose(objMinotaur2, objGoblin3, objArcher2, objSkeleton3, objLizard2, objBatilisk2);
	var elite3 = choose(objMinotaur3, objArcher3, objLizard3, objBatilisk3);
	
	while(quota > 0)
	{
		quota -= 1;
		var enemy = choose(baseEnemy, baseEnemy, baseEnemy, baseEnemy, baseEnemy, baseEnemy, baseEnemy, objSkeleton1, objGoblin1, objArcher1, objSkeleton1, objGoblin1, objArcher1, objLizard1);
		
		if (difficulty > 1)
		{
			if (irandom(max(3, 50 / difficulty)) == 1)
			{
				enemy = choose(elite1, elite1, elite1, elite1, elite1, elite1, elite1, elite1, objSkeleton2, objGoblin2, objMinotaur1, objLizard1, objBatilisk1, objBogslium1);
				quota -= 2;
			}
		}
		
		if (difficulty > 3)
		{
			if (irandom(max(10, 120 / difficulty)) == 1)
			{
				enemy = choose(elite2, elite2, elite2, elite2, elite2, elite2, elite2, elite2, objMinotaur2, objGoblin3, objArcher2, objSkeleton3, objLizard2, objBatilisk2, objBogslium2);
				quota -= 3;
			}
		}
		
		if (difficulty > 5)
		{
			if (irandom(max(10, 220 / difficulty)) == 1)
			{
				enemy = choose(elite3, elite3, elite3, elite3, elite3, elite3, elite3, elite3, objMinotaur3, objArcher3,objLizard3, objBatilisk3, objBogslium3);
				quota -= 5;
			}
		}
		
		var xx = random_range(30, room_width - 30);
		var yy = random_range(80, 170) + roomHeight;
		repeat(50)
		{
			if (!collision_circle(xx, yy, 6, objObstacleSmartAvoid, false, true))
			{
				instance_create_depth(xx, yy, 0, enemy);
				break;
			}
			xx = random_range(30, room_width - 30);
			yy = random_range(80, 120) + roomHeight;
		}
		
	}
	
	if (objLevel.difficulty == objLevel.finalLevelDifficulty)
	{
		instance_create_depth(room_width * 0.5, objLevel.roomHeight + 160, 0, objDragon);	
	}
}