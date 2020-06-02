/// @description 
event_inherited();

if(!mIsReady && !mIsFading)
{
	x = mTargetX * dsin(mTimer);
	mTimer += 5;
	if(mTimer >= 90)
	{
		mTimer = 90;
		mIsReady = true;
	}
}
if(mIsReady && mIsFading)
{
	x = mTargetX * dsin(mTimer);
	mTimer -= 5;
	if(mTimer <= 0)
	{
		mIsReady = false;
		visible = false;
	}
}
