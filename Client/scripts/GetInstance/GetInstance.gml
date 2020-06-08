/// @description GetInstance
/// @arg0 key

var _key = argument0;

if (!ds_map_exists(oNetworkSyncMgr.mSyncMap, _key)) {
	// Spawn player... This might move somewhere else
	var _x, _y;
	var _spawnerList = ds_list_create();
	with (oSpawnPoint) { ds_list_add(_spawnerList, id); }
	ds_list_shuffle(_spawnerList);
	var _randomIndex = random_range(0, ds_list_size(_spawnerList) - 1);
	var _spawner = _spawnerList[|_randomIndex];
	ds_list_destroy(_spawnerList);
	
	if (instance_number(oSpawnPoint) == 0) {
		_x = room_width * 0.5;
		_y = room_height * 0.5;
	} else {
		_x = _spawner.x;
		_y = _spawner.y;
	}
	
	oNetworkSyncMgr.mSyncMap[?_key] = instance_create_layer(_x, _y, "Instances", oDwarf);
}

return oNetworkSyncMgr.mSyncMap[?_key];
