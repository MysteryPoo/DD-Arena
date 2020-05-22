/// @description Handle Sync Position
/// @arg0 data
var _response = Client_DeserializeSyncPosition(argument0);

var _objectId = _response[?"instanceId"];
var _x = _response[?"x"];
var _y = _response[?"y"];

with(_objectId)
{
	x = _x;
	y = _y;
}

ds_map_destroy(_response);
