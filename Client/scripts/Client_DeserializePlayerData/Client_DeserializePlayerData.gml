/// @description Client_DeserializePlayerData
/// @arg0 buffer

var _response = ds_map_create();

_response[?"playerKey"] = buffer_read(argument0, buffer_u8);
_response[?"controllerKey"] = buffer_read(argument0, buffer_u8);

var _idLength = buffer_read(argument0, buffer_u8);
var _id = "";
repeat(_idLength)
{
	_id += chr(buffer_read(argument0, buffer_u8));
}
_response[?"id"] = _id;

var _nameLength = buffer_read(argument0, buffer_u8);
var _name = "";
repeat(_nameLength)
{
	_name += chr(buffer_read(argument0, buffer_u8));
}
_response[?"name"] = _name;

_response[?"isAI"] = buffer_read(argument0, buffer_u8) == 0 ? false : true;
_response[?"isMine"] = buffer_read(argument0, buffer_u8) == 0 ? false : true;

return _response;
