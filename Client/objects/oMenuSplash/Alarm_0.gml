/// @description DELETE THIS

alarm[0] = room_speed * 2;

var _buffer = Lobby_SerializeStartGame();
with (oLobbyClient) SendPacket(_buffer);

buffer_delete(_buffer);
