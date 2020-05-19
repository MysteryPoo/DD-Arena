/// @description Client_DeserializeSyncPosition
/// @arg0 buffer

var _resultsMap = ds_map_create();
_resultsMap[?"objectID"] = buffer_read(argument0, buffer_u32);
_resultsMap[?"x"] = buffer_read(argument0, buffer_u16);
_resultsMap[?"y"] = buffer_read(argument0, buffer_u16);

return _resultsMap;

