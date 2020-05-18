/// @description Client_DeserializePing
/// @arg0 buffer

var _resultsMap = ds_map_create();

_resultsMap[?"time"] = buffer_read(argument0, buffer_u64);

return _resultsMap;
