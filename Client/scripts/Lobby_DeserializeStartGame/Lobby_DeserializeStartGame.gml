/// @description Lobby_DeserializeStartGame
/// @arg0 buffer

var response = ds_map_create();

var domainLength = buffer_read(argument0, buffer_u8);
var domain = "";
repeat(domainLength)
{
	domain += chr(buffer_read(argument0, buffer_u8));
}
response[?"domain"] = domain;
response[?"port"] = buffer_read(argument0, buffer_u16);
response[?"token"] = buffer_read(argument0, buffer_u16);

return response;
