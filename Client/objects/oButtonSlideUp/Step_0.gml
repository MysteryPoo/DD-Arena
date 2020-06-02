/// @description 
event_inherited();

if(!mIsReady && !mIsFading)
{
	y = room_height - (room_height - mTargetY) * dsin(mTimer);
	mTimer += 5;
	if(mTimer >= 90)
	{
		mTimer = 90;
		mIsReady = true;
	}
}
if(mIsReady && mIsFading)
{
	
	y = room_height - (room_height - mTargetY) * dsin(mTimer);
	mTimer -= 5;
	if(mTimer <= 0)
	{
		mIsReady = false;
		visible = false;
	}
}
