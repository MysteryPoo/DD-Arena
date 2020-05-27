/// @description Lobby_SerializeNewLobby
/// @arg0 paramsMap

var isPublic = argument0[?"isPublic"];
var numPlayers = argument0[?"numPlayers"];

var requestSize = 7;
var request = buffer_create(requestSize, buffer_fixed, 1);
buffer_seek(request, buffer_seek_start, 0);

buffer_write(request, buffer_u8, LOBBY.NEWLOBBY);
buffer_write(request, buffer_u32, requestSize);
buffer_write(request, buffer_u8, isPublic ? 1 : 0);
buffer_write(request, buffer_u8, numPlayers);

return request;
