/// @description oMainMenu->Step

if(mButtonDemo != noone && mButtonDemo.mIsReleased)
{
	mButtonDemo.mIsReleased = false;
	mButtonDemo.mIsFading = true;
	room_goto(rmDemonstration);
}
