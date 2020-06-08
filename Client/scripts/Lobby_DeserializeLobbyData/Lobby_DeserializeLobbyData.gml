/// @description Lobby_DeserializeLobbyData
/// @arg0 buffer

var _response = ds_map_create();

_response[?"lobbySize"] = buffer_read(argument0, buffer_u8);
_response[?"maxPlayers"] = buffer_read(argument0, buffer_u8);

var _isPublic = buffer_read(argument0, buffer_u8);
_response[?"isPublic"] = _isPublic == 1 ? true : false;

return _response;
