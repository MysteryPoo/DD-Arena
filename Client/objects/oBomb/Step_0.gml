/// @description Fuse and Move
mFuse -= 1;

#region Explode
if (mFuse <= 0)
{
	var _damagedList = ds_list_create();
	var _damagedCount = collision_circle_list(x, y, 64, oSyncable, false, true, _damagedList, false);
	for (var d = 0; d < _damagedCount; ++d) {
		var _damaged = _damagedList[|d];
		if (_damaged.mIsAlive) {
			_damaged.mHitPoints -= mDamage;
		}
	}
	ds_list_destroy(_damagedList);
	
	var _otherBombs = ds_list_create();
	var _bombCount = collision_circle_list(x, y, 64, oBomb, false, true, _otherBombs, false);
	for (var b = 0; b < _bombCount; ++b) {
		var _bomb = _otherBombs[|b];
		_bomb.mFuse -= 100;
	}
	ds_list_destroy(_otherBombs);
	
	instance_create_layer(x, y, "Instances", obj_explosion_1);
	instance_destroy();
}
#endregion

#region Movement
if (mMovementTimer-- == 0)
{
	speed = 0;	
}
else
{
	mAltitude = max(0, mAltitude - 1.8);
	if (mAltitude == 0 && speed > 0)
	{
		var _delta = hspeed > 0 ? -15 : 15;
		image_angle += _delta;
	}
	else image_angle = 0;
}
#endregion

#region Animation
var _fusePercent = mFuse / mMaxFuse * 100;
mBlinkTimer -= 1;
if (mBlinkTimer < 0 && _fusePercent < 50) {
	image_blend = image_blend == c_white ? c_red : c_white;
	if (_fusePercent > 30) {
		mBlinkTimer = 15;
	} else if (_fusePercent > 20) {
		mBlinkTimer = 10
	} else if (_fusePercent > 10) {
		mBlinkTimer = 5
	} else {
		mBlinkTimer = 2;
	}
}
#endregion

#region Collision
if (mAltitude < 8) {
	var _oldImageAngle = image_angle;
	image_angle = 0;
	if(place_meeting(x + hspeed, y, oCollision)) {
		while(!place_meeting(x + sign(hspeed), y, oCollision)){ x += sign(hspeed) };
		//hspeed = 0;
		hspeed *= -0.5;
	}
	if(place_meeting(x, y + vspeed, oCollision)) {
		while(!place_meeting(x, y + sign(vspeed), oCollision)){ y += sign(vspeed) };
		//vspeed = 0;
		vspeed *= -0.5;
	}
	image_angle = _oldImageAngle;
}
#endregion

var collisionCheck = collision_circle(x, y, 8, oBomb, false, true);
if (noone != collisionCheck)
{
	// TODO : Deflection
}
