/// @description GetInstance
/// @arg0 key

var _key = argument0;

if (!ds_map_exists(oNetworkSyncMgr.mSyncMap, _key)) {
	oNetworkSyncMgr.mSyncMap[?_key] = instance_create_layer(room_width * 0.5, room_height * 0.5, "Instances", oDwarf);
}

return oNetworkSyncMgr.mSyncMap[?_key];
