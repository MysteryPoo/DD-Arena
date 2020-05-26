/// @description Handle Sync Position
/// @arg0 data
var _response = Client_DeserializeSyncPosition(argument0);

var _key = _response[?"key"];
var _x = _response[?"x"];
var _y = _response[?"y"];
var _hitPoints = _response[?"hitPoints"];

with (oNetworkSyncMgr.mSyncMap[?_key]) {
	mNetworkX = _x;
	mNetworkY = _y;
	mHitPoints = _hitPoints;
}

ds_map_destroy(_response);
