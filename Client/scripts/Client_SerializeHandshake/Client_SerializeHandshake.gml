/// @description Client_SerializeHandshake
/// @arg0 paramsMap
var _size = 8;
var _request = buffer_create(_size, buffer_fixed, 1);

buffer_seek(_request, buffer_seek_start, 0);

buffer_write(_request, buffer_u8, CLIENT_MESSAGE_ID.HANDSHAKE); // packetID
buffer_write(_request, buffer_u32, _size); // size
buffer_write(_request, buffer_u8, argument0[?"protocolVersion"]); // Protocol Version
buffer_write(_request, buffer_u16, argument0[?"token"]); // Token provided by authentication server

return _request;
