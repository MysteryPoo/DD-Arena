/// @description Handle Challenge

var _request = Client_SerializeHandshake(mProtocolVersion, mToken);
var _success = SendPacket(_request);
buffer_delete(_request);
if(!_success) room_goto(rmSplash);
show_debug_message("Client: CONNECTED");
alarm[0] = room_speed * 2; // Begin PINGing
alarm[3] = -1; // Cancel timeout
