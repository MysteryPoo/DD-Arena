/// @description oMessage->Step

var _newState = false;

if(mState != mPrevState)
{
	_newState = true;
	mPrevState = mState;
}

switch(mState)
{
	case MESSAGE.OPEN:
		if(_newState)
		{
			image_xscale = 0.1;
			image_yscale = 0;
		}
		if(abs(image_yscale - mHeight) > 0.1)
		{
			image_yscale = lerp(image_yscale, mHeight, 0.1);
		}
		else if(abs(image_xscale - mWidth) > 0.1)
		{
			image_yscale = mHeight;
			image_xscale = lerp(image_xscale, mWidth, 0.1);
		}
		else
		{
			image_xscale = mWidth;
			mState = MESSAGE.IDLE;
		}
		break;
	case MESSAGE.IDLE:
		if(_newState)
		{
			mTextAlpha = 0;
		}
		if(1 - mTextAlpha > 0.1)
		{
			mTextAlpha = lerp(mTextAlpha, 1, 0.2);
		}
		else
		{
			mTextAlpha = 1;
		}
		break;
	case MESSAGE.CLOSE:
		if(mTextAlpha > 0.1)
		{
			mTextAlpha = lerp(mTextAlpha, 0, 0.2);
		}
		else if(image_xscale > 0.1)
		{
			mTextAlpha = 0;
			image_xscale = lerp(image_xscale, 0, 0.1);
		}
		else if(image_yscale > 0.1)
		{
			image_xscale = 0.1;
			image_yscale = lerp(image_yscale, 0, 0.1);
		}
		else
		{
			instance_destroy();
			if (noone != mNavId && room_exists(mNavId) && room != mNavId) {
				room_goto(mNavId);
			}
		}
		break;
}
