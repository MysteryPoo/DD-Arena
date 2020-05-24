/// @description Client_DeserializeController
/// @arg0 buffer

var response = ds_map_create();

response[?"key"] = buffer_read(argument0, buffer_u8);

var _flags = buffer_read(argument0, buffer_u8);
response[?"isLeft"] = _flags & 0x80 ? true : false;
response[?"isRight"] = _flags & 0x40 ? true : false;
response[?"isUp"] = _flags & 0x20 ? true : false;
response[?"isDown"] = _flags & 0x10 ? true : false;
response[?"isPrimaryAction"] = _flags & 0x08 ? true : false;
response[?"isSecondaryAction"] = _flags & 0x04 ? true : false;

response[?"pointerX"] = buffer_read(argument0, buffer_u16);
response[?"pointerY"] = buffer_read(argument0, buffer_u16);

return response;
