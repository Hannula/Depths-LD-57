movingScreen = false;
clickSafeBuffer = 60;

gold = 0;
goldPitch = 0;

goldTimer = 0;
totalGoldCollected = 0;
difficulty = 1;
finalLevelDifficulty = 50;

firepower = 2;

MoveScreen = function()
{
	if (movingScreen)
		return;
	
	movingScreen = true;	
	screenMoveLeft = roomHeight;
	screenMoveSpeed = 1;
	levelPhase = LEVEL_PHASE.ScreenMoving;
	
	difficulty += 1;
	SpawnNextRoom();
	
	with(objWizard)
	{
		canBeHurt = true;
	}
	//audio_play_sound(sndAttack, 1, false);
}

screenMoveLeft = 0;
screenMoveSpeed = 5;

roomHeight = 240;

levelPhase = LEVEL_PHASE.Prepare;

enum LEVEL_PHASE
{
	Prepare,
	Battle,
	Cleared,
	Shopping,
	ScreenMoving,
	GameOver
}

StartBattle = function()
{
	if (levelPhase != LEVEL_PHASE.Prepare)
		return;
		
	levelPhase = LEVEL_PHASE.Battle;
	audio_play_sound(sndSelect, 1, false);
	clickSafeBuffer = 60;
}

EndBattle = function()
{
	if (levelPhase != LEVEL_PHASE.Battle)
		return;
		
	levelPhase = LEVEL_PHASE.Cleared;
	audio_play_sound(sndSelect, 1, false);
	clickSafeBuffer = 60;
}


OpenShop = function()
{
	if (levelPhase != LEVEL_PHASE.Cleared)
		return;
		
	var items = 5;
	var gap = 60;
	var leftX = room_width * 0.5 - items * 0.5 * gap + gap * 0.5;
	for(var i = 0; i < items; i++)
	{
		var itemType = choose(objShopButton, objShopButtonMinotaur1, objShopButtonGoblin1, objShopButtonArcher1, objShopButtonLizard1, objShopButtonBatilisk1, objShopButtonBogslium1);
		var item = instance_create_depth(leftX + i * gap, 60, -1000, itemType);
	}
	for(var i = 0; i < items; i++)
	{
		var itemType = choose(objShopButtonSkeleton2, objShopButtonSkeleton3, objShopButtonMinotaur2, objShopButtonMinotaur3, 
		objShopButtonGoblin2, objShopButtonGoblin3, objShopButtonArcher2, objShopButtonArcher3,
		objShopButtonLizard2, objShopButtonLizard3, objShopButtonBatilisk2, objShopButtonBatilisk3,
		objShopButtonBogslium2, objShopButtonBogslium3);
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
	
	levelPhase = LEVEL_PHASE.Shopping;
	audio_play_sound(sndSelect, 1, false);
	clickSafeBuffer = 60;
}

EndGame = function()
{
	if (levelPhase == LEVEL_PHASE.GameOver)
		return;
		
	levelPhase = LEVEL_PHASE.GameOver;
	audio_play_sound(sndSelect, 1, false);
	clickSafeBuffer = 60;
}

SpawnNextRoom = function()
{
	GenerateLevel();
}

cursorImage = 0;

hoveredCharacter = noone;
grabbedCharacter = noone;
hoveredShopButton = noone;

AddGold = function(amount)
{
	gold += amount;
	audio_play_sound(sndPickupGold, 0.5, false, 1, 0, 1 + goldPitch);
	
	goldTimer = 60;
	goldPitch += 0.01;
	goldPitch = min(goldPitch, 2.5);
	
	totalGoldCollected += amount;
}