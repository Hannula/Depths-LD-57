function Biome(_baseEnemies, _rareEnemies, _baseElites, _rareElites, _normalSales, _rareSales) constructor
{
	props = [];
	propAmountMin = 5;
	propAmountMax = 10;
	
	baseEnemies = _baseEnemies;
	rareEnemies = _rareEnemies;
	baseElites = _baseElites;
	rareElites = _rareElites;
	normalSales = _normalSales;
	rareSales = _rareSales;

	waterChance = 0;
	waterMin = 0;
	waterMax = 1;
	
	lavaChance = 0;
	lavaMin = 0;
	lavaMax = 1;

	SetWater = function(_chance = 0.5, _min = 0, _max = 5)
	{
		waterChance = _chance;
		waterMin = _min;
		waterMax = _max;
	}
	
	SetLava = function(_chance = 0.5, _min = 0, _max = 5)
	{
		lavaChance = _chance;
		lavaMin = _min;
		lavaMax = _max;
	}
	
	SetProps = function(_props, _min, _max)
	{
		props = [];		
		propAmountMin = _min;
		propAmountMax = _max;
	}
}

function BiomesCreate()
{
	global.biomeCavernEasy = new Biome(
	[objSkeleton1, objSkeleton1, objArcher1, objGoblin1],
	[objArcher1, objGoblin1, objSkeleton1],
	[objSkeleton2, objSkeleton2, objGoblin2],
	[objShopButtonSkeleton1],
	[],
	[]);
	
	
}