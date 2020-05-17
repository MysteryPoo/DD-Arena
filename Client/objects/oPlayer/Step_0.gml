/// @description React to Controller
if (noone != mController && instance_exists(mController))
{
	var facingDir = point_direction(x, y, mController.mPointerX, mController.mPointerY);
	image_angle = facingDir;
	
	if (noone != mBomb && instance_exists(mBomb))
	{
		mBomb.x = x;
		mBomb.y = y;
		if (!mController.mIsPrimaryAction)
		{
			var distance = min(point_distance(x, y, mController.mPointerX, mController.mPointerY), 512);
			var angle = point_direction(x, y, mController.mPointerX, mController.mPointerY);
			var _x = x + lengthdir_x(distance, angle);
			var _y = y + lengthdir_y(distance, angle);
			mBomb.mTargetX = _x;
			mBomb.mTargetY = _y;
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
	
	if (mCanDeflect && mController.mIsSecondaryAction)
	{
		var otherBomb = collision_circle(x, y, 16, oBomb, false, false);
		if (noone != otherBomb)
		{
			otherBomb.direction = image_angle;
			otherBomb.speed = 3;
			otherBomb.mMovementTimer = room_speed * 0.5;
			mCanDeflect = false;
			alarm[0] = room_speed;
		}
	}
	
	var xVector = x;
	var yVector = y;
	var moving = false;
	if (mController.mIsLeft) {xVector -= 1; moving = true;}
	if (mController.mIsRight) {xVector +=1 ; moving = true;}
	if (mController.mIsUp) {yVector -= 1; moving = true;}
	if (mController.mIsDown) {yVector += 1; moving = true;}
	
	direction = point_direction(x, y, xVector, yVector);
	speed = moving ? 5 : 0;
	
	mIsMoving = moving;
}
