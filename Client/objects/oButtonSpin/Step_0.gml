/// @description 
event_inherited();

if(!mIsReady && !mIsFading)
{
	image_angle = 360 * dsin(mTimer);
	mTimer += 5;
	if(mTimer >= 90)
	{
		mTimer = 90;
		mIsReady = true;
		image_angle = 0;
	}
}
if(mIsReady && mIsFading)
{
	
	image_angle = 360 * dsin(mTimer);
	mTimer -= 5;
	if(mTimer <= 0)
	{
		mIsReady = false;
		visible = false;
	}
}
