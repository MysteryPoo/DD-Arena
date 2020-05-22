/// @description Handle Sync Position
/// @arg0 data
var _response = Client_DeserializeSyncPosition(argument0);

var _objectId = _response[?"instanceId"];
var _x = _response[?"x"];
var _y = _response[?"y"];

with(_objectId)
{
	var _newX = (x + _x) * 0.5;
	var _newY = (y + _y) * 0.5;
	x = _newX;
	y = _newY;
}

ds_map_destroy(_response);
