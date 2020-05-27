/// @description Lobby_DeserializeJoinLobby
/// @arg0 buffer

var _response = ds_map_create();

var errorLength = buffer_read(argument0, buffer_u8);
var error = "";
repeat(errorLength)
{
	error += chr(buffer_read(argument0, buffer_u8));
}
_response[?"error"] = error;

return _response;
