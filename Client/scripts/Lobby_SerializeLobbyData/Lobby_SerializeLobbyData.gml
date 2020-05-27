/// @description Lobby_SerializeLobbyData
/// @arg0 paramsMap

var isPublic = argument0[?"isPublic"];
var maxPlayers = argument0[?"maxPlayers"];

var requestSize = 7;
var request = buffer_create(requestSize, buffer_fixed, 1);
buffer_seek(request, buffer_seek_start, 0);

buffer_write(request, buffer_u8, LOBBY.LOBBYDATA);
buffer_write(request, buffer_u32, requestSize);
buffer_write(request, buffer_u8, isPublic ? 1 : 0);
buffer_write(request, buffer_u8, maxPlayers);

return request;
