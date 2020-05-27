/// @description Lobby_SerializeLobbyPlayer
/// @arg0 paramsMap

var isReady = argument0[?"isReady"] ? 1 : 0;
var leaveLobby = argument0[?"leaveLobby"] ? 1 : 0;

var requestSize = 6;
var request = buffer_create(requestSize, buffer_fixed, 1);
buffer_seek(request, buffer_seek_start, 0);

buffer_write(request, buffer_u8, LOBBY.LOBBYPLAYER);
buffer_write(request, buffer_u32, requestSize);
var _mask = (leaveLobby << 1) | isReady;
buffer_write(request, buffer_u8, _mask);

return request;
