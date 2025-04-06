function GenerateDragonsLair()
{
	GenerateLava(2);

	
	var cellSize = 16;
	for(var xx = 0; xx <= room_width; xx += cellSize)
	{
		for(var yy = 0; yy < objLevel.roomHeight; yy += cellSize)
		{
			var spawnX = xx;
			var spawnY = objLevel.roomHeight + yy;
			var distToCenter = abs(room_width * 0.5 - xx);
			
			var chance = power(distToCenter / 160, 1.8);
			if (yy < 60 && xx > 16 && xx < room_width -16)
			{
				chance = 0;
			}
			if (yy > 160)
			{
				chance = 1;
			}
			var wallType = choose(objWall, objWall, objWall, objWall, objBrick, objBrick, objBrimstone);
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
			var p = instance_create_depth(spawnX, spawnY, 0, objProp);
			p.sprite_index = sprPropsCorpses;
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
		SpawnEnemiesDragonsLair();
	}
	
}


function SpawnEnemiesDragonsLair()
{
	var numDragons = floor(1 + (objLevel.difficulty - objLevel.finalLevelDifficulty) * 0.25);
	var leftX = room_width * 0.5;
	var gap = 0;
	
	if (numDragons > 1)
	{
		leftX = 60;
		gap = (room_width - leftX * 2) / (numDragons - 1); 
	}
	
	for(var i = 0; i < numDragons; i++)
	{
		instance_create_depth(leftX + gap * i + random_range(-10, 10), 160 + objLevel.roomHeight - irandom(30), 0, objDragon);
	}
	
	var quota = power(difficulty, 1.35);
	var baseEnemy = choose(objSkeleton2, objSkeleton2, objSkeleton2);
	var elite1 = choose(objSkeleton3, objSkeleton2, objMinotaur1, objLizard1);
	
	while(quota > 0)
	{
		quota -= 8;
		var enemy = choose(baseEnemy, baseEnemy, baseEnemy, baseEnemy, baseEnemy, baseEnemy, baseEnemy, objSkeleton1, objSkeleton2);
		
		if (difficulty > 2)
		{
			if (irandom(max(0, 50 / difficulty)) == 0)
			{
				enemy = choose(elite1, elite1, elite1, elite1, elite1, elite1, elite1, elite1, objSkeleton3, objSkeleton3, objSkeleton3);
				if (irandom(100) == 1)
				{
					enemy = choose(objSkeleton2, objGoblin2, objMinotaur1, objLizard1, objBatilisk1, objBogslium1);
				}
				quota -= 8;
			}
		}
		
		var xx = random_range(20, room_width - 20);
		var yy = random_range(110, 170) + roomHeight;
		repeat(70)
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

function SpawnShopDragonsLair()
{
	var items = 5;
	var gap = 60;
	var leftX = room_width * 0.5 - items * 0.5 * gap + gap * 0.5;
	for(var i = 0; i < items; i++)
	{
		var itemType = choose(objShopButtonSkeleton2, objShopButtonSkeleton2);
		var item = instance_create_depth(leftX + i * gap, 60, -1000, itemType);
	}
	for(var i = 0; i < items; i++)
	{
		var itemType = choose(objShopButtonSkeleton3, objShopButtonSkeleton3);
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