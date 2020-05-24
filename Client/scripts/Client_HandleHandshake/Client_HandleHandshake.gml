/// @description Handle Handshake
/// @arg0 data
var _response = Client_DeserializeHandshake(argument0);
if(_response[?"result"] == 0)
{
	show_debug_message("Client: HANDSHAKE : SUCCESS");
}
else
{
	show_debug_message("Client: HANDSHAKE : FAILURE");
	instance_destroy();
}

ds_map_destroy(_response);
