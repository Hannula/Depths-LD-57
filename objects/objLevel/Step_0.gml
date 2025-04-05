if (movingScreen)
{	
	if (screenMoveLeft > 0)
	{
		var t = screenMoveLeft / roomHeight;
		screenMoveSpeed = CurveEvaluate(crvTransition, t);
		screenMoveLeft -= screenMoveSpeed;
		with(objEntity)
		{
			y -= other.screenMoveSpeed;	
		}
	}
	else
	{
		levelPhase = LEVEL_PHASE.Prepare;
		movingScreen = false;	
	}
}
var enemyExists = false;
with(objCharacter)
{
	if (team == TEAM.Enemy)
	{
		enemyExists = true;	
	}
}

if (!enemyExists && levelPhase == LEVEL_PHASE.Battle)
{
	levelPhase = LEVEL_PHASE.Cleared;	
}

if (instance_exists(objWizard) && objWizard.hp <= 0)
{
	EndGame();	
}


if (clickSafeBuffer > 0)
{
	clickSafeBuffer -= 1;	
}

if (levelPhase != LEVEL_PHASE.Battle)
{
	hoveredCharacter = collision_circle(mouse_x, mouse_y, 5, objCharacter, false, true);
}
else
{
	hoveredCharacter = noone;
	grabbedCharacter = noone;
}

hoveredShopButton = collision_circle(mouse_x, mouse_y, 5, objShopButton, false, true);

cursorImage = 0;
if (instance_exists(hoveredCharacter) && hoveredCharacter.team == TEAM.Player)
{
	cursorImage = 1;
	if (mouse_check_button_pressed(mb_left))
	{
		grabbedCharacter = hoveredCharacter;
	}
}
else
{
	if (instance_exists(hoveredShopButton))
	{
		cursorImage = 1;
		if (mouse_check_button_pressed(mb_left))
		{
			if (gold >= hoveredShopButton.cost)
			{
				hoveredShopButton.Buy();
				audio_play_sound(sndBuy, 0.7, false);	
			}
			else
			{
				audio_play_sound(sndNope, 0.7, false);	
			}
		}
	}
}

if (instance_exists(grabbedCharacter))
{
	cursorImage = 2;
	grabbedCharacter.x = mouse_x;
	grabbedCharacter.y = clamp(mouse_y + 8, 10, 30);
	
	if (mouse_check_button_released(mb_left))
	{
		grabbedCharacter = noone;	
	}
}
	
if (levelPhase == LEVEL_PHASE.Battle)
{
	cursorImage = 3 + mouse_check_button(mb_left);
	if (instance_exists(objWizard) && objWizard.mana < objWizard.shotManacost)
	{
		cursorImage = 5 + mouse_check_button(mb_left);;
	}
}

if (goldTimer > 0)
{
	goldTimer -= 1;	
}
else
{
	goldPitch = 0;	
}