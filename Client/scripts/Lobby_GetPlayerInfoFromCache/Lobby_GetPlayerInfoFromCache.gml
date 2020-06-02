/// @description Lobby_GetPlayerInfoFromCache
/// @arg0 id
/// @return Reference to a ds_map containing information about the player

if(!instance_exists(oPlayerCache)) return -1;

var playerInfo = oPlayerCache.mCache[?argument0];

if(undefined == playerInfo)
{
	oPlayerCache.mCache[?argument0] = -1;
	ds_list_add(oPlayerCache.mRequestQueue, argument0);
}
else if(-1 != playerInfo)
{
	return playerInfo;
}

return -1;
