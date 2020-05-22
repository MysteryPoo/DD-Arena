/// @description Behavior
with (oControllerMgr.mControllers[mControllerId])
{
	mPointerX = iPlayer1.x;
	mPointerY = iPlayer1.y;
	
	var _distance = point_distance(iPlayer1.x, iPlayer1.y, iPlayer2.x, iPlayer2.y);
	if (_distance > 300) {
		if (iPlayer1.x < iPlayer2.x) {
			mIsLeft = true;
			mIsRight = false;
		} else {
			mIsRight = true;
			mIsLeft = false;
		}
		
		if (iPlayer1.y > iPlayer2.y) {
			mIsDown = true;
			mIsUp = false;
		} else {
			mIsUp = true;
			mIsDown = false;
		}
	} else if (_distance > 200) {
		
	} else {
		if (iPlayer1.x > iPlayer2.x) {
			mIsLeft = true;
			mIsRight = false;
		} else {
			mIsRight = true;
			mIsLeft = false;
		}
		
		if (iPlayer1.y < iPlayer2.y) {
			mIsDown = true;
			mIsUp = false;
		} else {
			mIsUp = true;
			mIsDown = false;
		}
	}
}
