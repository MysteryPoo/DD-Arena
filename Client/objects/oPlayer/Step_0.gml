/// @description React to Controller
if (noone != mController && instance_exists(mController))
{
	var facingDir = point_direction(x, y, mController.mPointerX, mController.mPointerY);
	image_angle = facingDir;
	
	if (noone != mBomb && instance_exists(mBomb))
	{
		mBomb.x = x;
		mBomb.y = y;
		mBomb.mAltitude = 32;
		if (!mController.mIsPrimaryAction)
		{
			var distance = min(point_distance(x, y, mController.mPointerX, mController.mPointerY), mThrowRange);
			var angle = point_direction(x, y, mController.mPointerX, mController.mPointerY);
			var _x = x + lengthdir_x(distance, angle);
			var _y = y + lengthdir_y(distance, angle);
			mBomb.mTargetX = _x;
			mBomb.mTargetY = _y;
			mBomb.direction = point_direction(x, y, mBomb.mTargetX, mBomb.mTargetY);
			mBomb.speed = 5;
			mBomb.mAltitude = 32;
			mBomb.mMovementTimer = round(point_distance(x, y, mBomb.mTargetX, mBomb.mTargetY) / mBomb.speed);
			mBomb = noone;
		}
	}
	else
	{
		if (mCanThrow && mBombCount > 0 && mController.mIsPrimaryAction)
		{
			mBomb = instance_create_layer(x, y, "Instances", oBomb);
			mCanThrow = false;
			alarm[1] = mCanThrowCooldown * room_speed;
			mBombCount -= 1;
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
			alarm[0] = mDeflectCooldown * room_speed;
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

var _bombPile = instance_nearest(x, y, oBombPile);
if (noone != _bombPile)
{
	var _distance = point_distance(x, y, _bombPile.x, _bombPile.y);
	if (_distance < 128 && _bombPile.mOwner == noone)
	{
		_bombPile.mOwner = id;
	}
}
