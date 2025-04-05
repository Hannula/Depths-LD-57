event_inherited();


zSpeed += zGravity;

z += zSpeed;

if ( z >= 0)
{
	instance_destroy();	
}

if (bleeds && irandom(3) !=  1)
{
	var blood = instance_create_depth(x, y, depth, objBloodDrop);	
	blood.image_blend = color;
	blood.z = z;
}