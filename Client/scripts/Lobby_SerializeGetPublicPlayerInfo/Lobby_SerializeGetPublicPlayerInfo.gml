/// @description Lobby_SerializeGetPublicPlayerInfo
/// @arg0 paramsMap

var size = 6 + string_length(argument0[?"id"]);
var request = buffer_create(size, buffer_fixed, 1);
buffer_seek(request, buffer_seek_start, 0);

buffer_write(request, buffer_u8, LOBBY.GETPUBLICPLAYERINFO);
buffer_write(request, buffer_u32, size);

buffer_write(request, buffer_u8, string_length(argument0[?"id"]));
for(var i = 1; i <= string_length(argument0[?"id"]); ++i)
{
	buffer_write(request, buffer_u8, string_ord_at(argument0[?"id"], i));
}

return request;
