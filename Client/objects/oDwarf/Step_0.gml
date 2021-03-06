/// @description
event_inherited();
if (!mIsAlive) exit;

#region Respond to Controller
if (noone != mController && instance_exists(mController))
{
	//var facingDir = point_direction(x, y, mController.mPointerX, mController.mPointerY);
	//image_angle = facingDir;
	
	mController.x = x;
	mController.y = y;
	
	#region Throw Bomb
	if (noone != mBomb && instance_exists(mBomb))
	{
		mBomb.x = x;
		mBomb.y = y - 5;
		mBomb.mAltitude = 32;
		if (!mController.mIsPrimaryAction)
		{
			var distance = mThrowRange;//min(point_distance(x, y, mController.mPointerX, mController.mPointerY), mThrowRange);
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
			mBomb = instance_create_layer(x, y, "Instances", mBombType);
			mCanThrow = false;
			alarm[1] = mCanThrowCooldown * room_speed;
			mBombCount -= 1;
		}
		else
		{
			mBomb = noone;
		}
	}
	#endregion
	
	#region Deflect Bomb
	if (mCanDeflect && mController.mIsSecondaryAction)
	{
		var otherBomb = collision_circle(x, y, 16, oBomb, false, false);
		if (noone != otherBomb)
		{
			otherBomb.direction = image_angle;
			otherBomb.speed = 7;
			otherBomb.mMovementTimer = room_speed * 0.5;
			mCanDeflect = false;
			alarm[0] = mDeflectCooldown * room_speed;
		}
	}
	#endregion
	
	#region Movement
	var xVector = x;
	var yVector = y;
	var moving = false;
	if (mController.mIsLeft) {xVector -= 1; moving = true;}
	if (mController.mIsRight) {xVector +=1 ; moving = true;}
	if (mController.mIsUp) {yVector -= 1; moving = true;}
	if (mController.mIsDown) {yVector += 1; moving = true;}
	
	direction = point_direction(x, y, xVector, yVector);
	speed = moving ? mMaxSpeed : 0;
	#endregion
	
	#region Collision
	if(place_meeting(x + hspeed, y, oCollision)) {
		while(!place_meeting(x + sign(hspeed), y, oCollision)){ x += sign(hspeed) };
		hspeed = 0;
	}
	if(place_meeting(x, y + vspeed, oCollision)) {
		while(!place_meeting(x, y + sign(vspeed), oCollision)){ y += sign(vspeed) };
		vspeed = 0;
	}
	#endregion
	
	#region Animation
	if (moving) {
		if (hspeed != 0 ) {
			sprite_index = sBlue_Right;
		} else if (vspeed > 0) {
			sprite_index = sBlue_Down;
		} else if (vspeed < 0) {
			sprite_index = sBlue_Up;
		}
		image_xscale = hspeed > 0 ? 1 : -1;
	} else {
		sprite_index = sBlue_Standing;
		image_xscale = mController.mPointerX > x ? 1 : -1;
	}
	#endregion
}
#endregion

#region Pick up Bombs
var _bombPile = instance_nearest(x, y, oBombPile);
if (noone != _bombPile)
{
	var _distance = point_distance(x, y, _bombPile.x, _bombPile.y);
	if (_distance < 64 && _bombPile.mOwner == noone)
	{
		_bombPile.mOwner = id;
	}
}
#endregion
