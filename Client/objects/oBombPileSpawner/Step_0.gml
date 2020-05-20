/// @description Check to respawn
if (noone != mBombPile && !instance_exists(mBombPile))
{
	alarm[0] = room_speed * 5;
	mBombPile = noone;
}
