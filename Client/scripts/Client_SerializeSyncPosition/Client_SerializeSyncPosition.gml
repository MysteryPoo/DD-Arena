/// @description Client_SerializeSyncPosition
/// @arg0 paramsMap

var _packetSize = 10;
var _request = buffer_create(_packetSize, buffer_fixed, 1);
buffer_seek(_request, buffer_seek_start, 0);

buffer_write(_request, buffer_u8, CLIENT_MESSAGE_ID.SYNCPOSITION);
buffer_write(_request, buffer_u32, _packetSize);

buffer_write(_request, buffer_u8, argument0[?"key"]);
buffer_write(_request, buffer_u16, argument0[?"x"]);
buffer_write(_request, buffer_u16, argument0[?"y"]);

return _request;
