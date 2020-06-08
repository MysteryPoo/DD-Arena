/// @description Check to respawn
if (noone != mBombPile && !instance_exists(mBombPile))
{
	alarm[0] = room_speed * 15;
	mBombPile = noone;
}
