/// @description oMainMenu->Step

if(noone != mButtonOnline && mButtonOnline.mIsReleased)
{
	mButtonOnline.mIsReleased = false;
	mButtonOnline.mIsFading = true;
	room_goto(rmOnline);
}
