/// @description Client_DeserializeSyncPosition
/// @arg0 buffer

var _resultsMap = ds_map_create();
_resultsMap[?"key"] = buffer_read(argument0, buffer_u8);
_resultsMap[?"x"] = buffer_read(argument0, buffer_u16);
_resultsMap[?"y"] = buffer_read(argument0, buffer_u16);
_resultsMap[?"hitPoints"] = buffer_read(argument0, buffer_u8);

return _resultsMap;

