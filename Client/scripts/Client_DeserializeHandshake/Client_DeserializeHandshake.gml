/// @description Client_DeserializeHandshake
/// @arg0 buffer

var _resultsMap = ds_map_create();
_resultsMap[?"result"] = buffer_read(argument0, buffer_u8);
_resultsMap[?"index"] = buffer_read(argument0, buffer_u8);

return _resultsMap;

