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
else
{
	mAltitude = max(0, mAltitude - 1);
	if (mAltitude == 0 && speed > 0)
	{
		var _delta = hspeed > 0 ? -15 : 15;
		image_angle += _delta;
	}
	else image_angle = 0;
}

var collisionCheck = collision_circle(x, y, 8, oBomb, false, true);
if (noone != collisionCheck)
{
	// TODO : Deflection
}
