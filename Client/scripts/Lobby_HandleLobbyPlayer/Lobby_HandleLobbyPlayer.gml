/// @description Handle Lobby Player

show_debug_message("LOBBYPLAYER");
var _lobbyPlayer = Lobby_DeserializeLobbyPlayer(argument0);
/*
with(mLobbyList)
{
	while(ds_list_size(mPlayerList) < _lobbyPlayer[?"index"] + 1)
	{
		var _x = mPlayerPositionX[_lobbyPlayer[?"index"]];
		var _y = mPlayerPositionY[_lobbyPlayer[?"index"]];
		ds_list_add(mPlayerList, instance_create_layer(_x, _y, "Instances", oLobbyUser));
	}
	var _player = mPlayerList[|_lobbyPlayer[?"index"]];
	_player.mIndex = _lobbyPlayer[?"index"];
	_player.mId = _lobbyPlayer[?"id"];
	_player.isReady = _lobbyPlayer[?"isReady"];
	// Invalidate in case we are overwriting
	_player.mPlayerInfo = -1;
	_player.mAvatarSprite = -1;
	_player.isLoaded = false;
					
	var _allReady = true;
	for(var i = 0; i < ds_list_size(mPlayerList); ++i)
	{
		if(mPlayerList[|i].isReady == false) _allReady = false;
	}
	if(oDashboardMenu.mStartGameButton != noone)
	{
		if(_allReady)
		{
			oDashboardMenu.mStartGameButton.mText = "START";
		}
		else
		{
			oDashboardMenu.mStartGameButton.mText = "READY";
		}
		oDashboardMenu.mStartGameButton.isEnabled = true;
	}
}
			*/	
ds_map_destroy(_lobbyPlayer);
