/// @description Handle Ping
/// @arg0 data
var _response = Client_DeserializePing(argument0);
mLastPing = current_time - _response[?"time"];
ds_map_destroy(_response);
