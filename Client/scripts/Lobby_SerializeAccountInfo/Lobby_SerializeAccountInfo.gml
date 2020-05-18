/// @description Lobby_SerializeAccountInfo
/// @arg0 paramsMap

var _size = 6 + string_length(argument0[?"username"]);
var _request = buffer_create(_size, buffer_fixed, 1);
buffer_seek(_request, buffer_seek_start, 0);

buffer_write(_request, buffer_u8, LOBBY.ACCOUNTINFO);
buffer_write(_request, buffer_u32, _size);

buffer_write(_request, buffer_u8, string_length(argument0[?"username"]));
for(var i = 1; i <= string_length(argument0[?"username"]); ++i)
{
	buffer_write(_request, buffer_u8, string_ord_at(argument0[?"username"], i));
}

return _request;
