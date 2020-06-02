/// @description Lobby_DeserializeGetPublicPlayerInfo
/// @arg0 buffer

var response = ds_map_create();

var idLength = buffer_read(argument0, buffer_u8);
var _id = "";
repeat(idLength)
{
	_id += chr(buffer_read(argument0, buffer_u8));
}
response[?"id"] = _id;

var usernameLength = buffer_read(argument0, buffer_u8);
var username = "";
repeat(usernameLength)
{
	username += chr(buffer_read(argument0, buffer_u8));
}
response[?"username"] = username;

var avatarURILength = buffer_read(argument0, buffer_u8);
var avatarURI = "";
repeat(avatarURILength)
{
	avatarURI += chr(buffer_read(argument0, buffer_u8));
}
response[?"avatarURI"] = avatarURI;

var diceURILength = buffer_read(argument0, buffer_u8);
var diceURI = "";
repeat(diceURILength)
{
	diceURI += chr(buffer_read(argument0, buffer_u8));
}
response[?"diceURI"] = diceURI;

response[?"rank"] = buffer_read(argument0, buffer_u8);

return response;
