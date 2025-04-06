instance_destroy(other.id);
dmg -= 1;
if (dmg <= 0)
{
	instance_destroy();
}