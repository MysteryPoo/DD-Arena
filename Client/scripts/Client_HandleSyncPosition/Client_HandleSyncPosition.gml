/// @description Handle Sync Position
/// @arg0 data
var _response = Client_DeserializeSyncPosition(argument0);

var _key = _response[?"key"];
var _x = _response[?"x"];
var _y = _response[?"y"];

with (oNetworkSyncMgr.mSyncMap[?_key]) {
	x = _x;
	y = _y;
}

ds_map_destroy(_response);
