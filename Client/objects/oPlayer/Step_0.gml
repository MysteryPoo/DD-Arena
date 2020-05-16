/// @description React to Controller
if (noone != mController && instance_exists(mController))
{
	var facingDir = point_direction(x, y, mController.mPointerX, mController.mPointerY);
	image_angle = facingDir;
	
	if (noone != mBomb && instance_exists(mBomb))
	{
		if (!mController.mIsPrimaryAction)
		{
			mBomb.mTargetX = mController.mPointerX;
			mBomb.mTargetY = mController.mPointerY;
			mBomb.direction = point_direction(x, y, mBomb.mTargetX, mBomb.mTargetY);
			mBomb.speed = 5;
			mBomb.mMovementTimer = round(point_distance(x, y, mBomb.mTargetX, mBomb.mTargetY) / mBomb.speed);
			mBomb = noone;
		}
	}
	else
	{
		if (mController.mIsPrimaryAction)
		{
			mBomb = instance_create_layer(x, y, "Instances", oBomb);
			
		}
		else
		{
			mBomb = noone;
		}
	}
}
