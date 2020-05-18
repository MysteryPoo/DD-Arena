/// @description oMainMenu->Step

if(mButtonDemo != noone && mButtonDemo.mIsReleased)
{
	mButtonDemo.mIsReleased = false;
	mButtonDemo.mIsFading = true;
	room_goto(rmDemonstration);
}

if(noone != mButtonOnline && mButtonOnline.mIsReleased)
{
	mButtonOnline.mIsReleased = false;
	mButtonOnline.mIsFading = true;
	room_goto(rmOnline);
}
