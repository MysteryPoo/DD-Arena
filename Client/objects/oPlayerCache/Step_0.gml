/// @description oPlayerCache->Step

if(ds_list_size(mRequestQueue) > 0)
{
	var request = mRequestQueue[|0];
	ds_list_delete(mRequestQueue, 0);
	if(-1 == mCache[?request])
	{
		with(oLobbyClient)
		{
			var paramsMap = ds_map_create();
			paramsMap[?"id"] = request;
			var playerInfo = Lobby_SerializeGetPublicPlayerInfo(paramsMap);
			SendPacket(playerInfo);
			buffer_delete(playerInfo);
			ds_map_destroy(paramsMap);
		}
	}
}
