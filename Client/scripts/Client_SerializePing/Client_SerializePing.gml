/// @description Client_SerializePing

var _packetSize = 13;
var _request = buffer_create(_packetSize, buffer_fixed, 1);

buffer_seek(_request, buffer_seek_start, 0);

buffer_write(_request, buffer_u8, CLIENT_MESSAGE_ID.PING);
buffer_write(_request, buffer_u32, _packetSize);
buffer_write(_request, buffer_u64, current_time);

return _request;
