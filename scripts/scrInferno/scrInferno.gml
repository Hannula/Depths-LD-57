function GenerateInferno()
{
	GenerateLava(irandom_range(3, 5));
	
	var cellSize = 16;
	for(var xx = 0; xx <= room_width; xx += cellSize)
	{
		for(var yy = 0; yy < objLevel.roomHeight; yy += cellSize)
		{
			var spawnX = xx;
			var spawnY = objLevel.roomHeight + yy;
			var distToCenter = abs(room_width * 0.5 - xx);
			
			var chance = power(distToCenter / 160, 2.3);
			if (yy < 60 && xx > 16 && xx < room_width -16)
			{
				chance = 0;
			}
			if (yy > 160)
			{
				chance = 1;
			}
			var wallType = choose(objWall, objWall, objWall, objWall, objWall, objBrimstone);
			if (random(1) < chance)
			{
				if (!collision_point(spawnX, spawnY, objEntity, false, true))
				{
					instance_create_depth(spawnX, spawnY, 0, wallType);
				}
			}
		}
	}
	
	// Props
	repeat(20)
	{
		var xx = irandom(room_width);
		var yy = irandom_range(50, room_height);
	
		var spawnX = xx;
		var spawnY = yy  + objLevel.roomHeight;
		if (!collision_point(spawnX, spawnY, objEntity, false, true))
		{
			var p = instance_create_depth(spawnX, spawnY, 0, objProp );
			p.sprite_index = sprPropsInferno;
			p.image_index = irandom(1000);
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
		SpawnEnemiesInferno();
	}
	
}


function SpawnEnemiesInferno()
{
	var quota = power(difficulty, 1.35);
	var baseEnemy = choose(objBatilisk1, objSkeleton1, objSkeleton2, objBatilisk1, objSkeleton1, objSkeleton2, objLizard1);
	var elite1 = choose(objSkeleton3, objSkeleton3, objBatilisk2, objBatilisk2, objMinotaur2);
	var elite2 = choose(objBatilisk3, objMinotaur3);
	
	while(quota > 0)
	{
		quota -= 2;
		var enemy = choose(baseEnemy, baseEnemy, baseEnemy, baseEnemy, objBatilisk1, objBatilisk2, objSkeleton1, objSkeleton2, objLizard1);
		
		if (difficulty > 2)
		{
			if (irandom(max(0, 30 / difficulty)) == 0)
			{
				enemy = choose(elite1, elite1, elite1, elite1, objSkeleton3, objSkeleton3, objBatilisk2, objMinotaur2);
				if (irandom(100) == 1)
				{
					enemy = choose(objSkeleton3, objGoblin3, objMinotaur2, objLizard2, objBatilisk2, objBogslium2);
				}
				quota -= 2;
			}
		}
		
		if (difficulty > 4)
		{
			if (irandom(max(1, 90 / difficulty)) == 1)
			{
				enemy = choose(elite2, elite2, elite2, elite2, elite2, objMinotaur3, objBatilisk3);
				quota -= 4;
			}
		}
		
		var xx = random_range(30, room_width - 30);
		var yy = random_range(110, 170) + roomHeight;
		repeat(50)
		{
			if (!collision_circle(xx, yy, 6, objObstacleSmartAvoid, false, true))
			{
				instance_create_depth(xx, yy, 0, enemy);
				break;
			}
			xx = random_range(30, room_width - 30);
			yy = random_range(80, 170) + roomHeight;
		}
	}
}

function SpawnShopInferno()
{
	var items = 5;
	var gap = 60;
	var leftX = room_width * 0.5 - items * 0.5 * gap + gap * 0.5;
	for(var i = 0; i < items; i++)
	{
		var itemType = choose(objShopButtonSkeleton2, objShopButtonBatilisk1);
		var item = instance_create_depth(leftX + i * gap, 60, -1000, itemType);
	}
	for(var i = 0; i < items; i++)
	{
		var itemType = choose(objShopButtonSkeleton3, objShopButtonSkeleton3,
			objShopButtonBatilisk2, objShopButtonBatilisk2, objShopButtonBatilisk3, 
			objShopButtonMinotaur2, objShopButtonMinotaur3);
		if (i == items - 1)
		{
			itemType = objShopButtonInvest;
		}
		if (i == items - 2)
		{
			itemType = objShopButtonFirepower;
		}
		var item = instance_create_depth(leftX + i * gap, 110, -1000, itemType);
	}
	
}