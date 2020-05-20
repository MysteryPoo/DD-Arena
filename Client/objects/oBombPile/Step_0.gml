/// @description Give Inventory
if (noone != mOwner)
{
	var _xArr = [-8, 8, 0, -10, 6];
	var _yArr = [-8, -8, 0, 8, 8];
	
	for (var b = 0; b < mStackSize; ++b)
	{
		var _x = b < 5 ? x + _xArr[b] : x;
		var _y = b < 5 ? y + _yArr[b] : y;
		var _bomb = instance_create_layer(_x, _y, "Instances", oBombPickup);
		_bomb.alarm[0] = max(0.5, room_speed * 0.1 * b + 1);
		_bomb.mOwner = mOwner;
	}
	
	mOwner.mBombCount += mStackSize;
	
	instance_destroy();
}
