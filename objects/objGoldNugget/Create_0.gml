z = -1;

zGravity = 0.25;
zSpeed = random_range(-3, -7);
speed = random(3);
direction = random(360);
image_angle = random(360);
rotSpeed = random_range(10, 30) * choose(-1, 1);
image_speed = 0;

image_xscale = random_range(0.5, 1);
image_yscale = image_xscale;

friction = 0.1;

canBeCollected = true;

amount = 10;