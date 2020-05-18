/// @description Lobby_SerializeHandshake
/// @arg0 paramsMap

var _id = argument0[?"id"];
var _password = argument0[?"password"];
var _device_uuid = argument0[?"device_uuid"];
var _protocolVersion = argument0[?"protocolVersion"];

var requestSize = 10 + string_length(_id) + string_length(_password) + string_length(_device_uuid);
var request = buffer_create(requestSize, buffer_fixed, 1);
buffer_seek(request, buffer_seek_start, 0);

buffer_write(request, buffer_u8, LOBBY.HANDSHAKE);
buffer_write(request, buffer_u32, requestSize);

buffer_write(request, buffer_u8, string_length(_id));
for(var i = 1; i <= string_length(_id); ++i)
{
	buffer_write(request, buffer_u8, string_ord_at(_id, i));
}

buffer_write(request, buffer_u8, string_length(_password));
for(var i = 1; i <= string_length(_password); ++i)
{
	buffer_write(request, buffer_u8, string_ord_at(_password, i));
}

buffer_write(request, buffer_u8, string_length(_device_uuid));
for(var i = 1; i <= string_length(_device_uuid); ++i)
{
	buffer_write(request, buffer_u8, string_ord_at(_device_uuid, i));
}

buffer_write(request, buffer_u8, _protocolVersion);
buffer_write(request, buffer_u8, 1); // Game Version

return request;
