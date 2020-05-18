
if(!mIsEnabled)
{
	exit;
}

if(!mIsFading && mIsReady)
{
	mIsPressed = true;
	mIsReleased = false;
	alarm[0] = room_speed * 0.5; // Reset after half a second
}
