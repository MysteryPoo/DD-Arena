/// @description Lobby_HandleGetPublicPlayerInfo
show_debug_message("GETPUBLICPLAYERINFO");
var getPublicPlayerInfo = Lobby_DeserializeGetPublicPlayerInfo(argument0);
var _id = getPublicPlayerInfo[?"id"];
if(-1 == oPlayerCache.mCache[?_id])
{
	// Do not destroy getPublicPlayerInfo here
	oPlayerCache.mCache[?_id] = getPublicPlayerInfo;
}
else
{
	// Assuming the server forced an update of the cache
	ds_map_destroy(oPlayerCache.mCache[?_id]);
	oPlayerCache.mCache[?_id] = getPublicPlayerInfo;
	// Invalidate cache for user in lobby
	//with(oLobbyUser)
	//{
	//	if(mId == _id)
	//	{
	//		mPlayerInfo = -1;
	//		mAvatarSprite = -1;
	//		mDiceSprite = -1;
	//		isLoaded = false;
	//	}
	//}
	//// Invalidate friend
	//with(oFriend)
	//{
	//	if(mId == _id)
	//	{
	//		mPlayerInfo = -1;
	//		mAvatarSprite = -1;
	//		mDiceSprite = -1;
	//		isLoaded = false;
	//	}
	//}
	//// Invalidate generic user
	//with(oUser)
	//{
	//	if(mId == _id)
	//	{
	//		mPlayerInfo = -1;
	//		mAvatarSprite = -1;
	//		mDiceSprite = -1;
	//		isLoaded = false;
	//	}
	//}
}
		