/// @description Get Cache Data
if(mPlayerInfo == -1 && mId != "") {
	mPlayerInfo = Lobby_GetPlayerInfoFromCache(mId);
} else if (!mIsLoaded && mPlayerInfo != -1) {
	if(mPlayerInfo[?"avatarURI"] != "0")
	{
		var sprIndex = Lobby_GetAvatarSpriteFromCache(mPlayerInfo[?"avatarURI"]);
		if(-1 != sprIndex)
		{
			mAvatarSprite = sprIndex;
			mAvatarMaxFrames = GetFrameCountFromURI(mPlayerInfo[?"avatarURI"]);
			mAvatarFrame = 0;
			mIsLoaded = true;
		}
	}
}

if(mAvatarMaxFrames > 0)
{
	if(mAvatarFrame < mAvatarMaxFrames)
	{
		mAvatarFrame += sprite_get_speed(mAvatarSprite) / room_speed;
	}
	else
	{
		mAvatarFrame = 0;
	}
}
