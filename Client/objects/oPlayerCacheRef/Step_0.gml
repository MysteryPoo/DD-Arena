/// @description Get Cache Data
if(mPlayerInfo == -1 && mId != "") {
	mPlayerInfo = Lobby_GetPlayerInfoFromCache(mId);
} else if (!mIsLoaded && mPlayerInfo != -1) {
	mUsername = mPlayerInfo[?"username"];
	mIsLoaded = true;
}
