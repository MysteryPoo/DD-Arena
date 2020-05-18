/// @description Lobby_DeserializeHandshake
/// @arg0 buffer

var response = ds_map_create();

var idLength = buffer_read(argument0, buffer_u8);
var _id = "";
repeat(idLength)
{
	_id += chr(buffer_read(argument0, buffer_u8));
}
response[?"id"] = _id;

var device_uuidLength = buffer_read(argument0, buffer_u8);
var device_uuid = "";
repeat(device_uuidLength)
{
	device_uuid += chr(buffer_read(argument0, buffer_u8));
}
response[?"device_uuid"] = device_uuid;

var usernameLength = buffer_read(argument0, buffer_u8);
var username = "";
repeat(usernameLength)
{
	username += chr(buffer_read(argument0, buffer_u8));
}
response[?"username"] = username;

var last_loginLength = buffer_read(argument0, buffer_u8);
var last_login = "";
repeat(last_loginLength)
{
	last_login += chr(buffer_read(argument0, buffer_u8));
}
response[?"last_login"] = last_login;

return response;
