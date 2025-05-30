function GenerateCavern()
{
	if (irandom(1) == 1)
	{
		GenerateWater(irandom(5));
	}
	
	if (objLevel.difficulty > 8 && irandom(3) == 1)
	{
		GenerateLava(irandom(5));
	}
	
	var cellSize = 16;
	for(var xx = 0; xx <= room_width; xx += cellSize)
	{
		for(var yy = 0; yy < objLevel.roomHeight; yy += cellSize)
		{
			var spawnX = xx;
			var spawnY = objLevel.roomHeight + yy;
			var distToCenter = abs(room_width * 0.5 - xx);
			
			var chance = power(distToCenter / 160, 2.0);
			
			if (distToCenter < 64)
			{
				chance += (1 - distToCenter / 64) * 0.4;	
			}
			
			if (yy < 60 && xx > 16 && xx < room_width -16)
			{
				chance = 0;
			}
			if (yy > 160)
			{
				chance = 1;
			}
			var wallType = choose(objWall, objWall);
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
	/*repeat(10)
	{
		var xx = irandom(room_width);
		var yy = irandom_range(50, room_height);
	
		var spawnX = xx;
		var spawnY = yy  + objLevel.roomHeight;
		if (!collision_point(spawnX, spawnY, objEntity, false, true))
		{
			var p = instance_create_depth(spawnX, spawnY, 0, objProp);
			p.sprite_index = sprPropsCatacombs;
			p.image_index = irandom(1000);
		}
	}*/
	
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
		SpawnEnemiesCavern();
	}
	
}


function SpawnEnemiesCavern()
{
	var quota = power(difficulty, 1.35);
	var baseEnemy = choose(objSkeleton1, objGoblin1);
	var elite1 = choose(objSkeleton2, objMinotaur1, objArcher2, objGoblin2, objGoblin2, objGoblin2);
	var elite2 = choose(objSkeleton3, objMinotaur2, objArcher3, objGoblin3, objGoblin3, objGoblin3);
	
	while(quota > 0)
	{
		quota -= 1;
		var enemy = choose(baseEnemy, baseEnemy, baseEnemy, baseEnemy, baseEnemy, baseEnemy, baseEnemy, objSkeleton1, objGoblin1, objArcher1);
		
		if (difficulty > 2)
		{
			if (irandom(max(0, 30 / difficulty)) == 0)
			{
				enemy = choose(elite1, elite1, elite1, elite1, elite1, elite1, elite1, elite1, elite1, objMinotaur1, objLizard1, objBatilisk1, objGoblin2, objGoblin2);
				if (irandom(100) == 1)
				{
					enemy = choose(objSkeleton2, objGoblin2, objMinotaur1, objLizard1, objBatilisk1, objBogslium1);
				}
				quota -= 3;
			}
		}
		
		if (difficulty > 4)
		{
			if (irandom(max(1, 60 / difficulty)) == 1)
			{
				enemy = choose(elite2, elite2, elite2, elite2, elite2, elite2, elite2, elite2, objMinotaur2, objBatilisk1, objSkeleton3, objGoblin3, objGoblin3);
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

function SpawnShopCavern()
{
	var items = 5;
	var gap = 60;
	var leftX = room_width * 0.5 - items * 0.5 * gap + gap * 0.5;
	for(var i = 0; i < items; i++)
	{
		var itemType = choose(objShopButton, objShopButtonGoblin1, objShopButtonGoblin1, objShopButtonGoblin1, objShopButtonArcher1, objShopButtonMinotaur1);
		var item = instance_create_depth(leftX + i * gap, 60, -1000, itemType);
	}
	for(var i = 0; i < items; i++)
	{
		var itemType = choose(objShopButtonSkeleton2, objShopButtonSkeleton3,
		objShopButtonGoblin2, objShopButtonGoblin2, objShopButtonGoblin3,
		objShopButtonGoblin2, objShopButtonGoblin2, objShopButtonGoblin3,
		objShopButtonArcher2, objShopButtonArcher2, objShopButtonArcher3,
		objShopButtonMinotaur2, objShopButtonMinotaur2, objShopButtonMinotaur3);
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