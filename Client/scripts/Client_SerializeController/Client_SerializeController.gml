/// @description Client_SerializeController
/// @arg0 paramsMap

var _packetSize = 10;
var _request = buffer_create(_packetSize, buffer_fixed, 1);
buffer_seek(_request, buffer_seek_start, 0);

buffer_write(_request, buffer_u8, CLIENT_MESSAGE_ID.CONTROLLER);
buffer_write(_request, buffer_u32, _packetSize);

var _flags = 0;
_flags |= argument0[?"isLeft"] ? 0x80 : 0x00;
_flags |= argument0[?"isRight"] ? 0x40 : 0x00;
_flags |= argument0[?"isUp"] ? 0x20 : 0x00;
_flags |= argument0[?"isDown"] ? 0x10 : 0x00;
_flags |= argument0[?"isPrimaryAction"] ? 0x08 : 0x00;
_flags |= argument0[?"isSecondaryAction"] ? 0x04 : 0x00;
buffer_write(_request, buffer_u8, _flags);

buffer_write(_request, buffer_u16, argument0[?"pointerX"]);
buffer_write(_request, buffer_u16, argument0[?"pointerY"]);

return _request;
