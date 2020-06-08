/// @description oMainMenu->Step

#region Create a Lobby
if (mNeedToJoinALobby && oLobbyClient.mIsAuth) {
	mNeedToJoinALobby = false;
	
	#region Create a personal Lobby
	var _request = ds_map_create();
	_request[?"isPublic"] = false;
	_request[?"numPlayers"] = 1;
	
	var _buffer = Lobby_SerializeNewLobby(_request);
	with (oLobbyClient) SendPacket(_buffer);
	
	ds_map_destroy(_request);
	buffer_delete(_buffer);
	#endregion
}
#endregion

#region Multiplayer Button
if(noone != mButtonOnline && mButtonOnline.mIsReleased)
{
	mButtonOnline.mIsReleased = false;
	mButtonOnline.mIsFading = true;
	mButtonOnline.mIsEnabled = false;
	
}
#endregion

#region Start Game Button
if (noone != mButtonStartGame && mButtonStartGame.mIsReleased) {
	mButtonStartGame.mIsReleased = false;
	mButtonStartGame.mIsFading = true;
	mButtonStartGame.mIsEnabled = false;
	
	var _buffer = Lobby_SerializeStartGame();
	with (oLobbyClient) SendPacket(_buffer);

	buffer_delete(_buffer);
}
#endregion

#region Ready Button
if (mButtonReady.mIsReleased) {
	mButtonReady.mIsReleased = false;
	mButtonReady.mIsFading = true;
	
	var _request = ds_map_create();
	_request[?"isReady"] = false;
	_request[?"leaveLobby"] = false;
	
	var _buffer = Lobby_SerializeLobbyPlayer(_request);
	
	with(oLobbyClient) SendPacket(_buffer);
	
	ds_map_destroy(_request);
	buffer_delete(_buffer);
}
#endregion

#region Not Ready Button
if (mButtonNotReady.mIsReleased) {
	mButtonNotReady.mIsReleased = false;
	mButtonNotReady.mIsFading = true;
	
	var _request = ds_map_create();
	_request[?"isReady"] = true;
	_request[?"leaveLobby"] = false;
	
	var _buffer = Lobby_SerializeLobbyPlayer(_request);
	
	with(oLobbyClient) SendPacket(_buffer);
	
	ds_map_destroy(_request);
	buffer_delete(_buffer);
}
#endregion

#region Private Button
if (noone != mButtonPrivate && mButtonPrivate.mIsReleased) {
	mButtonPrivate.mIsReleased = false;
	mButtonPrivate.mIsFading = true;
	mButtonPrivate.mIsEnabled = false;
	
	var _request = ds_map_create();
	_request[?"isPublic"] = true;
	_request[?"maxPlayers"] = mLobbySize;
	
	var _buffer = Lobby_SerializeLobbyData(_request);
	with (oLobbyClient) SendPacket(_buffer);
	
	ds_map_destroy(_request);
	buffer_delete(_buffer);
}
#endregion

#region Public Button
if (noone != mButtonPublic && mButtonPublic.mIsReleased) {
	mButtonPublic.mIsReleased = false;
	mButtonPublic.mIsFading = true;
	mButtonPublic.mIsEnabled = false;
	
	var _request = ds_map_create();
	_request[?"isPublic"] = false;
	_request[?"maxPlayers"] = mLobbySize;
	
	var _buffer = Lobby_SerializeLobbyData(_request);
	with (oLobbyClient) SendPacket(_buffer);
	
	ds_map_destroy(_request);
	buffer_delete(_buffer);
}
#endregion

#region Increase Lobby Size
if (mButtonIncrease.mIsReleased) {
	mButtonIncrease.mIsReleased = false;
	mButtonIncrease.mIsFading = true;
	mButtonIncrease.mIsEnabled = false;
	
	var _request = ds_map_create();
	_request[?"isPublic"] = mIsPublicLobby;
	_request[?"maxPlayers"] = mLobbySize + 1;
	
	var _buffer = Lobby_SerializeLobbyData(_request);
	with (oLobbyClient) SendPacket(_buffer);
	
	ds_map_destroy(_request);
	buffer_delete(_buffer);
}
#endregion

#region Decrease Lobby Size
if (mButtonDecrease.mIsReleased) {
	mButtonDecrease.mIsReleased = false;
	mButtonDecrease.mIsFading = true;
	mButtonDecrease.mIsEnabled = false;
	
	var _request = ds_map_create();
	_request[?"isPublic"] = mIsPublicLobby;
	_request[?"maxPlayers"] = max(0, mLobbySize - 1);
	
	var _buffer = Lobby_SerializeLobbyData(_request);
	with (oLobbyClient) SendPacket(_buffer);
	
	ds_map_destroy(_request);
	buffer_delete(_buffer);
}
#endregion
