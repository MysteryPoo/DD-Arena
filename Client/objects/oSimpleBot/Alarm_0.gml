/// @description Ready bomb

alarm[1] = room_speed * 2 * 0.9;

with(oControllerMgr.mControllers[mControllerId])
{
	mIsPrimaryAction = true;
}
