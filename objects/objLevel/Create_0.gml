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

currentBiome = BIOME.Crypt;

movingScreen = false;
clickSafeBuffer = 60;

gold = 0;
goldPitch = 0;

goldTimer = 0;
totalGoldCollected = 0;
difficulty = 1;
finalLevelDifficulty = 30;

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
	
	if (currentBiome == BIOME.Crypt)
	{
		SpawnShopCrypt();		
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
	if (currentBiome == BIOME.Crypt)
	{
		GenerateCrypt();
		return;
	}
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