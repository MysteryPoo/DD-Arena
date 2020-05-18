/// @description Lobby_DeserializeChallenge
/// @arg0 buffer

var _response = ds_map_create();

var _saltLength = buffer_read(argument0, buffer_u8);
var _salt = "";
repeat(_saltLength)
{
	_salt += chr(buffer_read(argument0, buffer_u8));
}
_response[?"salt"] = _salt;

show_debug_message("Salt: " + _salt);

return _response;
