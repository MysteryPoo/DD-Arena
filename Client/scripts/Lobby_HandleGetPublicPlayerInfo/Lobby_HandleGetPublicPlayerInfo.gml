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
}

with (oPlayerCacheRef) {
	if (_id == mId) {
		mPlayerInfo = -1;
		mIsLoaded = false;
	}
}

with (oAvatarCacheRef) {
	if (_id == mId) {
		mPlayerInfo = -1;
		mIsLoaded = false;
	}
}
