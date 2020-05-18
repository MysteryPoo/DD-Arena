/// @description Lobby_SerializePing
/// @paramsMap

var time = argument0[?"time"];

var requestSize = 13;
var request = buffer_create(requestSize, buffer_fixed, 1);
buffer_seek(request, buffer_seek_start, 0);

buffer_write(request, buffer_u8, LOBBY.PING);
buffer_write(request, buffer_u32, requestSize);
if(os_browser == browser_not_a_browser)
{
	buffer_write(request, buffer_u64, time);
}
else
{
	buffer_write(request, buffer_u32, time & 0xFFFFFFFF);
	buffer_write(request, buffer_u32, time >> 32);
}
return request;
