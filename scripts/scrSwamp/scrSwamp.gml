function GenerateSwamp()
{
	GenerateWater(irandom_range(4, 8));
	
	var cellSize = 16;
	for(var xx = 0; xx <= room_width; xx += cellSize)
	{
		for(var yy = 0; yy < objLevel.roomHeight; yy += cellSize)
		{
			var spawnX = xx;
			var spawnY = objLevel.roomHeight + yy;
			var distToCenter = abs(room_width * 0.5 - xx);
			
			var chance = power(distToCenter / 160, 3);
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
	repeat(20)
	{
		var xx = irandom(room_width);
		var yy = irandom_range(50, room_height);
	
		var spawnX = xx;
		var spawnY = yy  + objLevel.roomHeight;
		if (!collision_point(spawnX, spawnY, objEntity, false, true))
		{
			var p = instance_create_depth(spawnX, spawnY, 0, objProp );
			p.sprite_index = sprPropsSwamp;
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
		SpawnEnemiesSwamp();
	}
	
}


function SpawnEnemiesSwamp()
{
	var quota = power(difficulty, 1.35);
	var baseEnemy = choose(objGoblin1, objGoblin1, objArcher1, objLizard1);
	var elite1 = choose(objBogslium1, objLizard2, objArcher2);
	var elite2 = choose(objBogslium2, objLizard3, objArcher3);
	
	while(quota > 0)
	{
		quota -= 1;
		var enemy = choose(baseEnemy, baseEnemy, baseEnemy, baseEnemy, baseEnemy,baseEnemy,baseEnemy, objArcher1, objGoblin1, objLizard1);
		
		if (difficulty > 2)
		{
			if (irandom(max(0, 40 / difficulty)) == 0)
			{
				enemy = choose(elite1, elite1, elite1, elite1, elite1, elite1, objBogslium1, objLizard2, objArcher2);
				if (irandom(100) == 1)
				{
					enemy = choose(objSkeleton2, objGoblin2, objMinotaur1, objLizard1, objBatilisk1, objBogslium1);
				}
				quota -= 2;
			}
		}
		
		if (difficulty > 4)
		{
			if (irandom(max(1, 80 / difficulty)) == 1)
			{
				enemy = choose(elite2, elite2, elite2, elite2, elite2, elite2, objBogslium2, objBogslium3, objArcher3, objLizard3);
				quota -= 6;
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
}

function SpawnShopSwamp()
{
	var items = 5;
	var gap = 60;
	var leftX = room_width * 0.5 - items * 0.5 * gap + gap * 0.5;
	for(var i = 0; i < items; i++)
	{
		var itemType = choose(objShopButtonBogslium1, objShopButtonArcher1, objShopButtonGoblin1, objShopButtonLizard1);
		var item = instance_create_depth(leftX + i * gap, 60, -1000, itemType);
	}
	for(var i = 0; i < items; i++)
	{
		var itemType = choose(objShopButtonBogslium2, objShopButtonBogslium3, objShopButtonBogslium2,
			objShopButtonArcher2, objShopButtonArcher2, objShopButtonArcher3, 
			objShopButtonLizard2, objShopButtonLizard2, objShopButtonLizard3);
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