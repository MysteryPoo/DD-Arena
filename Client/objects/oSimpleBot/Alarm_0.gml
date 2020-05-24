/// @description Ready bomb

alarm[1] = room_speed * 2 * 0.9;

with(oControllerMgr.mControllerMap[mControllerId])
{
	mIsPrimaryAction = true;
}
