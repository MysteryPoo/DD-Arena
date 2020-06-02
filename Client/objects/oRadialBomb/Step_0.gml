/// @description Fuse and Move
mFuse -= 1;

if (mFuse <= 0)
{
	var _bombCount = 6;
	var _angleDelta = round(360 / _bombCount);
	for(var i = 0; i < _bombCount; ++i)
	{
		var _bomb = instance_create_layer(x, y, "Instances", oBomb);
		_bomb.direction = i * _angleDelta;
		_bomb.speed = 3;
		_bomb.mMovementTimer = room_speed * 0.5;
		_bomb.mMaxFuse = room_speed * 0.7;
		_bomb.mFuse = _bomb.mMaxFuse;
	}
	instance_destroy();
}

if (mMovementTimer-- == 0)
{
	speed = 0;	
}
else
{
	mAltitude = max(0, mAltitude - 2);
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
