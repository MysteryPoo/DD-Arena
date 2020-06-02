/// @description 
event_inherited();

if(!mIsReady && !mIsFading)
{
	image_xscale = dsin(mTimer);
	image_yscale = image_xscale;
	mTimer += 5;
	if(mTimer >= 90)
	{
		mTimer = 90;
		mIsReady = true;
	}
}
if(mIsReady && mIsFading)
{
	
	image_xscale = dsin(mTimer);
	image_yscale = image_xscale;
	mTimer -= 5;
	if(mTimer <= 0)
	{
		mIsReady = false;
		visible = false;
	}
}
