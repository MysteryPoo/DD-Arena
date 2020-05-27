/// @description Lobby_DeserializeLobbyPlayer
/// @arg0 buffer

var _response = ds_map_create();

_response[?"index"] = buffer_read(argument0, buffer_u8);

var _idLength = buffer_read(argument0, buffer_u8);
var _id = "";
for(var i = 0; i < _idLength; ++i)
{
	_id += chr(buffer_read(argument0, buffer_u8));
}
_response[?"id"] = _id;

var _isReady = buffer_read(argument0, buffer_u8);
_response[?"isReady"] = _isReady == 1 ? true : false;

return _response;
