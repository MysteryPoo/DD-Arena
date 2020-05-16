/// @description Fuse and Move
mFuse -= 1;

if (mFuse <= 0)
{
	instance_create_layer(x, y, "Instances", obj_explosion_1);
	instance_destroy();
}

if (mMovementTimer-- == 0)
{
	speed = 0;	
}

var collisionCheck = collision_circle(x, y, 8, oBomb, false, true);
if (noone != collisionCheck)
{
	// TODO : Deflection
}
