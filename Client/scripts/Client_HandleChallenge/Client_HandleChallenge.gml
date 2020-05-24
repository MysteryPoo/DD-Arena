/// @description Handle Challenge

var _request = ds_map_create();
_request[?"protocolVersion"] = mProtocolVersion;
_request[?"token"] = mToken;
_request[?"isSpectator"] = false; // TODO : Implement selection to spectate

var _buffer = Client_SerializeHandshake(_request);
var _success = SendPacket(_buffer);
buffer_delete(_buffer);
ds_map_destroy(_request);

if(!_success) room_goto(rmSplash);
show_debug_message("Client: CONNECTED");
alarm[0] = room_speed * 2; // Begin PINGing
alarm[3] = -1; // Cancel timeout
