/// @description Lobby_SerializeStartGame

var requestSize = 5;
var request = buffer_create(requestSize, buffer_fixed, 1);
buffer_seek(request, buffer_seek_start, 0);

buffer_write(request, buffer_u8, LOBBY.STARTGAME);
buffer_write(request, buffer_u32, requestSize);

return request;
