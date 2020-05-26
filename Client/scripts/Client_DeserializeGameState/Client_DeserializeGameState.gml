/// @description Client_DeserializeGameState
/// @arg0 buffer

var _response = ds_map_create();

_response[?"gameState"] = buffer_read(argument0, buffer_u8);
_response[?"metaData"] = buffer_read(argument0, buffer_u8);

return _response;
