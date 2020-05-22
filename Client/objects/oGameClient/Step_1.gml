/// @description Camera
if (mIndexOnServer >= 0)
{
	if (array_length_1d(oControllerMgr.mControllers) > mIndexOnServer)
	{
		var _follow = oControllerMgr.mControllers[mIndexOnServer];
		if (instance_exists(_follow))
		{
			x = _follow.x;
			y = _follow.y;
		}
	}
}
