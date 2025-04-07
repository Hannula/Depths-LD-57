enum BIOME
{
	Cavern,
	Crypt,
	Labyrinth,
	Swamp,
	Inferno,
	DragonsLair,
	TreasureRoom
}

currentBiome = BIOME.Cavern;

movingScreen = false;
clickSafeBuffer = 60;

gold = 0;
goldPitch = 0;

goldTimer = 0;
totalGoldCollected = 0;
difficulty = 1;
finalLevelDifficulty = 20;

firepower = 3;

MoveScreen = function()
{
	if (movingScreen)
		return;
	
	movingScreen = true;	
	screenMoveLeft = roomHeight;
	screenMoveSpeed = 1;
	levelPhase = LEVEL_PHASE.ScreenMoving;
	
	difficulty += 1;
	
	if (difficulty > 3)
	{
		currentBiome = choose(BIOME.Cavern, BIOME.Crypt, BIOME.Swamp, BIOME.Inferno);
	}
	if (difficulty == finalLevelDifficulty || difficulty == finalLevelDifficulty + 1)
	{
		currentBiome = BIOME.DragonsLair;	
	}
	if (difficulty > finalLevelDifficulty + 2)
	{
		if (difficulty mod 4 == 0)
		{
			currentBiome = BIOME.DragonsLair;
		}
	}
	
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
	GameOver,
	PayingDebt
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
	
	switch(currentBiome)
	{
		case BIOME.Crypt: SpawnShopCrypt(); break;
		case BIOME.Swamp: SpawnShopSwamp(); break;
		case BIOME.Inferno: SpawnShopInferno(); break;
		case BIOME.Cavern: SpawnShopCavern(); break;
		case BIOME.DragonsLair: SpawnShopDragonsLair(); break;
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
	switch(currentBiome)
	{
		case BIOME.Crypt: GenerateCrypt(); break;
		case BIOME.Swamp: GenerateSwamp(); break;
		case BIOME.Inferno: GenerateInferno(); break;
		case BIOME.Cavern: GenerateCavern(); break;
		case BIOME.DragonsLair: GenerateDragonsLair(); break;
	}
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