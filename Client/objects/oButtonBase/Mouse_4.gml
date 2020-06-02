
if(!mIsEnabled)
{
	exit;
}

if(!mIsFading && mIsReady)
{
	mIsPressed = true;
	mIsReleased = false;
	mIsFading = true;
	alarm[0] = room_speed * 2; // Reset after two seconds
}
