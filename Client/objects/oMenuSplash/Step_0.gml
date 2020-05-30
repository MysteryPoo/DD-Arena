/// @description oMainMenu->Step

if(noone != mButtonOnline && mButtonOnline.mIsReleased)
{
	mButtonOnline.mIsReleased = false;
	mButtonOnline.mIsFading = true;
	//room_goto(rmOnline);
	var _request = ds_map_create();
	_request[?"isPublic"] = false;
	_request[?"numPlayers"] = 4;
	
	var _buffer = Lobby_SerializeNewLobby(_request);
	with (oLobbyClient) SendPacket(_buffer);
	
	ds_map_destroy(_request);
	buffer_delete(_buffer);
	
	_request = ds_map_create();
	_request[?"isReady"] = true;
	_request[?"leaveLobby"] = false;
	
	_buffer = Lobby_SerializeLobbyPlayer(_request);
	
	with(oLobbyClient) SendPacket(_buffer);
	
	ds_map_destroy(_request);
	buffer_delete(_buffer);
	
	alarm[0] = room_speed;
	
}
