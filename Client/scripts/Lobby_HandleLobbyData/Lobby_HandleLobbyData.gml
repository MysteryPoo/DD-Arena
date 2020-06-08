/// @description Handle Lobby Data

show_debug_message("LOBBYDATA");
var _lobbyData = Lobby_DeserializeLobbyData(argument0);
				
//inLobby = true;
				
/*var _isLeader = false;
with(mLobbyList)
{
	var _lobbySize = _lobbyData[?"lobbySize"];
						
	mMaxPlayers = _lobbyData[?"maxPlayers"];
	isPublic = _lobbyData[?"isPublic"];
					
	var _listSize = ds_list_size(mPlayerList);
	while(_listSize > _lobbySize)
	{
		instance_destroy(mPlayerList[|(_listSize - 1)]);
		ds_list_delete(mPlayerList, _listSize - 1);
		_listSize = ds_list_size(mPlayerList);
	}
}*/
				
with(oMenuSplash)
{
	if(_lobbyData[?"isPublic"])
	{
		mButtonPublic.mIsEnabled = true;
		mButtonPrivate.mIsEnabled = false;
	}
	else
	{
		mButtonPublic.mIsEnabled = false;
		mButtonPrivate.mIsEnabled = true;
	}
	mButtonPublic.alarm[0] = 1;
	mButtonPrivate.alarm[0] = 1;
	
	mIsPublicLobby = _lobbyData[?"isPublic"];
	mLobbySize = _lobbyData[?"maxPlayers"];
					
	mTextLobbySize.mText = string(_lobbyData[?"maxPlayers"]);
	mButtonIncrease.mIsEnabled = true;
	mButtonIncrease.alarm[0] = 1;
	mButtonDecrease.mIsEnabled = true;
	mButtonDecrease.alarm[0] = 1;
	mButtonStartGame.mIsEnabled = true;
	mButtonStartGame.alarm[0] = 1;
	
	mTextError.mText = "";
}
				
ds_map_destroy(_lobbyData);
		