/// @description Shrink
if (!mMoving) exit;

if (noone != mOwner && instance_exists(mOwner))
{
	var _distance = point_distance(x, y, mOwner.x, mOwner.y);
	move_towards_point(mOwner.x, mOwner.y, mOwner.speed > 0 ? mOwner.speed * 2 : 5);
	
	if (_distance < 3)
	{
		instance_destroy();
	}
	else if (_distance < 64)
	{
		var _scale = (_distance / 64);
		image_xscale = _scale;
		image_yscale = _scale;
	}
}
else
{
	instance_destroy();
}
